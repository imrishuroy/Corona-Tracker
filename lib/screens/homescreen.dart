import 'package:corona_tracker/screens/show_alert.dart';
import 'package:corona_tracker/widgets/data_card.dart';
import 'package:corona_tracker/widgets/top_contents.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  String activeCase;
  String confirmed;
  String recovered;
  String deaths;

  @override
  void initState() {
    super.initState();
    fetchIndiaAPI();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  fetchIndiaAPI() async {
    setState(() {});
    // var url = 'https://api.covid19api.com/total/country/india';
    var url = 'https://api.covid19api.com/total/country/india';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      //    print('last${jsonResponse.last['Active']}');

      setState(() {
        activeCase = jsonResponse.last['Active'].toString();
        confirmed = jsonResponse.last['Confirmed'].toString();
        recovered = jsonResponse.last['Recovered'].toString();
        deaths = jsonResponse.last['Deaths'].toString();
      });
    }
  }

  fetchAPI() async {
    // to dismiss keyboard
    // setState(() {});

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    print(_searchController.text);

    // var url = 'https://api.covid19api.com/total/country/india';

    try {
      var url = 'https://api.covidindiatracker.com/state_data.json';

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);

        for (var value in jsonResponse) {
          //  print('I got excequeted');
          // print(value);
          if (_searchController.text == value['state']) {
            setState(() {
              activeCase = value['active'].toString();
              confirmed = value['confirmed'].toString();
              recovered = value['recovered'].toString();
              deaths = value['deaths'].toString();
            });
          }
          // else if (_searchController.text != value['state']) {
          //   setState(() {
          //     activeCase = '(<:>)';
          //     confirmed = '[?]';
          //     recovered = '{+}';
          //     deaths = '):';
          //   });
          // }
        }
      } else {
        setState(() {
          activeCase = '(<:>)';
          confirmed = '[?]';
          recovered = '{+}';
          deaths = '):';
        });
        showAlertDialog(
          context: context,
          title: 'Unknown Error',
          content: 'Please contact support or try again later',
          defaultActionText: 'OK',
        );
      }
    } on SocketException catch (_) {
      setState(() {
        activeCase = '(<:>)';
        confirmed = '[?]';
        recovered = '{+}';
        deaths = '):';
      });

      showAlertDialog(
        context: context,
        title: 'Connection Error',
        content: 'Could\'t retrieve data, Please try again',
        defaultActionText: 'OK',
      );
    } catch (_) {
      setState(() {
        activeCase = '(<:>)';
        confirmed = '[?]';
        recovered = '{+}';
        deaths = '):';
      });
      showAlertDialog(
        context: context,
        title: 'Unknown Error',
        content: 'Please contact support or try again later',
        defaultActionText: 'OK',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopContents(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: TextField(
                      onSubmitted: (state) {
                        _searchController.text = state;
                        fetchAPI();
                      },
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search State e.g. Bihar',
                        alignLabelWithHint: true,
                        hoverColor: Colors.green,
                        focusColor: Colors.green,
                        fillColor: Colors.green,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 30.0),
                  iconSize: 42.0,
                  icon: Icon(
                    Icons.search,
                    color: Color(0xff1DB954),
                  ),
                  onPressed: fetchAPI,
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DataCard(
                  label: 'ACTIVE',
                  data: activeCase,
                  color: Colors.blue,
                ),
                DataCard(
                  label: 'CONFIRMED',
                  data: confirmed,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DataCard(
                  label: 'RECOVERED',
                  data: recovered,
                  color: Colors.green,
                ),
                DataCard(
                  label: 'DEATHS',
                  data: deaths,
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
