import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber/widgets/promo_widget.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.hasPromo});
  final String title;
  final String imagePath;
  final bool hasPromo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 75.w,
          height: 97.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 75.w,
                height: 72.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 8,
                      child: Container(
                        width: 75.w,
                        height: 64.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEEEEEE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 4,
                      top: 20,
                      child: Container(
                        width: 67.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    hasPromo ? const PromoWidget() : Container()
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 0.14,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? const Color(0xffAFAFAF)
                          : Colors.black,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
