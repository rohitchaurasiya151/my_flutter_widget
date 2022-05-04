
import 'package:flutter/material.dart';

class ParentWidget extends StatelessWidget {
  const ParentWidget({
    Key? key,
    required this.parentWidgetName,
    required this.onTap,
  }) : super(key: key);

  final String parentWidgetName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color(0xff629E51),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            parentWidgetName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
