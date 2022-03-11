import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
    required this.textEditingController,
    required this.margin,
    required this.exampleSentence,
  }) : super(key: key);
  final EdgeInsets margin;
  final TextEditingController textEditingController;
  final String exampleSentence;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.white),
        ),
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: exampleSentence,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
      ),
    );
  }
}
