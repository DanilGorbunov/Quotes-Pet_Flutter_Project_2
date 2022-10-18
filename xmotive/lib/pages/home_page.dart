import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xmotive/models/change_images.dart';
import 'package:xmotive/models/general_quoters.dart';
import 'package:xmotive/models/list_images.dart';
import 'package:xmotive/quoters/general_quoters.dart';
import 'package:xmotive/pages/widgets/buttons_menu_widget.dart';
import 'package:xmotive/pages/widgets/images_widgets/main_image_row_widget.dart';
import 'package:xmotive/pages/widgets/home_buttons_widget.dart';

import '../quoters/who_am_i.dart';

class HomePage extends StatelessWidget with ChangeNotifier {
  HomePage({super.key});

  static const String _title = 'Flutter Code Sample';
  bool colororpicture = true;
  int change_image = 1;

  @override
  ChangeImage(x) {
    final int change_image = x;
    return change_image;
  }

  @override
  Widget build(BuildContext context) {
    // var new_change_image = Provider.of<ChangeImages>(context).images;

    return MultiProvider(
      providers: [
        Provider(create: (context) => change_image),
        ChangeNotifierProvider(
            create: (context) => ChangeImages(ChangeImage(change_image)))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        home: SafeArea(
          child: Scaffold(
            //backgroundColor: Colors.black,
            // !colororpicture
            //  ? Colors.black
            //  :Colors.green,
            // Image(
            //     image: AssetImage(liste[1]),
            //     //image: Image.asset(Images.liste[1]),
            //     fit: BoxFit.cover,
            //     width: double.infinity,
            //     height: double.infinity,
            //   ),
            // appBar: AppBar(title: const Text(_title)),
            body: Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   // image: AssetImage(list_images[change_image]),
                    //   image: AssetImage(list_images[ChangeImage(change_image)]),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                child: const MainScreenWidget()),
          ),
        ),
      ),
    );
  }
}

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralQuoters(false);
  }
}

// class Temperature extends ChangeNotifier {
//   int temperature = 20;

//   plusTemp(temp) {
//     temperature + temp;
//     print(temp);
//     notifyListeners();
//   }
// }

// class ChangeImages extends ChangeNotifier {
//   int change_image = 0;

//   ChangeImage(x) {
//     final int change_image = x;
//     return change_image;
//   }
// }
