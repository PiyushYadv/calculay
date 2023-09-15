import 'package:flutter/material.dart';

class Operand extends StatelessWidget {
  const Operand({
    super.key,
    required this.data,
    required this.color,
    required this.bgColor,
    required this.onTap,
  });

  final String data;
  final Color color;
  final Color bgColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          data,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: color,
              ),
        ),
      ),
    );
  }
}
