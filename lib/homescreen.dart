import 'package:calculator_app/components/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: answer == ''
                          ? Text(
                              userInput.toString(),
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.white),
                            )
                          : Text(
                              userInput.toString(),
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.grey),
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Mybutton(
                            title: 'AC',
                            onPress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '+/-',
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '/',
                            onPress: () {
                              userInput += '/';
                              setState(() {});
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: 'x',
                            onPress: () {
                              userInput += 'x';
                              setState(() {});
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '-',
                            onPress: () {
                              userInput += '-';
                              setState(() {});
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '3',
                            onPress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '+',
                            onPress: () {
                              userInput += '+';
                              setState(() {});
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: 'DEL',
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '=',
                            onPress: () {
                              equalPress();
                              setState(() {});
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);

    answer = eval.toString();
  }
}
