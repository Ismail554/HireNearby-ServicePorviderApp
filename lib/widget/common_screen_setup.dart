import 'package:flutter/material.dart';
import 'package:hirenearby/core/app_colors.dart';

class CommonScreenSetup extends StatelessWidget {
  final String? title;
  final bool showBackButton;
  final Widget child;

  const CommonScreenSetup({
    super.key,
    this.title,
    this.showBackButton = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: showBackButton,
        title: title != null ? Text(title!) : null,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
