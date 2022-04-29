import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:expandable_tree_menu/expandable_tree_menu.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        section("Contacts Details", [
          'Name',
          'Destination',
          'Phone Number',
          'Alternative Number',
          'Email',
          'Alternative Email'
        ]),
        section("Additional Contacts Details", [
          'Name',
          'Destination',
          'Phone Number',
          'Alternative Number',
          'Email',
          'Alternative Email'
        ]),
        section("Business Details", ['Business Name', 'Location', 'Website'])
      ],
    );
  }
}

Widget section(String text, List<String> details) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Card(
      color: Colors.cyan,
      child: ExpandablePanel(
        header: Text(
          text,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        expanded: const Text('Please tap fill'),
        collapsed: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: details.map((e) => body(e)).toList()),
      ),
    ),
  );
}

Widget body(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            // labelText: 'Enter Name',
            hintText: 'Enter Your $text'),
      ),
    ),
  );
}
