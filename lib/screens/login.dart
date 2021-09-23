import 'package:first_application/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: LoginForm(),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text('Termos e condições'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
