import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key, required this.title, required this.image});
  final String image;
  final String title;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 8),
      child: Column(
        children: [
        Container(
          height: 80,
          width: 100,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              widget.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
