import 'package:flutter/material.dart';

const estyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF808E98),
);

class cardContent extends StatelessWidget {

  cardContent(this.econ,this.str);

  final String str;
  final IconData econ;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          econ,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          str,
          style: estyle,
        )
      ],
    );
  }
}