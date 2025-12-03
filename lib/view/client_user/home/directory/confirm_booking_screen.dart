import 'package:flutter/material.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';
import 'package:hirenearby/custom_widget/profile_info_card.dart';

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({super.key});

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      title: "Confirm Booking",
      showBackButton: true,
      child: Column(
        children: [
          ProfileInfoCard(
            name: "MD. Ismail ",
            profession: "Flutter Dev",
            location: "Fulgazi, Feni, Bangladesh",
          ),
          Container(child: Column(children: [
            Text("Booking Details", )
          ],),)
        ],
      ),
    );
  }
}
