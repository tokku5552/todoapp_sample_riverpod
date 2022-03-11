import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.text,
    required this.onPress,
    required this.color,
    required this.fontColor,
    required this.width,
  }) : super(key: key);
  final String text;
  final VoidCallback onPress;
  final Color color;
  final Color fontColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: fontColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
