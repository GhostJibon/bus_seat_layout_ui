import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SpaceWidget extends StatelessWidget {
    final double widgetSize;
  const SpaceWidget({super.key,required this.widgetSize});

  @override
  Widget build(BuildContext context) {
    // Empty box to preserve spacing/alignment
    return SizedBox(width: widgetSize.w, height: widgetSize.w);
  }
}