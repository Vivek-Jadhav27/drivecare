import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double appBarHeight = AppBar().preferredSize.height;
    final double carouselHeight = size.height * 0.2; // Adjust based on screen

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: appBarHeight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bhavnagar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Vidhyanaagar Bhavnagar Gujarat",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.03, // Responsive font size
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            Container(
              width: size.width * 0.1, // Responsive width
              height: size.width * 0.1, // Responsive height
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.05), // Responsive border radius
                child: Image.asset(
                  "assets/images/Image11.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.only(top: size.width * 0.1, bottom: size.width * 0.1),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.05), // Responsive border radius
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.width * 0.01),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: carouselHeight,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: [
                  Container(
                    margin: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/intro.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(size.width * 0.01),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Baner.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.02,
              ),
              Text(
                "Schedule Service",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add other widgets here with responsive sizes
            ],
          ),
        ),
      ),
    );
  }
}
