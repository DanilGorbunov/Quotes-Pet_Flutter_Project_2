import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class GetQuotersPage extends StatelessWidget {
  String quoterName;
  String authorName;

  GetQuotersPage(
      {super.key, required this.quoterName, required this.authorName});
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          // title: const Text('Quoters'),
        ),
        body:
            // PageView(
            //   controller: _controller,
            //   scrollDirection: Axis.vertical,
            //   children: [
            //     const ParsePage(),

            //     // GetQuotersPage(
            //     //             quoterName: quote, authorName: author);
            //   ],
            // ),
            Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                // Image.asset(
                //   'assets/images/dragon.jpeg',
                //   width: 400.0,
                //   height: 350.0,
                //   fit: BoxFit.cover,
                // ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 55),
                  child: Text(quoterName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 80.0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      authorName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 200, // <-- match_parent
                          height: 50, // <-- match-parent
                          child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.amber),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side:
                                            BorderSide(color: Colors.amber)))),
                            onPressed: () async {
                              var url = Uri.parse(
                                  'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                              var response = await http.get(url);
                              // print('Response status: ${response.statusCode}');
                              // print('Response body: ${response.body}');
                              var data = jsonDecode(response.body);
                              // print(data["quotes"][0]["text"]);
                              // print(data["quotes"][0]["author"]);
                              String quote = data["quotes"][0]["text"];
                              String author = data["quotes"][0]["author"];

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetQuotersPage(
                                        quoterName: quote, authorName: author)),
                              );
                            },
                            child: const Text('Next',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )

        // Container(
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     child: Text('ok'),
        //   ),
        // )
        );
  }
}
