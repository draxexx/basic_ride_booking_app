import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onPressed,
      ),
    );
  }
}
