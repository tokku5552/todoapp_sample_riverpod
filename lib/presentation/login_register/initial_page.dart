import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/common/colors.dart';
import 'package:todoapp_sample_riverpod/presentation/login_register/login_page.dart';
import 'package:todoapp_sample_riverpod/presentation/login_register/register_page.dart';
import 'package:todoapp_sample_riverpod/presentation/login_register/reusable_widget/button_widget.dart';

class InitialPage extends ConsumerWidget {
  const InitialPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableButton(
              width: 250,
              text: 'Create Account',
              onPress: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return RegisterPage();
                }));
              },
              color: complementaryColorCustom,
              fontColor: Colors.white,
            ),
            Stack(
              children: [
                const Divider(
                  height: 50,
                  thickness: 1,
                  indent: 90,
                  endIndent: 90,
                  color: Color(0xFF707070),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: const Text(
                        'Or',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            ReusableButton(
              width: 250,
              text: 'Login',
              onPress: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              color: colorCustom,
              fontColor: Colors.white,
            ),
            SizedBox(
              height: 150,
            ),
            ReusableButton(
              width: 250,
              text: 'Google',
              onPress: () {},
              color: colorCustom,
              fontColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            ReusableButton(
              width: 250,
              text: 'Apple',
              onPress: () {},
              color: colorCustom,
              fontColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            ReusableButton(
              width: 250,
              text: 'Twitter',
              onPress: () {},
              color: colorCustom,
              fontColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
