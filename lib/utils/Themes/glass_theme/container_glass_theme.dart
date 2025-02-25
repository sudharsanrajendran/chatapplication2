import 'dart:ui';
import 'package:flutter/material.dart';

class Glass_Container extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;
  final Color color;

  const Glass_Container({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.borderRadius = 20,
    this.color = Colors.white30, // Semi-transparent white
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6), // Transparent effect
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.3), // Glass border
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
