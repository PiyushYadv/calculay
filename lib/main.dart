import 'package:calculay/calculay_theme.dart';
import 'package:calculay/models/operator.dart';
import 'package:calculay/models/theme_changer.dart';
import 'package:calculay/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        ),
        ChangeNotifierProvider(
          create: (_) => Operators(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChanger>(context);
    return Consumer<ThemeChanger>(
      builder: (context, themeChanger, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CalculayTheme.light(),
          darkTheme: CalculayTheme.dark(),
          themeMode: themeChanger.themeMode,
          home: const CalculatorScreen(),
        );
      },
    );
  }
}
