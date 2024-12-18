import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_day10_database/constents/spacing.dart';
import 'package:flutter_day10_database/extension/nav.dart';
import 'package:flutter_day10_database/pages/list_page.dart';
import 'package:flutter_day10_database/pages/signup_page.dart';
import 'package:flutter_day10_database/service/database.dart';
import 'package:flutter_day10_database/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 24),
            ),
            hight24,
            TextFieldWidget(
              text: "enter email",
              controller: emailController,
            ),
            hight24,
            TextFieldWidget(
              text: "enter password",
              controller: passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("if you don't have an account"),
                TextButton(
                  onPressed: () {
                    context.pushAndRemoveUntil(const SignupPage());
                  },
                  child: const Text("signup"),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await Database().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListPage(),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
