import 'package:flutter/material.dart';

class BannerSedan extends StatelessWidget {
  const BannerSedan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 344,
          height: 134,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 344,
                  height: 134,
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
                  width: 344,
                  height: 134,
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
                        width: 9,
                        height: 9,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFAC924B),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 7.80),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFAC924B),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 7.80),
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFAC924B),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 7.80),
                      Container(
                        width: 4,
                        height: 4,
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
                  width: 122,
                  height: 146,
                  decoration: const BoxDecoration(color: Color(0xFF9A7A3A)),
                ),
              ),
              Positioned(
                left: 435,
                top: 7,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(3.14),
                  child: Container(
                    width: 210,
                    height: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/half_car.png'),
                        fit: BoxFit.fill,
                      ),
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Comfortable sedan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Uber Move',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              'rides',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Uber Move',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Book Premier',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Uber Move Text',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Container(
                              width: 16,
                              height: 16,
                              padding: const EdgeInsets.only(
                                top: 2,
                                left: 2,
                                right: 1.76,
                                bottom: 2,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [],
                              ),
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
