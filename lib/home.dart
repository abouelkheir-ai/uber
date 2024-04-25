import 'package:flutter/material.dart';
import 'package:uber/widgets/banner_book.dart';
import 'package:uber/widgets/my_list_tile.dart';
import 'package:uber/widgets/search_textField.dart';
import 'package:uber/widgets/service_container.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'Now'; // Initialize the selected value

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
                  const Text('Ways to save with Uber'),
                  BannerSedan(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
