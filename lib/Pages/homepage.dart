import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery/Apps/app_list.dart';
import 'package:flutter_gallery/Provider/apps.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gallery/Widgets/glass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<Apps>().theme
        ? Scaffold(
            body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/background.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Center(child: Glass()),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "CEO Surya",
                          style: GoogleFonts.righteous(
                              color: Colors.white, fontSize: 30),
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () => {
                                  context.read<Apps>().changeTheme(),
                                },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.1)),
                                color: Colors.white.withOpacity(0.06),
                              ),
                              height: 50,
                              width: 50,
                              child: const Icon(Icons.ac_unit_outlined,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ),

                  //Carousel View
                  Expanded(child: Consumer<Apps>(
                    builder: (context, value, child) {
                      return CarouselSlider.builder(
                          itemCount: value.apptile.length,
                          itemBuilder: ((context, index, int pageViewIndex) {
                            return AppTile(
                              title: value.apptile[index][0],
                              description: value.apptile[index][1],
                              downloads: value.apptile[index][2],
                              bg: value.apptile[index][3],
                              launchurl: value.apptile[index][4],
                              redirect: value.apptile[index][5],
                              textcolor: value.apptile[index][6],
                            );
                          }),
                          options: CarouselOptions(
                            height: 230,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                            autoPlayCurve: Curves.easeOutQuint,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ));
                    },
                  )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 30.0, right: 20),
                    child: Container(
                      // height: 50,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.1)),
                        color: Colors.white.withOpacity(0.06),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'I shall not stop this here',
                            style: GoogleFonts.cinzelDecorative(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 30.0, right: 20),
                    child: Container(
                      // height: 50,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.1)),
                        color: Colors.white.withOpacity(0.06),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: 'ceosuryams@gmail.com',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject': 'CEO Surya',
                                    'body': ''
                                  }),
                                );
                                launchUrl(emailLaunchUri);
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/email.png',
                                    color: Colors.white,
                                  )),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {
                                launch('https://github.com/suryanarayanms/')
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/github.png',
                                    color: Colors.white,
                                  )),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {
                                launch('https://www.instagram.com/sur_yahhh_/')
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/instagram.png',
                                    color: Colors.white,
                                  )),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {
                                launch(
                                    'https://play.google.com/store/apps/dev?id=8712759064188571088')
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/playstore.png',
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Grid view example
                  // Expanded(
                  //   child: Consumer<Apps>(builder: (context, value, child) {
                  //     return GridView.builder(
                  //         itemCount: value.apptile.length,
                  //         gridDelegate:
                  //             const SliverGridDelegateWithFixedCrossAxisCount(
                  //                 crossAxisCount: 2),
                  //         itemBuilder: ((context, index) {
                  //           return AppTile(
                  //             title: value.apptile[index][0],
                  //             description: value.apptile[index][1],
                  //             downloads: value.apptile[index][2],
                  //             color: value.apptile[index][3],
                  //             launchurl: value.apptile[index][4],
                  //             // color: '',
                  //           );
                  //         }));
                  //   }),
                  // ),
                ],
              ),
            ],
          ))
        : Scaffold(
            body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: const Center(child: Glass()),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "CEO Surya",
                          style: GoogleFonts.righteous(
                              color: Colors.black, fontSize: 30),
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () => {
                                  context.read<Apps>().changeTheme(),
                                },
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300],
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade500,
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                    const BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1)
                                  ],
                                ),
                                child: const Icon(Icons.light,
                                    color: Colors.black))),
                      ],
                    ),
                  ),

                  //Carousel View
                  Expanded(child: Consumer<Apps>(
                    builder: (context, value, child) {
                      return CarouselSlider.builder(
                          itemCount: value.apptile.length,
                          itemBuilder: ((context, index, int pageViewIndex) {
                            return AppTile(
                              title: value.apptile[index][0],
                              description: value.apptile[index][1],
                              downloads: value.apptile[index][2],
                              bg: value.apptile[index][3],
                              launchurl: value.apptile[index][4],
                              redirect: value.apptile[index][5],
                              textcolor: value.apptile[index][6],
                            );
                          }),
                          options: CarouselOptions(
                            height: 230,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                            autoPlayCurve: Curves.easeOutQuint,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ));
                    },
                  )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 30.0, right: 20),
                    child: Container(
                      // height: 50,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1)
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'I shall not stop this here',
                            style: GoogleFonts.cinzelDecorative(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 30.0, right: 20),
                    child: Container(
                      // height: 50,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: 'ceosuryams@gmail.com',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject': 'CEO Surya',
                                    'body': ''
                                  }),
                                );
                                launchUrl(emailLaunchUri);
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/email.png',
                                    color: Colors.black,
                                  )),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {
                                launch('https://github.com/suryanarayanms/')
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/github.png',
                                    color: Colors.black,
                                  )),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {
                                launch('https://www.instagram.com/sur_yahhh_/')
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/instagram.png',
                                    color: Colors.black,
                                  )),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {
                                launch(
                                    'https://play.google.com/store/apps/dev?id=8712759064188571088')
                              },
                              child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'lib/images/playstore.png',
                                    color: Colors.black,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  //Grid view example
                  // Expanded(
                  //   child: Consumer<Apps>(builder: (context, value, child) {
                  //     return GridView.builder(
                  //         itemCount: value.apptile.length,
                  //         gridDelegate:
                  //             const SliverGridDelegateWithFixedCrossAxisCount(
                  //                 crossAxisCount: 2),
                  //         itemBuilder: ((context, index) {
                  //           return AppTile(
                  //             title: value.apptile[index][0],
                  //             description: value.apptile[index][1],
                  //             downloads: value.apptile[index][2],
                  //             color: value.apptile[index][3],
                  //             launchurl: value.apptile[index][4],
                  //             // color: '',
                  //           );
                  //         }));
                  //   }),
                  // ),
                ],
              ),
            ],
          ));
  }
}
