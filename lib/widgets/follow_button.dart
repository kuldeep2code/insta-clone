import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color buttonBackgroundColor;
  final Color buttonBorderColor;
  final String text;
  final Color textColor;

  const FollowButton({
    super.key,
    this.function,
    required this.buttonBackgroundColor,
    required this.buttonBorderColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      child: TextButton(
        onPressed: function,
        child: Container(
          decoration: BoxDecoration(
            color: buttonBackgroundColor,
            border: Border.all(color: buttonBorderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          width: 237,
          height: 27,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
