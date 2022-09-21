import 'dart:math';

import 'package:calculator/button.dart';
import 'package:calculator/constants_c.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userinout = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userinout.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                              text: 'AC',
                              onpress: () {
                                userinout = '';
                                answer = '';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '+/-',
                              onpress: () {},
                              colors: kButtoncolor2),
                          MyButton(
                              text: '%',
                              onpress: () {
                                userinout += '%';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '/',
                              onpress: () {
                                userinout += '/';
                                setState(() {});
                              },
                              colors: kButtoncolor),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              text: '7',
                              onpress: () {
                                userinout += '7';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '8',
                              onpress: () {
                                userinout += '8';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '9',
                              onpress: () {
                                userinout += '9';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: 'x',
                              onpress: () {
                                userinout += 'x';
                                setState(() {});
                              },
                              colors: kButtoncolor),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              text: '4',
                              onpress: () {
                                userinout += '4';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '5',
                              onpress: () {
                                userinout += '5';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '6',
                              onpress: () {
                                userinout += '6';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '-',
                              onpress: () {
                                userinout += '-';
                                setState(() {});
                              },
                              colors: kButtoncolor),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              text: '1',
                              onpress: () {
                                userinout += '1';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '2',
                              onpress: () {
                                userinout += '2';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '3',
                              onpress: () {
                                userinout += '3';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '+',
                              onpress: () {
                                userinout += '+';
                                setState(() {});
                              },
                              colors: kButtoncolor),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              text: '0',
                              onpress: () {
                                userinout += '0';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '.',
                              onpress: () {
                                userinout += '.';
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: 'DEL',
                              onpress: () {
                                userinout = userinout.substring(
                                    0, userinout.length - 1);
                                setState(() {});
                              },
                              colors: kButtoncolor2),
                          MyButton(
                              text: '=',
                              onpress: () {
                                //userinout += '=';
                                equalpress();
                                setState(() {});
                              },
                              colors: kButtoncolor),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void equalpress() {
    String finaluserinput = userinout.replaceAll('x', '*');
    Parser parser = Parser();
    Expression e = parser.parse(finaluserinput);
    ContextModel c = ContextModel();
    double eval = e.evaluate(EvaluationType.REAL, c);
    answer = eval.toString();
  }
}
