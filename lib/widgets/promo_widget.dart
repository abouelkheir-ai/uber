import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      top: 0,
      child: SizedBox(
        width: 57.w,
        height: 20.h,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 57.w,
                height: 20.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFF3B864E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
             Positioned(
              left: 10,
              top: 2,
              child: Text(
                'Promo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: 'Uber Move',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
