import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/common/colors.dart';
import 'package:todoapp_sample_riverpod/presentation/login_register/reusable_widget/button_widget.dart';
import 'package:todoapp_sample_riverpod/presentation/login_register/reusable_widget/reusable_textfield.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextController = TextEditingController();
    final passwordTextController = TextEditingController();
    return Scaffold(
        backgroundColor: colorCustom,
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 380,
                ),
              ],
            ),
            ReusableTextField(
              textEditingController: emailTextController,
              margin: const EdgeInsets.fromLTRB(60, 110, 60, 60),
              exampleSentence: 'Email',
            ),
            ReusableTextField(
                textEditingController: passwordTextController,
                margin: const EdgeInsets.fromLTRB(60, 10, 60, 100),
                exampleSentence: 'password'),
            ReusableButton(
              width: 370,
              text: 'Login',
              onPress: () {},
              color: Colors.white,
              fontColor: Colors.black,
            )
          ],
        ));
  }
}
