import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AdaptivePhotoGrid extends StatelessWidget {
  final List<String> images;
  final double borderRadius;
  // Added a height parameter so you can control the fixed size externally if needed
  final double? containerHeight;

  const AdaptivePhotoGrid({
    super.key,
    required this.images,
    this.borderRadius = 16,
    this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 1. Set the fixed height. If not passed, defaults to 220.h
      height: containerHeight ?? 220.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      // 2. This clips the images so they fit perfectly inside the rounded container
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        // If you want the user to scroll INSIDE the fixed box, change this to BouncingScrollPhysics()
        physics: const NeverScrollableScrollPhysics(),
        // 3. Set to false so the grid expands to fill the fixed Container height
        shrinkWrap: false,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final path = images[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image(
              image: path.startsWith("http")
                  ? NetworkImage(path)
                  : AssetImage(path) as ImageProvider,
              // 4. Key change: 'cover' scales the image to fit the tile without distortion
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          );
        },
      ),
    );
  }
}
