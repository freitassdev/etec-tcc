import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 2,
          color: Colors.white,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}