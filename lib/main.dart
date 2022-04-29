import 'package:flutter/material.dart';
import 'package:expandable_tree_menu/expandable_tree_menu.dart';
import 'package:user_registration_form/screens/home_screen.dart';
import 'package:user_registration_form/screens/registration_screen.dart';
import 'package:user_registration_form/user_registration/contact_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: const RegistrationScreen(),
        ),
      ),
    );
  }
}
