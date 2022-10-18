import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmotive/pages/home_page.dart';
import 'package:xmotive/pages/widgets/first_row_menu_widget.dart';
import 'package:xmotive/quoters/get_quoters_page.dart';
import 'package:xmotive/pages/widgets/images_widgets/main_image_row_widget.dart';
import 'package:http/http.dart' as http;
import 'package:xmotive/quoters/who_am_i.dart';

class HomeButtonWidget extends StatefulWidget {
  const HomeButtonWidget(BuildContext context, {super.key});

  @override
  State<HomeButtonWidget> createState() => _HomeButtonWidgetState();
}

class _HomeButtonWidgetState extends State<HomeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var change_image = Provider.of<int>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ElevatedButton(
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
            builder: (
              BuildContext context,
            ) {
              return FractionallySizedBox(
                heightFactor: 0.9,
                child: Container(
                  // height: 200,
                  color: Colors.black,
                  child: LayoutBuilder(
                    builder: (BuildContext context,
                        BoxConstraints viewportConstraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
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
                                          child: const Text('Cancel',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              )),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 50, vertical: 20),
                                              textStyle: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                    FirstRowWidget(),
                                    MainImageRowWidget(),
                                    FirstRowWidget(),
                                  ],
                                ),
                              ),
                              // const Text('Modal BottomSheet'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
