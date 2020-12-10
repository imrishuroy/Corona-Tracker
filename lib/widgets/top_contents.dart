import 'package:corona_tracker/screens/health_care.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250.0,
          width: double.infinity,
          child: Image.asset(
            'assets/cover.png',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 26.0,
                      top: 10.0,
                      right: 12.0,
                    ),
                    child: Text(
                      'India',
                      style: GoogleFonts.harmattan(
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/flag.png'),
                      ),
                    ),
                    height: 80,
                    width: 40,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, HealthCare.routeName);
              },
              splashColor: Color(0xffd2f6c5),
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  'More',
                  style: GoogleFonts.harmattan(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 26.0,
          ),
          child: Text(
            'COVID-19',
            //textAlign: TextAlign.start,
            style: GoogleFonts.harmattan(
              textStyle: TextStyle(
                fontSize: 30.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Text(
            'Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.',
            style: GoogleFonts.sourceSansPro(
              fontSize: 17.5,
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}

//\nMost people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment
