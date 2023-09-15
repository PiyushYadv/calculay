import 'package:calculay/calculay_theme.dart';
import 'package:calculay/models/theme_changer.dart';
import 'package:calculay/utils/hex_color.dart';
import 'package:calculay/widgets/grid_view_keypad.dart';
import 'package:calculay/widgets/light_darkbutton.dart';
import 'package:calculay/widgets/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      backgroundColor: themeChanger.themeMode == ThemeMode.light
          ? hexColor(kLightBgColor)
          : hexColor(kDarkBgColor),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const LightDarkButton(),
        backgroundColor: themeChanger.themeMode == ThemeMode.light
            ? hexColor(kLightBgColor)
            : hexColor(kDarkBgColor),
      ),
      body: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 300,
              minWidth: double.infinity,
            ),
            child: const Result(),
          ),
          const Expanded(
            child: GridViewKeyPad(),
          ),
        ],
      ),
    );
  }
}
