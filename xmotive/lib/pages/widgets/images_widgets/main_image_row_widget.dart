import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmotive/models/change_images.dart';
import 'package:xmotive/models/list_images.dart';
import 'package:xmotive/pages/home_page.dart';
import 'package:xmotive/quoters/get_quoters_page.dart';
import 'package:xmotive/quoters/who_am_i.dart';
import 'package:http/http.dart' as http;

class MainImageRowWidget extends StatelessWidget {
  const MainImageRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              height: 50,
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<ChangeImages>(context, listen: false)
                    .changeImages(1);
                // ChangeImage(x);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
              },
              child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Image(
                  image: AssetImage(list_images[1]),
                  // image: Image.asset(Images.you_can),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<ChangeImages>(context, listen: false)
                    .changeImages(3);
                // ChangeImage(x);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
              },
              child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Image(
                  image: AssetImage(list_images[3]),
                  // image: Image.asset(Images.you_can),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhoAmI()),
                );
              },
              child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Color(0xFFA7B4E0),
                  color: Colors.grey,
                  // boxShadow: [
                  //   BoxShadow(color: Colors.white, spreadRadius: 3),
                  // ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "My",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Favorites!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpeg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            SizedBox(width: 14),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhoAmI()),
                );
              },
              child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Color(0xFFA7B4E0),
                  color: Colors.grey,
                  // boxShadow: [
                  //   BoxShadow(color: Colors.white, spreadRadius: 3),
                  // ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Who am I!?",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          // Text(
                          //   "Something!",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpeg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            SizedBox(width: 14),
            GestureDetector(
              onTap:
                  // () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => WhoAmI()),
                  //   );
                  // },

                  () async {
                var url = Uri.parse(
                    'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                var response = await http.get(url);
                var data = jsonDecode(response.body);
                String quote = data["quotes"][0]["text"];
                String author = data["quotes"][0]["author"];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GetQuotersPage(
                          quoterName: quote, authorName: author)),
                );

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => GetQuotersPage(
                //           quoterName: quote, authorName: author)),
                // );
              },
              child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Color(0xFFA7B4E0),
                  color: Colors.grey,
                  // boxShadow: [
                  //   BoxShadow(color: Colors.white, spreadRadius: 3),
                  // ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 8.0),
                    //   child: Container(
                    //     height: 55.0,
                    //     width: 55.0,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/logo.jpeg'),
                    //         fit: BoxFit.fill,
                    //       ),
                    //       shape: BoxShape.circle,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 14,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "3!?",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          // Text(
                          //   "Something!",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpeg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
