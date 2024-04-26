import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber/map_try/new_map.dart';

import 'package:uber/widgets/banner_book.dart';
import 'package:uber/widgets/bottom_navigation_widget.dart';
import 'package:uber/widgets/header_title.dart';
import 'package:uber/widgets/my_list_tile.dart';
import 'package:uber/widgets/search_textField.dart';
import 'package:uber/widgets/service_container.dart';
import 'package:uber/widgets/ways_to_save.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
                    SizedBox(
                      height: 30.h,
                    ),
                    Image.asset('assets/images/banner-payment.png'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                padding: EdgeInsets.only(left: 10.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HeaderTitle(title: 'Suggestions'),
                        TextButton(
                            onPressed: () {}, child: const Text('See all'))
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServiceBox(
                          title: 'Ride',
                          imagePath: 'assets/images/ride.png',
                          hasPromo: true,
                        ),
                        ServiceBox(
                          title: 'Package',
                          imagePath: 'assets/images/package.png',
                          hasPromo: false,
                        ),
                        ServiceBox(
                          title: 'Rental',
                          imagePath: 'assets/images/rental.png',
                          hasPromo: true,
                        ),
                        ServiceBox(
                          title: 'Reserve',
                          imagePath: 'assets/images/calender.png',
                          hasPromo: false,
                        ),
                      ],
                    ),
                    const HeaderTitle(title: 'Ways to save with Uber'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const WaysToSaveItem(
                            imagePath: 'assets/images/scotter.png',
                            title: 'Uber Moto rides',
                            subTitle: 'Affordable motorcycle pick-up',
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const WaysToSaveItem(
                            imagePath: 'assets/images/pretty_woman.png',
                            title: 'Shuttle rides',
                            subTitle: 'Low fares. premitive',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const BannerSedan(),
                    SizedBox(
                      height: 30.h,
                    ),
                    const HeaderTitle(title: 'Ways to plan with Uber'),
                    SizedBox(
                      height: 15.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const WaysToSaveItem(
                            imagePath: 'assets/images/train.png',
                            title: 'Travel intercity',
                            subTitle: 'Get to remote locations with ease',
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const WaysToSaveItem(
                            imagePath: 'assets/images/head.png',
                            title: 'hourly rentals',
                            subTitle: 'Ride from 1 to 12',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const HeaderTitle(title: 'More ways to use Uber'),
                    SizedBox(
                      height: 15.h,
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
                    SizedBox(
                      height: 30.h,
                    ),
                    const HeaderTitle(title: 'Around you'),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      width: 344.w,
                      height: 198.h,
                      child: const MapSample(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomizedButtonNavigation());
  }
}
