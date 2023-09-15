import 'package:calculay/calculay_theme.dart';
import 'package:calculay/data/data.dart';
import 'package:calculay/models/operator.dart';
import 'package:calculay/models/theme_changer.dart';
import 'package:calculay/utils/hex_color.dart';
import 'package:calculay/widgets/operand.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewKeyPad extends StatefulWidget {
  const GridViewKeyPad({super.key});

  @override
  State<GridViewKeyPad> createState() => _GridViewKeyPadState();
}

class _GridViewKeyPadState extends State<GridViewKeyPad> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final operators = Provider.of<Operators>(context);

    return Container(
      padding: const EdgeInsets.only(
        top: 40,
        left: 25,
        right: 25,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: themeChanger.themeMode == ThemeMode.light
            ? hexColor(kLightFgColor)
            : hexColor(kDarkFgColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2.3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: Data.data.length,
        itemBuilder: (context, index) {
          switch (Data.data[index]) {
            case '+' || '-' || '/' || 'x':
              return Operand(
                data: Data.data[index],
                bgColor: themeChanger.themeMode == ThemeMode.light
                    ? hexColor(kLightNumeralsBgColor)
                    : hexColor(kDarkNumeralsBgColor),
                color: hexColor(kOperatorsColor),
                onTap: () {
                  if (operators.input.endsWith(Data.data[index])) {
                    operators.input += '';
                  } else {
                    operators.input += Data.data[index];
                  }

                  operators.onCalc = true;
                },
              );
            case '=':
              return Operand(
                  data: Data.data[index],
                  bgColor: themeChanger.themeMode == ThemeMode.light
                      ? hexColor(kLightNumeralsBgColor)
                      : hexColor(kDarkNumeralsBgColor),
                  color: hexColor(kOperatorsColor),
                  onTap: () {
                    operators.output = operators.input;
                    operators.previousAnswer = operators.output;
                    operators.equalPress();

                    operators.onCalc = false;
                    operators.input = operators.output;
                  });
            case 'AC' || '+/-' || '%' || '<-' || '.':
              return Operand(
                  data: Data.data[index],
                  color: themeChanger.themeMode == ThemeMode.light
                      ? hexColor(kLightOperandsColor)
                      : hexColor(kDarkOperandsColor),
                  bgColor: themeChanger.themeMode == ThemeMode.light
                      ? hexColor(kLightNumeralsBgColor)
                      : hexColor(kDarkNumeralsBgColor),
                  onTap: () {
                    switch (Data.data[index]) {
                      case 'AC':
                        operators.input = '';
                        operators.previousAnswer = operators.output;
                        operators.output = '0';
                        break;
                      case '<-':
                        if (operators.output == 'Infinity' ||
                            operators.output == 'Error') {
                          operators.input = '';
                        } else {
                          operators.input = operators.input
                              .substring(0, operators.input.length - 1);
                        }

                        operators.onCalc = true;
                        break;
                      case '%':
                        operators.input =
                            (double.parse(operators.input) / 100).toString();
                        operators.equalPress();
                        break;
                      case '.':
                        operators.input += '.';
                        break;
                      default:
                        if (operators.input.contains('-')) {
                          operators.input = operators.input.replaceAll('-', '');
                        } else if (operators.input == '0.0' ||
                            operators.input == '0') {
                          operators.input = operators.input;
                        } else {
                          operators.input = '-${operators.input}';
                        }
                        operators.onCalc = true;
                    }
                  });
            default:
              return Operand(
                data: Data.data[index],
                color: themeChanger.themeMode == ThemeMode.light
                    ? hexColor(kLightNumeralsColor)
                    : hexColor(kDarkNumeralsColor),
                bgColor: themeChanger.themeMode == ThemeMode.light
                    ? hexColor(kLightNumeralsBgColor)
                    : hexColor(kDarkNumeralsBgColor),
                onTap: () {
                  operators.input += Data.data[index];

                  operators.onCalc = true;
                },
              );
          }
        },
      ),
    );
  }
}
