import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String history = "";
  String expression = "";

  String get getHistory => history;
  String get getExpression => expression;

  bool flag = false;
  bool flag1 = false;
  bool flagclearexp = false;
  bool flagdot = false;

  numClick(String text, BuildContext context) {
    String temp = expression + text;
    int numofDot = ".".allMatches(temp).length;

    if (expression.contains("Infinity") || expression.contains("NaN")) {
      if (text == "1" ||
          text == "2" ||
          text == "3" ||
          text == "4" ||
          text == "5" ||
          text == "6" ||
          text == "7" ||
          text == "8" ||
          text == "9" ||
          text == "0") {
        expression = text;
        flag = false;
      }
    } else {
      if (expression.length <= 14) {
        if (numofDot <= 1) {
          if (flag == true) {
            if (text != ".") {
              history = "";
              expression = "";
            }
          }
          if (expression == "") {
            if (text == ".") {
              expression = "";
              flag = false;
            } else if (text == "00") {
              expression = "";
            } else {
              expression += text;
              flag = false;
            }
          } else {
            if (expression.substring(0) == "0" ||
                expression.substring(0) == "00") {
              if (text == ".") {
                expression += text;
                flag = false;
              }

              if (text != "0" && text != "00" && text != ".") {
                expression = text;
                flag = false;
              }
            } else {
              if (flag == true) {
                if (text == ".") {
                  expression = expression;
                } else {
                  expression += text;
                  flag = false;
                }
              } else {
                expression += text;
                flag = false;
              }
            }
          }
        }
      }
    }

    notifyListeners();
  }

  bool webview = false;
  webView() {}

  operatorPress(String text, BuildContext context) {
    if (!expression.contains("1") &&
        !expression.contains("2") &&
        !expression.contains("3") &&
        !expression.contains("4") &&
        !expression.contains("5") &&
        !expression.contains("6") &&
        !expression.contains("7") &&
        !expression.contains("8") &&
        !expression.contains("9") &&
        expression.isNotEmpty) {
      expression = expression;
      history = history;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Can't calculate with zero."),
          duration: Duration(milliseconds: 1200),
        ),
      );
    } else {
      if (expression.contains("Infinity") || expression.contains("NaN")) {
        if (text == "+" ||
            text == "-" ||
            text == "/" ||
            text == "*" ||
            text == "%") {
          history = "";
          expression = expression;
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Can't calculate."),
            duration: Duration(milliseconds: 1200),
          ));
        }
      } else {
        if (flag == false && flag1 == true) {
          if (history.contains("+") ||
              history.contains("-") ||
              history.contains("*") ||
              history.contains("/") ||
              history.contains("%")) {
            if (text == "+" ||
                text == "-" ||
                text == "*" ||
                text == "/" ||
                text == "%") {
              history = expression + text;
              expression = "";
            }
          }
        }

        if (expression != "") {
          if (text == "+" ||
              text == "-" ||
              text == "*" ||
              text == "/" ||
              text == "%") {
            if (expression.substring(expression.length - 1) == ".") {
              if (flagdot == true) {
                history = expression.substring(0, expression.length - 1) + text;
                flagdot = false;
                flagclearexp = false;
              } else {
                history +=
                    expression.substring(0, expression.length - 1) + text;
              }
              expression = "";
            } else {
              if (flag == true) {
                if (text == "+" ||
                    text == "-" ||
                    text == "*" ||
                    text == "/" ||
                    text == "%") {
                  history = expression;
                  expression = "";
                }
              }
              if (history != "" && expression != "") {
                if (history.substring(history.length - 1) != "+" &&
                    expression.substring(0) != "+") {
                  if (text == "+" ||
                      text == "-" ||
                      text == "*" ||
                      text == "/" ||
                      text == "%") {
                    if (flagclearexp == true) {
                      history = expression + text;
                      expression = "";
                      flagclearexp = false;
                    } else {
                      history += expression + text;
                      expression = "";
                      flag = false;
                      flag1 = false;
                    }
                  }
                } else {
                  history += expression;
                  history += text;
                  expression = "";
                  flag = false;
                  flag1 = false;
                  flagclearexp = false;
                }
              } else {
                history += expression;
                history += text;
                expression = "";
                flag = false;
                flag1 = false;
                flagclearexp = false;
              }
            }
          }
        } else {
          if (history.substring(history.length - 1) == "+" ||
              history.substring(history.length - 1) == "-" ||
              history.substring(history.length - 1) == "*" ||
              history.substring(history.length - 1) == "/" ||
              history.substring(history.length - 1) == "%" &&
                  expression == "") {
            if (text != 0) {
              history = history.substring(0, history.length - 1) + text;
            }
            print("object");
          } else {
            print("value");
          }
        }
      }
    }
    notifyListeners();
  }

  evaluate(String text, BuildContext context) {
    flagdot = true;
    print(flagdot);
    if (flag1 == true) {
      if (expression == "") {
        flag1 = false;
      }
    }
    if (expression == "" && history == "") {
      expression = "";
      history = "";
    } else if (!expression.contains("1") &&
        !expression.contains("2") &&
        !expression.contains("3") &&
        !expression.contains("4") &&
        !expression.contains("5") &&
        !expression.contains("6") &&
        !expression.contains("7") &&
        !expression.contains("8") &&
        !expression.contains("9") &&
        expression.isNotEmpty) {
      if (history != "" && history.substring(history.length - 1) == "/" ||
          history != "" && history.substring(history.length - 1) == "%") {
        expression = "";
        history = history;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Can't Calculate with zero."),
          duration: Duration(milliseconds: 1200),
        ));
      } else {
        Parser p = Parser();
        String tempexp = history + expression;
        Expression exp = p.parse(tempexp);
        ContextModel cm = ContextModel();

        if (flag == false && flag1 == false) {
          if (flagclearexp == true) {
            if (expression.isNotEmpty) {
              history = "";
              expression = expression;
              flagclearexp = false;
            } else {
              history += expression;
              expression = exp.evaluate(EvaluationType.REAL, cm).toString();
              flag = true;
            }
          } else {
            history += expression;
            expression = exp.evaluate(EvaluationType.REAL, cm).toString();
            flag = true;
          }
        }

        if (exp.toString().contains(".") || exp.toString().contains("*")) {
          expression = double.parse(expression).toStringAsFixed(2);
        }
        if (exp.toString().contains("/")) {
          expression = double.parse(expression).toStringAsFixed(2);
        }
        int len2 = expression.length;
        if (len2 >= 2) {
          if (expression != "" &&
              expression.substring(expression.length - 2, expression.length) ==
                  ".0") {
            expression = expression.substring(0, expression.length - 2);
          }
        }
        int len = expression.length;
        if (len >= 3) {
          if (expression != "" &&
              expression.substring(expression.length - 3, expression.length) ==
                  ".00") {
            expression = expression.substring(0, expression.length - 3);
          }
        }
      }
    } else {
      Parser p = Parser();
      String tempexp = history + expression;
      Expression exp = p.parse(tempexp);
      ContextModel cm = ContextModel();

      if (flag == false && flag1 == false) {
        if (flagclearexp == true) {
          if (expression.isNotEmpty) {
            history = "";
            expression = expression;
            flagclearexp = false;
          } else {
            history += expression;
            expression = exp.evaluate(EvaluationType.REAL, cm).toString();
            flag = true;
          }
        } else {
          history += expression;
          expression = exp.evaluate(EvaluationType.REAL, cm).toString();
          flag = true;
        }
      }

      if (exp.toString().contains(".") || exp.toString().contains("*")) {
        expression = double.parse(expression).toStringAsFixed(2);
      }
      if (exp.toString().contains("/")) {
        expression = double.parse(expression).toStringAsFixed(2);
      }

      if (expression != "" &&
          expression.substring(expression.length - 2, expression.length) ==
              ".0") {
        expression = expression.substring(0, expression.length - 2);
      }
      int len1 = expression.length;
      if (len1 >= 3) {
        if (expression != "" &&
            expression.substring(expression.length - 3, expression.length) ==
                ".00") {
          expression = expression.substring(0, expression.length - 3);
        }
      }
    }
    notifyListeners();
  }

  allClear(String text, BuildContext context) {
    history = '';
    expression = '';
    notifyListeners();
    flag = false;
    if (flagdot == true) {
      flagclearexp = false;
    }
    flagdot = false;
  }

  clear(String text, BuildContext context) {
    if (expression == "Infinity" || expression == "NaN") {
      expression = expression;
    } else if (expression.length >= 1) {
      expression = expression.substring(0, expression.length - 1);
      if (history.isNotEmpty) {
        if (history.substring(history.length - 1) == "+" ||
            history.substring(history.length - 1) == "-" ||
            history.substring(history.length - 1) == "%" ||
            history.substring(history.length - 1) == "*" ||
            history.substring(history.length - 1) == "/") {
          history = history;
          flag = false;
        } else {
          history = "";
        }
      }
    } else {
      print("something wrong with expression");
    }

    notifyListeners();
  }

  clearExp(String text, BuildContext context) {
    // flagdot = false;
    print(flagdot);
    if (flag == true) {
      flagclearexp = true;
    }
    expression = "";

    flag = false;

    notifyListeners();
  }
}
