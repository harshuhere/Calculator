import 'package:calculator_via_provider/provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'widget/CalcButton.dart';
import 'widget/change_theme_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CalculatorProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(child: ChangeThemeButtonWidget()),
          Positioned(child: Container(child: _buildbody(context, state))),
        ]),
      ),
    );
  }

  Column _buildbody(BuildContext context, CalculatorProvider state) {
    var wid = MediaQuery.of(context).size.width;
    print(wid);
    double exfntsize = 49;
    double histfntsize = 23;
    if (wid >= 400) {
      exfntsize = 38;
      histfntsize = 12;
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    //color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 0, 12, 10),
                      child: Consumer<CalculatorProvider>(
                        builder: (context, cart, child) {
                          return Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              cart.history,

                              /// history
                              style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: histfntsize,
                                  fontWeight: FontWeight.w300),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 15, 10),
                      child: Consumer<CalculatorProvider>(
                        builder: (context, cart1, child) {
                          return Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              cart1.expression,

                              ///expression
                              style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: exfntsize,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 1,
        // ),
        build_buttons_layout(state, context),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Expanded build_buttons_layout(
      CalculatorProvider state, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          //margin: EdgeInsets.only(top: 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer<CalculatorProvider>(
                      builder: (context, cart, child) {
                        return state.expression == ""
                            ? CalcButton(
                                text: "AC",
                                textsize: 25,
                                fillcolor: Theme.of(context).buttonColor,
                                callBack: state.allClear,
                              )
                            : CalcButton(
                                text: "C",
                                textsize: 35,
                                fillcolor: Theme.of(context).buttonColor,
                                callBack: state.clearExp);
                      },
                    ),
                    CalcButton(
                      // ⌫
                      text: "⌫︁",
                      isIcon: true,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.clear,
                    ),
                    CalcButton(
                      text: "%",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.operatorPress,
                    ),
                    CalcButton(
                      text: "/",
                      textsize: 35,
                      fillcolor: Color(0xffFF9500).withOpacity(0.7),
                      callBack: state.operatorPress,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "7",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                      text: "8",
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                      textsize: 35,
                    ),
                    CalcButton(
                      text: "9",
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                      textsize: 35,
                    ),
                    CalcButton(
                        text: "*",
                        fillcolor: Color(0xffFF9500).withOpacity(0.7),
                        textsize: 35,
                        callBack: state.operatorPress),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "4",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                      text: "5",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                      text: "6",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                        text: "-",
                        fillcolor: Color(0xffFF9500).withOpacity(0.7),
                        textsize: 35,
                        callBack: state.operatorPress),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "1",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                      text: "2",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                      text: "3",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                        text: "+",
                        fillcolor: Color(0xffFF9500).withOpacity(0.7),
                        textsize: 35,
                        callBack: state.operatorPress),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: ".",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                      text: "0",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                      text: "00",
                      textsize: 35,
                      fillcolor: Theme.of(context).buttonColor,
                      callBack: state.numClick,
                    ),
                    CalcButton(
                        text: "=",
                        fillcolor: Color(0xffFF9500).withOpacity(0.7),
                        textsize: 35,
                        callBack: state.evaluate)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
