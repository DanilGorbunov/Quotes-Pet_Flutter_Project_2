import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmotive/models/change_images.dart';
import 'package:xmotive/models/general_quoters.dart';
import 'package:xmotive/models/list_images.dart';
import 'package:xmotive/pages/home_page.dart';
import 'package:xmotive/pages/widgets/home_buttons_widget.dart';

class GeneralQuoters extends StatefulWidget {
  const GeneralQuoters(bool colororpicture, {super.key});

  @override
  State<GeneralQuoters> createState() => _GeneralQuotersState();
}

class _GeneralQuotersState extends State<GeneralQuoters> {
  //add to setstate
  bool colororpicture = true;
//------

  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var new_change_image = Provider.of<ChangeImages>(context).images;

    return Container(
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // !colororpicture
            //     ? Image(
            //         image: AssetImage(change),
            //         //image: Image.asset(Images.liste[1]),
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //         height: double.infinity,
            //       )
            // :
            Image(
              image: AssetImage(list_images[new_change_image]),
              //image: Image.asset(Images.liste[1]),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  itemCount: quotesList.length,
                  itemBuilder: (
                    context,
                    index1,
                  ) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-' + ' ' + (quotesList[index1][main_quote]),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: "MonteCarlo",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                quotesList[index1][kAuthor],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "MonteCarlo",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 550.0),
              child: Container(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      // onTap: onShareClick,
                      child: Container(
                        // margin: EdgeInsets.only(left: 15),
                        // decoration: BoxDecoration(
                        //     // shape: BoxShape.circle,
                        //     border: Border.all(width: 1, color: Colors.white)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.download_outlined,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(new_change_image.toString(),
                        style: TextStyle(
                          color: Colors.amber,
                        )),
                    InkWell(
                      // onTap: onLikeClick,
                      child: Container(
                        // margin: EdgeInsets.only(left: 15),
                        // decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     border: Border.all(width: 1, color: Colors.white)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 700.0),
                    child: HomeButtonWidget(context),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
