import 'dart:js';

import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  final String? text;
  const CustomWidget({Key? key, @required this.text}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  late GlobalKey actionKey;
  bool isDropdownOpen = false;
  late double height, width, xPosition, yPosition;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey.currentContext?.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Container(
        color: Colors.pink,
        height: 350,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          isDropdownOpen = !isDropdownOpen;
          findDropdownData();
          OverlayEntry floatingdownDrop = _createFloatingDropdown();
          Overlay.of(context)?.insert(floatingdownDrop);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                widget.text!.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }
}



// Contact Personal Name, Destination, Phone Number, Email Address, Alternative Email Address