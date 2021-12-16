import 'package:calculator_via_provider/homepage.dart';
import 'package:calculator_via_provider/provider/calculator_provider.dart';
import 'package:calculator_via_provider/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculatorProvider>(
            create: (context) => CalculatorProvider()),
        ChangeNotifierProvider<ThemeProviderr>(
            create: (context) => ThemeProviderr()),
      ],
      child: Consumer(builder: (context, ThemeProviderr themeNotifier, child) {
        return MaterialApp(
            title: 'Calculator',
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: themeNotifier.thememode,
            home: HomePage());
      }),
    );
  }
}
