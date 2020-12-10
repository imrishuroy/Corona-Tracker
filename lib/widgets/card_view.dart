import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final Color cardColor;

  const CardView(
      {Key key, this.imageUrl, this.title, this.subTitle, this.cardColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/$imageUrl',
                fit: BoxFit.cover,
                width: 70.0,
                height: 300.0,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
