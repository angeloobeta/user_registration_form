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
        buildCard("Contacts Details", ["Address", "Phone Number"])
      ],
    );
  }
}

Widget buildCard(String heading, List<String> property) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ExpandableTree(
          nodes: [
            TreeNode<Widget>(
              text("Contacts"),
              subNodes: [
                TreeNode<Widget>(text("Contacts")),
                TreeNode<Widget>(text("Contacts")),
              ],
            ),
            TreeNode(
              'Category B',
              subNodes: [
                TreeNode('Cat B first item'),
                TreeNode(
                  'Cat B sub-category 1',
                ),
              ],
            ),
          ],
          nodeBuilder: (context, nodeValue) => Card(
            child: Text(nodeValue.toString()),
          ),
        ),
      ));
}

Widget text(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
  );
}
