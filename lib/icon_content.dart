import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {


  final IconData iconx;
  final String textx;

  const IconContent({@required this.iconx,@required this.textx});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconx,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textx,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8d8e98),
          ),
        )
      ],
    );
  }
}