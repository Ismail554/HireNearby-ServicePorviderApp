import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: true,
        title: Text("My Bookings", style: FontManager.titleText()),
        centerTitle: true,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.blue,
          indicatorWeight: 2,
          tabs: const [
            Tab(text: "Upcoming"),
            Tab(text: "Pending"),
            Tab(text: "Completed"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBookingsList(_getUpcomingBookings()),
          _buildBookingsList(_getPendingBookings()),
          _buildBookingsList(_getCompletedBookings()),
        ],
      ),
    );
  }

  Widget _buildBookingsList(List<Map<String, dynamic>> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Text("No bookings found", style: FontManager.generalText()),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return _buildBookingCard(bookings[index]);
      },
    );
  }

  Widget _buildBookingCard(Map<String, dynamic> booking) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile and details row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(ImageAssets.profile),
                onBackgroundImageError: (exception, stackTrace) {},
                child: Image.asset(
                  ImageAssets.profile,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 30.sp,
                      color: Colors.grey.shade600,
                    );
                  },
                ),
              ),
              SizedBox(width: 12.w),
              // Name, service, location
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name with verified icon
                    Row(
                      children: [
                        Text(
                          booking['name'],
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Image.asset(
                          IconAssets.verfied,
                          width: 16.w,
                          height: 16.h,
                        ),
                      ],
                    ),
                 AppSpacing.h4,
                    // Service type
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          color: Colors.grey,
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          booking['serviceType'],
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        SizedBox(width: 12.w),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          booking['location'],
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                      ],
                    ),
           
                    AppSpacing.h4,
                    // Date and time
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 16.sp,
                            ),
                            AppSpacing.w4,
                            Text(
                              booking['date'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                            AppSpacing.w4,
                            Text(
                              booking['time'],
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),

                        _buildStatusBadge(booking['status']),
                      ],
                    ),
                  ],
                ),
              ),

              // Status badge
            ],
          ),
          // View Invoice button for completed bookings
          if (booking['status'] == 'Completed' || booking['status'] == 'Paid')
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () {
                    // TODO: Navigate to invoice screen
                  },
                  // style: FilledButton.styleFrom(
                  //   backgroundColor: AppColors.blue,
                  //   foregroundColor: Colors.white,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8.r),
                  //   ),
                  // ),
                  child: Text("View Invoice", style: FontManager.buttonText()),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    Color textColor;
    switch (status) {
      case 'Booked':
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue;
        break;
      case 'Pending':
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange;
        break;
      case 'Completed':
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green;
        break;
      case 'Paid':
        backgroundColor = Colors.lightBlue.shade100;
        textColor = Colors.blue;
        break;
      default:
        backgroundColor = Colors.grey;
        textColor = Colors.black;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: textColor, width: 1.w),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        status,
        style: FontManager.buttonText(color: textColor, fontSize: 12),
        //    TextStyle(
        //     color: textColor,
        //     fontSize: 12.sp,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
      ),
    );
  }

  // Dummy data for Upcoming bookings
  List<Map<String, dynamic>> _getUpcomingBookings() {
    return [
      {
        'name': 'Michael Rodriguez',
        'serviceType': 'Plumber Service',
        'location': 'America',
        'date': 'Nov 20 ',
        'time': '6:00 PM',
        'status': 'Booked',
      },
    ];
  }

  // Dummy data for Pending bookings
  List<Map<String, dynamic>> _getPendingBookings() {
    return [
      {
        'name': 'Michael Rodriguez',
        'serviceType': 'Plumber Service',
        'location': 'America',
        'date': 'Nov 20 ',
        'time': '2:00 PM',
        'status': 'Pending',
      },
    ];
  }

  // Dummy data for Completed bookings
  List<Map<String, dynamic>> _getCompletedBookings() {
    return [
      {
        'name': 'Michael Rodriguez',
        'serviceType': 'Plumber Service',
        'location': 'America',
        'date': 'Nov 20 ',
        'time': '2:00 PM',
        'status': 'Completed',
      },
      {
        'name': 'Michael Rodriguez',
        'serviceType': 'Plumber Service',
        'location': 'America',
        'date': 'Nov 20 ',
        'time': '2:00 PM',
        'status': 'Paid',
      },
    ];
  }
}
