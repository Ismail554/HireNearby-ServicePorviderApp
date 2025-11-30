import 'package:flutter/material.dart';
import 'package:hirenearby/custom_widget/common_directory_card.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';

class DirectoryScreen extends StatefulWidget {
  final String title;

  const DirectoryScreen({super.key, required this.title});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      title: widget.title + " Directory",
      showBackButton: true,
      child: Column(
        children: [
          CommonDirectoryCard(),
          CommonDirectoryCard(),
          CommonDirectoryCard(),
          CommonDirectoryCard(),
          CommonDirectoryCard(),
          CommonDirectoryCard(),
        ],
      ),
    );
  }
}
