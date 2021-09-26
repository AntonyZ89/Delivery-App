import 'package:first_application/screens/home_page.dart';
import 'package:first_application/screens/login.dart';
import 'package:first_application/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black87,
              displayColor: Colors.black87,
              decorationColor: Colors.black87,
            ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      initialRoute: 'home',
      routes: {
        'login': (context) => const LoginScreen(),
        'home': (context) => const HomePage(title: 'Home Page'),
        'product': (context) => const ProductPage(),
      },
    );
  }
}
