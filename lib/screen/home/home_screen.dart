import 'package:flutter/material.dart';
import 'package:ship_tracker/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF7FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomHomeWidget(
                  title: 'Booking',
                  image: 'assets/images/appointment.png',
                ),
                CustomHomeWidget(
                  title: 'Booking',
                  image: 'assets/images/tracking.png',
                ),
                CustomHomeWidget(
                  title: 'Booking',
                  image: 'assets/images/cart.png',
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: const Color(0xFFF0F3F6),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(5, 2),
                        blurRadius: 10,
                        spreadRadius: 1),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 15,
                        spreadRadius: 1)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Last Login:    ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: '10 PM'),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  RichText(
                    text: const TextSpan(
                      text: 'Total Ship:    ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: '4'),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  RichText(
                    text: const TextSpan(
                      text: 'Cargo Ship:    ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: '3'),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  RichText(
                    text: const TextSpan(
                      text: 'Naval Ship:    ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: '2'),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  RichText(
                    text: const TextSpan(
                      text: 'In The Ocean:    ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: '1'),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  RichText(
                    text: const TextSpan(
                      text: 'In The Port:    ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: '0'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({
    Key? key,
    this.title,
    this.image,
  }) : super(key: key);
  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFF0F3F6),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(5, 2),
                  blurRadius: 10,
                  spreadRadius: 1),
              const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, -5),
                  blurRadius: 15,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            Image.asset(
              image!,
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenHeight(50),
              fit: BoxFit.cover,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              title!,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
