import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/color.dart';
import 'package:ship_tracker/screen/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'My Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: Get.width,
                decoration: BoxDecoration(
                    color: const Color(0xffdfe6e9),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              minRadius: 40,
                              child: SizedBox(
                                height: Get.height * 0.1,
                                width: Get.height * 0.1,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: "",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      "assets/icon/profile_de.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.add_a_photo,
                                  color: kPrimaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Adnan",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Adnan@gmail.com",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 10),
                    //   child: Text(
                    //     'Tap to view your information!',
                    //     style: TextStyle(fontSize: 12, color: themeColor),
                    //   ),
                    // )
                  ],
                ),
              ),
              // SizedBox(height: Get.height * 0.05),
              // CustomIconAndText(
              //   iconData: Icons.document_scanner,
              //   tap: () {},
              //   titile: 'My Document',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconAndText extends StatelessWidget {
  const CustomIconAndText({
    Key? key,
    this.titile,
    this.iconData,
    this.tap,
  }) : super(key: key);

  final String? titile;
  final IconData? iconData;
  final GestureTapCallback? tap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        InkWell(
          onTap: tap,
          child: Row(
            children: [
              Icon(iconData),
              const SizedBox(width: 20),
              Text(
                titile!,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward)
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Divider()
      ],
    );
  }
}
