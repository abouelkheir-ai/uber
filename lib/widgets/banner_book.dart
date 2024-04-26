import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSedan extends StatelessWidget {
  const BannerSedan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 344.w,
          height: 134.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 344.w,
                  height: 134.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF927023),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 344.w,
                  height: 134.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF927023),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 138,
                top: 115,
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 9,
                        height: 9,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 7.80),
                      Container(
                        width: 9.w,
                        height: 9.h,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFAC924B),
                          shape: OvalBorder(),
                        ),
                      ),
                       SizedBox(width: 7.80.w),
                      Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFAC924B),
                          shape: OvalBorder(),
                        ),
                      ),
                       SizedBox(width: 7.80.w),
                      Container(
                        width: 7.w,
                        height: 7.h,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFAC924B),
                          shape: OvalBorder(),
                        ),
                      ),
                       SizedBox(width: 7.80.w),
                      Container(
                        width: 4.w,
                        height: 4.h,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFAC924B),
                          shape: OvalBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 232,
                top: -4,
                child: Container(
                  width: 122.w,
                  height: 146.h,
                  decoration: const BoxDecoration(color: Color(0xFF9A7A3A)),
                ),
              ),
              Positioned(
                left: 180,
                top: 0,
                child: Container(
                  width: 210.w,
                  height: 120.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/half_car.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 21,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child:  Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Comfortable sedan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Uber Move',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              'rides',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Uber Move',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(height: 12.h),
                      Container(
                        child:  Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Book Premier',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontFamily: 'Uber Move Text',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
