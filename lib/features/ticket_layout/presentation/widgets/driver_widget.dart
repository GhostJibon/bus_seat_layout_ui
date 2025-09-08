import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class DriverWidget extends StatelessWidget {
    final double widgetSize;
  const DriverWidget({super.key,required this.widgetSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widgetSize.w,
      height: widgetSize.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.blue, width: 1),
      ),
      child: Text(
        'Driver',
     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
      ),
    );
  }
}