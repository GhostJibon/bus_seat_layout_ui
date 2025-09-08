import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class DoorWidget extends StatelessWidget {
    final double widgetSize;
  const DoorWidget({super.key,required this.widgetSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widgetSize.w,
      height: widgetSize.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.orange, width: 1),
      ),
      child: Text(
        'Door',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
      ),
    );
  }
}