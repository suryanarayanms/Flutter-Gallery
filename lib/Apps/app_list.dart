import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery/Provider/apps.dart';
import 'package:url_launcher/url_launcher.dart';

class AppTile extends StatelessWidget {
  const AppTile({
    super.key,
    required this.title,
    required this.description,
    required this.downloads,
    required this.bg,
    required this.launchurl,
    required this.redirect,
    required this.textcolor,
  });

  final String title;
  final String description;
  final String downloads;
  final bg;
  final launchurl;
  final redirect;
  final textcolor;

  @override
  Widget build(BuildContext context) {
    return context.watch<Apps>().theme
        ? Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                color: Colors.white.withOpacity(0.06),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20, right: 20, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.michroma(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(bg), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  const Spacer(),
                  (downloads != "" && downloads != " ")
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: SizedBox(
                                  height: 15,
                                  child: Image.asset(
                                    'lib/images/download.png',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '$downloads+',
                                style: GoogleFonts.audiowide(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          description,
                          style: GoogleFonts.notoSans(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      (downloads != "")
                          ? Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: GestureDetector(
                                onTap: (() => {
                                      downloads != " "
                                          ? launch(launchurl)
                                          : null
                                    }),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.1)),
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        redirect,
                                        style: GoogleFonts.audiowide(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
            )
          ])
        : Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.white.withOpacity(0.1)),
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
                color: Colors.grey[300],
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20, right: 20, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.michroma(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
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
                          color: Colors.grey[300],
                          image: DecorationImage(
                              image: AssetImage(bg), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  const Spacer(),
                  (downloads != "" && downloads != " ")
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: SizedBox(
                                  height: 15,
                                  child: Image.asset(
                                    'lib/images/download.png',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                '$downloads+',
                                style: GoogleFonts.audiowide(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          description,
                          style: GoogleFonts.notoSans(
                              color: Colors.grey[700],
                              // fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      (downloads != "")
                          ? Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: GestureDetector(
                                onTap: (() => {
                                      downloads != " "
                                          ? launch(launchurl)
                                          : null
                                    }),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
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
                                      color: Colors.grey[300],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        redirect,
                                        style: GoogleFonts.audiowide(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
            )
          ]);
  }
}
