import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _error;
  bool _showPassword = false;

  _setError(String? error) {
    setState(() {
      _error = error;
    });
  }

  setShowPassword(bool value) {
    setState(() {
      _showPassword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextField(
            controller: _email,
            decoration: const InputDecoration(
              labelText: 'E-mail',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextField(
            controller: _password,
            obscureText: !_showPassword,
            decoration: InputDecoration(
              labelText: 'Senha',
              suffixIcon: IconButton(
                onPressed: () => setShowPassword(!_showPassword),
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black87,
                ),
              ),
              errorText: _error,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_email.text.isEmpty || _password.text.isEmpty) {
              _setError('E-mail e senha são obrigatórios.');
            } else if (_email.text == 'antony@gmail.com' &&
                _password.text == '123456') {
              _setError(null);
              Navigator.of(context).pushReplacementNamed('home');
            } else {
              _setError('E-mail ou senha incorretos.');
            }
          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50),
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
