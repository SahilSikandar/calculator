import 'package:calculator/constants_c.dart';
import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  final Color colors;
  final VoidCallback onpress;
  const MyButton({Key? key,required this.text,required this.colors,required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(
        onTap: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
           // width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors,
            ),
            child: Center(child: Text(text,style: TextStyle(
              color: ktextColor,
              fontWeight: FontWeight.bold,
              fontSize: 19
            ),)),
          ),
        ),
      ),
    );
  }
}

