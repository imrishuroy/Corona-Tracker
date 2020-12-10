import 'package:corona_tracker/widgets/card_view.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class HealthCare extends StatelessWidget {
  static String routeName = 'care-page';

  _getWebPage() async {
    const url =
        'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Can\'t launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffdfb),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 23.0, vertical: 10.0),
                child: Text(
                  'Protect Yourself',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 31.0,
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Text(
                  'If COVID-19 is spreading in your community, stay safe by taking some simple precautions, such as physical distancing, wearing a mask, keeping rooms well ventilated, avoiding crowds, cleaning your hands, and coughing into a bent elbow or tissue. Check local advice where you live and work.',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 17.5,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Text(
                  'SYMPTOMS',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              CardView(
                imageUrl: 'fever.jpg',
                title: 'Fever',
                subTitle: 'Covid-19 may lead you to high fever.',
                cardColor: Color(0xfffceef5),
              ),
              CardView(
                imageUrl: 'dry-cough.jpg',
                title: 'Dry Cough',
                subTitle: 'You may face difficulties in breathing.',
                cardColor: Color(0xfffceef5),
              ),
              CardView(
                imageUrl: 'tiredness.jpg',
                title: 'Tiredness',
                subTitle: 'You may feel tired all the time.',
                cardColor: Color(0xfffceef5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                child: Text(
                  'SAFETY MEASURES',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              CardView(
                imageUrl: 'handwash.png',
                title: 'Regular Handwash',
                subTitle:
                    'Clean your hands often. Use soap and water, or an alcohol-based hand rub.',
                cardColor: Color(0xffc3f584),
              ),
              CardView(
                imageUrl: 'mask.jpg',
                title: 'Wear Mask',
                subTitle:
                    'Wear a mask when physical distancing is not possible',
                cardColor: Color(0xffc3f584),
              ),
              CardView(
                imageUrl: 'safe.png',
                title: 'Maintance Distance',
                subTitle:
                    'Maintain a safe distance from anyone who is coughing or sneezing',
                cardColor: Color(0xffc3f584),
              ),
              InkWell(
                onTap: _getWebPage,
                splashColor: Color(0xffeffffb),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23.0,
                    vertical: 5.0,
                  ),
                  child: Text(
                    'Learn more at who.in',
                    style: GoogleFonts.harmattan(
                      fontSize: 25.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
