import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({super.key, required this.title, required this.imagePath});
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 75,
          height: 97,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 75,
                height: 72,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 8,
                      child: Container(
                        width: 75,
                        height: 64,
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
                      top: 28,
                      child: Container(
                        width: 67,
                        height: 38,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('imagePath'),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 0,
                      child: SizedBox(
                        width: 57,
                        height: 20,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 57,
                                height: 20,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF3B864E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 10,
                              top: 2,
                              child: Text(
                                'Promo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
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
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Uber Move',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
