import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SeatWidget extends StatelessWidget {
  final String label;
    final double widgetSize;
  const SeatWidget({super.key, required this.label,required this.widgetSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widgetSize.w,
      height: widgetSize.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.green, width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
    );
  }
}






