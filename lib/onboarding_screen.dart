import 'package:flutter/material.dart';
import 'intro_screens/intro_page_1.dart';
import 'intro_screens/intro_page_2.dart';
import 'intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>{
  //controller for keeping track of what page we're on
  final PageController _controller = PageController();

  //keep track of page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            //page view
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),

            //dot indicators
            Container(
                alignment: const Alignment(0, 0.85),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //skip
                      GestureDetector(
                          onTap: (){
                            _controller.jumpToPage(2);
                          },
                          child: const Text("skip")
                      ),
                      //dot indicator
                      SmoothPageIndicator(controller: _controller, count: 3,),
                      //next or done
                      onLastPage ?
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                )
                            );
                          },
                          child: const Text("done")
                      )
                          : GestureDetector (
                          onTap: (){
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn
                            );
                          },
                          child: const Text("next")
                      ),
                    ]
                )
            )
          ],
        )
    );
  }
}