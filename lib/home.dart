import 'package:flutter/material.dart';
import 'package:uber/widgets/banner_book.dart';
import 'package:uber/widgets/header_title.dart';
import 'package:uber/widgets/my_list_tile.dart';
import 'package:uber/widgets/search_textField.dart';
import 'package:uber/widgets/service_container.dart';
import 'package:uber/widgets/ways_to_save.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'Now';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SearchTextField(),
                  const MyListTile(),
                  const Divider(),
                  const MyListTile(),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset('assets/images/banner-payment.png'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Suggestions'),
                        TextButton(
                            onPressed: () {}, child: const Text('See all'))
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServiceBox(
                        title: 'Ride',
                        imagePath: 'assets/images/ride.png',
                      ),
                      ServiceBox(
                        title: 'Package',
                        imagePath: 'assets/images/package.png',
                      ),
                      ServiceBox(
                        title: 'Rental',
                        imagePath: 'assets/images/rental.png',
                      ),
                      ServiceBox(
                        title: 'Reserve',
                        imagePath: 'assets/images/calender.png',
                      ),
                    ],
                  ),
                  const HeaderTitle(title: 'Ways to save with Uber'),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        WaysToSaveItem(
                          imagePath: 'assets/images/scotter.png',
                          title: 'Uber Moto rides',
                          subTitle: 'Affordable motorcycle pick-up',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        WaysToSaveItem(
                          imagePath: 'assets/images/pretty_woman.png',
                          title: 'Shuttle rides',
                          subTitle: 'Low fares. premitive',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const BannerSedan(),
                  const SizedBox(
                    height: 30,
                  ),
                  const HeaderTitle(title: 'Ways to plan with Uber'),
                  const SizedBox(
                    height: 15,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        WaysToSaveItem(
                          imagePath: 'assets/images/train.png',
                          title: 'Travel intercity',
                          subTitle: 'Get to remote locations with ease',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        WaysToSaveItem(
                          imagePath: 'assets/images/head.png',
                          title: 'hourly rentals',
                          subTitle: 'Ride from 1 to 12',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const HeaderTitle(title: 'More ways to use Uber'),
                  const SizedBox(
                    height: 15,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        WaysToSaveItem(
                          imagePath: 'assets/images/train.png',
                          title: 'Safety ToolKit',
                          subTitle: 'On-trip help with safety issues',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        WaysToSaveItem(
                          imagePath: 'assets/images/head.png',
                          title: 'Send a package',
                          subTitle: 'On-demand deliver to town',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const HeaderTitle(title: 'Around you'),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 344,
                      height: 198,
                      child: Image.asset('assets/images/near_cars.png')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/bottom_navigation/home.svg', // Replace with your SVG file path
                width: 24,
                height: 24,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.rice_bowl_rounded), label: "Service"),
          BottomNavigationBarItem(
              icon: Icon(Icons.rice_bowl_rounded), label: "Servoce"),
        ],
      ),
    );
  }
}
