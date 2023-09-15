import 'package:calculay/calculay_theme.dart';
import 'package:calculay/models/operator.dart';
import 'package:calculay/models/theme_changer.dart';
import 'package:calculay/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final operators = Provider.of<Operators>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            operators.previousAnswer,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: themeChanger.themeMode == ThemeMode.light
                      ? hexColor(kDarkFgColor)
                      : hexColor(kLightFgColor),
                ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            operators.onCalc ? operators.input : operators.output,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: themeChanger.themeMode == ThemeMode.light
                      ? hexColor(kLightNumeralsColor)
                      : hexColor(kDarkNumeralsColor),
                ),
          ),
        ),
      ],
    );
  }
}
