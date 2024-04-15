import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double width;

  const CustomElevatedButton({
    required this.text,
    required this.color,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black), // Add black border
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
