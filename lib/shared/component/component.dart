import 'package:flutter/material.dart';

Widget divider() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
        width: 80,
        height: 1.5,
        decoration: BoxDecoration(color: Colors.indigo)),
  );
}
