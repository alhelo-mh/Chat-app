import 'package:chat_app/widget/my_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3073/3073455.png'),
                ),
                const Text(
                  'Chat ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'Sign in',
              onpressed: () {
                Navigator.pushNamed(context, 'signIn_screen');
              },
            ),
            MyButton(
              color: Colors.blue[900]!,
              title: 'register',
              onpressed: () {
                Navigator.pushNamed(context, 'registr_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
