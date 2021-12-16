import 'package:calculator_via_provider/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  @override
  _ChangeThemeButtonWidgetState createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  bool icon = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProviderr>(context, listen: false);

    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            child: Consumer<ThemeProviderr>(builder: (context, myModel, child) {
              return Stack(
                children: [
                  Positioned(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.only(
                                //       bottomLeft: Radius.circular(20),
                                //       bottomRight: Radius.circular(20)),
                                //   color: Theme.of(context).backgroundColor,
                                // ),
                                ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.only(
                                //       topLeft: Radius.circular(20),
                                //       topRight: Radius.circular(20)),
                                //   color: Theme.of(context).backgroundColor,
                                // ),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: OverflowBox(
                      maxHeight: 5000,
                      maxWidth: 5000,
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.9,
                              left: MediaQuery.of(context).size.width * 0.85),
                          height: myModel.heightt,
                          width: myModel.widthh,
                          duration: Duration(milliseconds: 500),
                          child: Image.asset(
                            "assets/cloudsss.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.907,
                          left: MediaQuery.of(context).size.width * 0.87),
                      child: IconButton(
                        onPressed: () {
                          if (themeProvider.isAnim == false) {
                            setState(() {
                              themeProvider.isAnim = true;
                            });
                          } else {
                            themeProvider.isAnim = false;
                          }

                          themeProvider.animateContainer(context);
                          if (icon == false) {
                            setState(() {
                              icon = true;
                            });
                          } else {
                            setState(() {
                              icon = false;
                            });
                          }

                          if (icon == true) {
                            Future.delayed(
                                const Duration(milliseconds: 100), //650
                                () {
                              themeProvider
                                  .toggleTheme(!themeProvider.isDarkMode);
                              // themeProvider.animateContainer(con);
                            });
                          } else {
                            themeProvider
                                .toggleTheme(!themeProvider.isDarkMode);
                          }
                        },
                        icon: Icon(Icons.dark_mode_outlined),
                        color: icon ? Color(0xffFF9500) : Colors.transparent,
                        iconSize: 30,
                        padding: EdgeInsets.only(right: 10, top: 5),
                      ),
                    ),
                  )),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
