import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          // padding: const EdgeInsets.all(16.0),
          children: [
            Material(
              elevation: 1.5,
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    const SearchTextField(),
                    MyListTile(),
                    Divider(),
                    MyListTile(),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset('assets/images/banner-payment.png'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Material(
              elevation: 1.5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Suggestions'),
                        TextButton(onPressed: () {}, child: Text('See all'))
                      ],
                    ),
                    Row(
                      children: [
                        ServiceBox(),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
