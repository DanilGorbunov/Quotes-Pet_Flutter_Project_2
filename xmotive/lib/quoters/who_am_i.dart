import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmotive/models/change_images.dart';
import 'package:xmotive/pages/home_page.dart';
import 'package:xmotive/pages/widgets/home_buttons_widget.dart';

class WhoAmI extends StatefulWidget {
  const WhoAmI({super.key});

  @override
  State<WhoAmI> createState() => _WhoAmIState();
}

PageController _controller = PageController(initialPage: 0);

class _WhoAmIState extends State<WhoAmI> {
  @override
  Widget build(BuildContext context) {
    var change_image = Provider.of<ChangeImages>(context).images;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/dragon.jpeg'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              PageView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Text(
                        'Do not stop. Do not lose faith. Steve Jobs',
                        style: TextStyle(
                          fontSize: 31.0,
                          fontFamily: "MonteCarlo",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Image(
                      //   image: AssetImage('assets/images/dragon.jpeg'),
                      //   fit: BoxFit.cover,
                      //   width: double.infinity,
                      //   height: double.infinity,
                      // ),
                      // Text('ok'),
                      Text(change_image.toString(),
                          style: TextStyle(
                            color: Colors.amber,
                          )),
                    ],
                  ),
                  // p1()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 750.0),
                child: HomeButtonWidget(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
