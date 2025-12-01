import 'package:flutter/material.dart';

class TagDisplay extends StatelessWidget {
  final String text;

  // Constructor requires the text to display
  const TagDisplay({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding to define the size/shape around the text
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      
      decoration: BoxDecoration(
        // The light blue shade (Color: #E8F0FE)
        color: const Color(0xFFE8F0FE), 
        // Rounded corners
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          // The blue text color (Color: #4285F4)
          color: Color(0xFF4285F4), 
          fontSize: 14,
          fontWeight: FontWeight.w500, // Medium weight for better readability
        ),
      ),
    );
  }
}