import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  final String? text;
  const CustomWidget({Key? key, @required this.text}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  OverlayEntry? floatingDropdown;
  late GlobalKey actionKey;
  bool isDropdownOpen = true;
  late double height, width, xPosition, yPosition;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  // @override
  // void dispose() {
  //   floatingDropdown?.remove();
  //   super.dispose();
  // }

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
      return Positioned(
          left: xPosition + 20,
          width: width - 20,
          top: yPosition + height,
          height: 4 * height + 30,
          child: Container(
            color: Colors.amber,
            height: 200,
          )
          // DropDown(),
          );
    });
  }

  void onTap() {
    setState(() {
      if (isDropdownOpen) {
        floatingDropdown?.dispose();
      } else {
        findDropdownData();
        OverlayEntry floatingDropdown = _createFloatingDropdown();
        Overlay.of(context)?.insert(floatingDropdown);
      }
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                widget.text!.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
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

class DropDown extends StatelessWidget {
  late double itemHeight;
  late String? text;
  late IconData? iconData;
  late bool? isSelected;
  DropDown({Key? key, this.text, this.iconData, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: const Alignment(-0.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Text(
                      text!.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Spacer(),
                    Icon(iconData)
                  ])),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.cyan, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [],
          ),
        )
      ],
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
