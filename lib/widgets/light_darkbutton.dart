import 'package:calculay/calculay_theme.dart';
import 'package:calculay/models/theme_changer.dart';
import 'package:calculay/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LightDarkButton extends StatefulWidget {
  const LightDarkButton({super.key});

  @override
  State<LightDarkButton> createState() => _LightDarkButtonState();
}

class _LightDarkButtonState extends State<LightDarkButton> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 150,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: themeChanger.themeMode == ThemeMode.light
            ? hexColor(kLightFgColor)
            : hexColor(kDarkFgColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            splashRadius: 1,
            onPressed: () {
              themeChanger.setTheme(ThemeMode.light);
              !themeChanger.isOn;
            },
            icon: Icon(
              FontAwesomeIcons.sun,
              color:
                  themeChanger.isOn ? hexColor(kOnColor) : hexColor(kOffColor),
            ),
          ),
          IconButton(
            splashRadius: 1,
            onPressed: () {
              themeChanger.setTheme(ThemeMode.dark);
            },
            icon: Icon(
              FontAwesomeIcons.moon,
              color:
                  !themeChanger.isOn ? hexColor(kOnColor) : hexColor(kOffColor),
            ),
          ),
        ],
      ),
    );
  }
}
