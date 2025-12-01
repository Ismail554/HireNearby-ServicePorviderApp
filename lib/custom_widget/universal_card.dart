import 'package:flutter/material.dart';

class UniversalCard extends StatelessWidget {
  // Common Property
  final String label;

  // Option 1: Pass text (e.g., "$45")
  final String? value;

  // Option 2: Pass an icon (e.g., Icons.access_time)
  final IconData? icon;

  // Interaction Properties
  final bool isSelected;
  final VoidCallback? onTap;

  const UniversalCard({
    Key? key,
    required this.label,
    this.value,
    this.icon,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define colors based on selection state
    final Color backgroundColor = isSelected
        ? const Color(0xFF4285F4)
        : Colors.white;
    final Color borderColor = isSelected
        ? const Color(0xFF4285F4)
        : Colors.grey.shade300;
    final Color primaryContentColor = isSelected
        ? Colors.white
        : const Color(0xFF4285F4); // Blue text for values
    final Color iconColor = isSelected
        ? Colors.white
        : Colors.black87; // Black for icons
    final Color labelColor = isSelected ? Colors.white70 : Colors.black54;

    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          // Ensure consistent size if needed, or wrap in Expanded/Flexible in parent
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LOGIC: Show Value Text OR Icon
              if (value != null)
                Text(
                  value!,
                  style: TextStyle(
                    color: primaryContentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else if (icon != null)
                Icon(icon, color: iconColor, size: 22),

              const SizedBox(height: 8),

              // Label Text (Always present)
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
