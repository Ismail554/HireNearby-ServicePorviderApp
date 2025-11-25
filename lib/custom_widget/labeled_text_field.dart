import 'package:flutter/material.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/font_manager.dart';

class LabeledTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? errorText;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.errorText,
  });

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: FontManager.generalText()),
        AppSpacing.h8,

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.fieldBgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscure : false,
            textInputAction: TextInputAction.next,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: FontManager.HintText(),

              // 👁 Password toggle icon
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
        // Error message below field (without border error)
        if (widget.errorText != null && widget.errorText!.isNotEmpty) ...[
          AppSpacing.h4,
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              widget.errorText!,
              style: TextStyle(color: AppColors.red, fontSize: 12),
            ),
          ),
        ],
      ],
    );
  }
}
