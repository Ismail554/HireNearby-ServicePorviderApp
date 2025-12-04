import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';
import 'package:hirenearby/custom_widget/profile_info_card.dart';
import 'package:hirenearby/view/client_user/home/directory/success_screen.dart';

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
        crossAxisAlignment: .start,
        spacing: 12.h,
        children: [
          ProfileInfoCard(
            name: "MD. Ismail ",
            profession: "Flutter Dev",
            location: "Fulgazi, Feni, Bangladesh",
          ),
          // Container(
          //   padding: EdgeInsets.all(12.w),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(12.r),
          //   ),
          //   child: Column(
          //     children: [
          //       Text("Booking Details", style: FontManager.titleText()),
          //     ],
          //   ),
          // ),
          BookingDetailsCard(dateValue: '', timeValue: ''),
          ServiceAddressCard(),
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuccessScreen()),
              );
            },
            child: Text("Request Booking", style: FontManager.buttonText()),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------
// Card 1: Booking Details
// ---------------------------------------------
class BookingDetailsCard extends StatelessWidget {
  final String title;
  final String dateLabel;
  final String dateValue;
  final String timeLabel;
  final String timeValue;
  final bool showBorder;
  final Color backgroundColor;

  const BookingDetailsCard({
    super.key,
    this.title = "Booking Details",
    this.dateLabel = "Date",
    required this.dateValue,
    this.timeLabel = "Time",
    required this.timeValue,
    this.showBorder = false,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),

        border: showBorder ? Border.all(width: 1.0, color: Colors.grey) : null,

        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 10,
        //     offset: const Offset(0, 4),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Variable
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // --- Date Row ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 24,
                color: Colors.black87,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateLabel, // Variable
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateValue, // Variable
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // --- Time Row ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.access_time, size: 24, color: Colors.black87),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timeLabel, // Variable
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeValue, // Variable
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------
// Card 2: Service Address
// ---------------------------------------------
class ServiceAddressCard extends StatelessWidget {
  const ServiceAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            "Service Address",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Address Row
          Row(
            children: const [
              Icon(Icons.location_on, size: 24, color: Colors.black87),
              SizedBox(width: 16),
              Text(
                "123 Main St, Apt 4B",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Work Details Row
          Row(
            children: const [
              Icon(Icons.assignment_outlined, size: 24, color: Colors.black87),
              SizedBox(width: 16),
              Text(
                "Work details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Input Field
          TextField(
            maxLines: 3, // Makes the box taller
            decoration: InputDecoration(
              hintText: "Any special instructions...",
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
              filled: true,
              fillColor: const Color(0xFFF5F5F7), // Very light grey fill
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none, // Removes the black border line
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}
