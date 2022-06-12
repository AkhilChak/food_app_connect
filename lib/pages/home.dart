import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/pages/qr_scanner.dart';
import 'package:project/pages/restaurant_info_medium_card.dart';
import 'package:project/pages/section_title.dart';
import 'package:project/utils.dart';

import 'image_carousel.dart';


class MyHomePage extends StatelessWidget {

  final List<Map<String, String>> demoMediumCardData = [
    {
      "name":"Mc Donalds",
      "location":"Anna Nagar, Chennai",
      "image":"assets/images/pexels-lisa.jpg",
      "deliveryTime":"15",
      "rating":"4.6"
    },
    {
      "name":"Sea Shell",
      "location":"Adyar, Chennai",
      "image":"assets/images/Sea_Shell_Food.jpg",
      "deliveryTime":"8",
      "rating":"4.7"
    },
    {
      "name":"Mc Donalds",
      "location":"Chennai",
      "image":"assets/images/food3.png",
      "deliveryTime":"5",
      "rating":"4.3"
    },
    {
      "name":"Mc Donalds",
      "location":"Chennai",
      "image":"assets/images/food1.jpg",
      "deliveryTime":"9",
      "rating":"4.4"
    },
    {
      "name":"Mc Donalds",
      "location":"Chennai",
      "image":"assets/images/food2.jpg",
      "deliveryTime":"11",
      "rating":"3.9"
    }
  ];
  final List<Map<String, String>> featureCardData = [
    {
      "name":"Le Panache",
      "location":"Bengaluru",
      "image":"assets/images/food (3).jpg",
      "deliveryTime":"12",
      "rating":"4.3"
    },
    {
      "name":"Jacobs creek",
      "location":"Marathalli, Bangalore",
      "image":"assets/images/food (4).jpg",
      "deliveryTime":"7",
      "rating":"3.9"
    },
    {
      "name":"Old Town Road",
      "location":"Koramangla, Bangalore",
      "image":"assets/images/food (5).jpg",
      "deliveryTime":"18",
      "rating":"4.8"
    },
    {
      "name":"Six Nine",
      "location":"Chennai",
      "image":"assets/images/food (6).jpg",
      "deliveryTime":"15",
      "rating":"4.20"
    },
    {
      "name":"Tomasso Inn",
      "location":"Chennai",
      "image":"assets/images/food (7).jpg",
      "deliveryTime":"9",
      "rating":"4.4"
    }
  ];
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorManager.appBarColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            floating: true,
            title: Text(
              "Hungry Pandas",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){},
                child: const Text(
                  "Filter",
                  style: TextStyle(color: Colors.black),
                ),
                )
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: ColorManager.defaultPadding),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(ColorManager.defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Featured Partners",
                press: (){},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  demoMediumCardData.length, 
                  (index) => Padding(
                    padding: EdgeInsets.only(left: ColorManager.defaultPadding),
                    child: RestaurantInfoMediumCard(
                      title: featureCardData[index]['name']!,
                      location: featureCardData[index]['location']!,
                      image: featureCardData[index]['image']!,
                      deliveryTime: int.parse(featureCardData[index]['deliveryTime']!),
                      rating: double.parse(featureCardData[index]['rating']!),
                      press: (){},
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.all(ColorManager.defaultPadding),
          //   sliver: SliverToBoxAdapter(
          //     child: Image.asset("assets/images/food3.png", fit: BoxFit.fill),
          //   ),
          // ),
          SliverPadding(
            padding: EdgeInsets.all(ColorManager.defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Best Picks",
                press: (){},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  demoMediumCardData.length, 
                  (index) => Padding(
                    padding: EdgeInsets.only(left: ColorManager.defaultPadding),
                    child: RestaurantInfoMediumCard(
                      title: demoMediumCardData[index]['name']!,
                      location: demoMediumCardData[index]['location']!,
                      image: demoMediumCardData[index]['image']!,
                      deliveryTime: int.parse(demoMediumCardData[index]['deliveryTime']!),
                      rating: double.parse(demoMediumCardData[index]['rating']!),
                      press: (){},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff272343),
        onPressed: () async{
          PermissionStatus status = await _getCameraPermission();
          if (status.isGranted) {
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => const QRScanner()));
          }
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }
}



