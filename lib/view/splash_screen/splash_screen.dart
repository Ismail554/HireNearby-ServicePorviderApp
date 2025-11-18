import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirenearby/core/app_constants.dart';
import 'package:hirenearby/view/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: AppConstants.splashDelay), () {
    //   _navigateToAuth(context);
    // });

    Future.delayed(Duration(seconds: AppConstants.splashDelay), () {
      _navigateToAuth(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full background SVG
          SizedBox.expand(
            child: Image.asset('assets/images/auth_bg.png', fit: BoxFit.cover),
          ),
          // Logo stacked over the background
          Center(child: Image.asset('assets/images/logo.png')),
        ],
      ),
    );
  }
}

_navigateToAuth(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AuthScreen()),
  );
}
