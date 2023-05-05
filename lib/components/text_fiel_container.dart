import 'package:flutter/material.dart';

import '../constants.dart';

class TextFielContainer extends StatelessWidget {
  const TextFielContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimaryColor, width: 2)),
      child: child,
    );
  }
}
