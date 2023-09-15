import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Operators with ChangeNotifier {
  String _input = '';
  String get input => _input;
  set input(String input) {
    _input = input;
    notifyListeners();
  }

  String output = '';
  String previousAnswer = '';
  bool onCalc = false;
  Operators();

  void equalPress() {
    try {
      final finalUserinput = input.replaceAll('x', '*');
      Parser p = Parser();
      Expression expression = p.parse(finalUserinput);
      double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
      output = eval.toStringAsPrecision(2);
      notifyListeners();
    } catch (e) {
      output = 'Error';
    }
  }
}
