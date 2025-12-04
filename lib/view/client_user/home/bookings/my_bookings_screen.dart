import 'package:flutter/material.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      title: "My Bookings",
      showBackButton: true,
      child: Text("nothing"),
    );
    // TabBar(tabs: ),);
  }
}
