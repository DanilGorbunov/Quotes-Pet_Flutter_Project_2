import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xmotive/quoters/get_quoters_page.dart';
import 'package:xmotive/quoters/who_am_i.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget(BuildContext context, {super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'General',
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey, //change background color of button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15.0,
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                // height: 200,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              ElevatedButton(
                                child: const Text('Close',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    )),
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 20),
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          //FirstRowWidget(),
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
                                          side: BorderSide(
                                              color: Colors.amber)))),
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
                                          quoterName: quote,
                                          authorName: author)),
                                );
                              },
                              child: const Text('Do something!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
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
                                          side: BorderSide(
                                              color: Colors.amber)))),
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
                                      builder: (context) => WhoAmI()),
                                );
                              },
                              child: const Text('Do not stop!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Text('Modal BottomSheet'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
