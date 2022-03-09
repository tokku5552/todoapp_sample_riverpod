import 'package:flutter/material.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
    required this.textEditingController,
    required this.todoItem,
    required this.margin,
    required this.maxLines,
    required this.minLines,
    required this.fontSize,
    required this.exampleSentence,
    required this.border,
  }) : super(key: key);

  final TodoItem? todoItem;
  final EdgeInsets margin;
  final int maxLines;
  final int minLines;
  final double fontSize;
  final TextEditingController textEditingController;
  final String exampleSentence;
  final OutlineInputBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        maxLines: maxLines,
        minLines: minLines,
        style: TextStyle(
          fontSize: fontSize,
        ),
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: todoItem == null ? exampleSentence : null,
          border: border,
        ),
      ),
    );
  }
}
