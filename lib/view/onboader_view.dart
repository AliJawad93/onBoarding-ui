import 'package:email_validator/constants/colors.dart';
import 'package:email_validator/constants/strings_border.dart';
import 'package:email_validator/widgets/Fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/onboardermodels/onboarding.dart';

class OnBoarderView extends StatefulWidget {
  OnBoarderView({Key? key}) : super(key: key);

  @override
  State<OnBoarderView> createState() => _OnBoarderViewState();
}

class _OnBoarderViewState extends State<OnBoarderView> {
  final PageController _controller = PageController();
  List<OnBoardingModel> onBoardingModelList = [
    OnBoardingModel(
        title: StringsBoarder.titlePage1,
        body: StringsBoarder.bodyPage1,
        image: StringsBoarder.imagePathPage1),
    OnBoardingModel(
        title: StringsBoarder.titlePage2,
        body: StringsBoarder.bodyPage2,
        image: StringsBoarder.imagePathPage2),
    OnBoardingModel(
        title: StringsBoarder.titlePage3,
        body: StringsBoarder.bodyPage3,
        image: StringsBoarder.imagePathPage3),
    OnBoardingModel(
        title: StringsBoarder.titlePage4,
        body: StringsBoarder.bodyPage4,
        image: StringsBoarder.imagePathPage4),
  ];
  int _currentIndex = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Get Started",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 21),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            TextButton(
                onPressed: () {
                  _controller.jumpToPage(onBoardingModelList.length - 1);
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ))
          ],
        ),
        body: PageView.builder(
            // scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            itemCount: onBoardingModelList.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _pageOnBoarder(onBoardingModelList[index], width);
            }),
        bottomNavigationBar: _bottomNavigationBar(height, width),
      ),
    );
  }

  Widget _pageOnBoarder(OnBoardingModel onBoardingModel, double width) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeAnimation(
              milliSecondsDuration: 900,
              translateStartValue: -130.0,
              dirctionAxisX: _currentIndex % 2 == 0 ? -1.0 : 1.0,
              child: Image.asset(
                onBoardingModel.image,
              )),
          FadeAnimation(
            milliSecondsDuration: 1100,
            translateStartValue: -120.0,
            dirctionAxisX: _currentIndex % 2 == 0 ? -1.0 : 1.0,
            child: Text(
              onBoardingModel.title,
              style: TextStyle(
                  fontSize: width * 0.06, fontWeight: FontWeight.bold),
            ),
          ),
          FadeAnimation(
            milliSecondsDuration: 1200,
            translateStartValue: -100.0,
            dirctionAxisX: _currentIndex % 2 == 0 ? -1.0 : 1.0,
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: width * 0.08, vertical: 10),
              child: Text(
                onBoardingModel.body,
                style: TextStyle(fontSize: width * 0.045),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(double height, double width) {
    return Container(
      height: height * 0.16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * 0.06,
                ),
                icon(0),
                icon(1),
                icon(2),
                icon(3),
              ],
            ),
          ),
          MaterialButton(
            height: height * 0.06,
            minWidth: width * 0.20,
            onPressed: () {
              setState(() {
                _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);

                //_controller.
              });
            },
            color: AppColors.buttonNextColor,
            child: Text(
              _currentIndex != onBoardingModelList.length - 1
                  ? "NEXT"
                  : "START",
              style: TextStyle(color: Colors.white, fontSize: width * 0.045),
            ),
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.buttonNextColor),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
          ),
        ],
      ),
    );
  }

  Widget icon(int indexPage) {
    return Icon(
      _currentIndex == indexPage ? Icons.circle : Icons.circle_outlined,
      size: _currentIndex == indexPage ? 12 : 10,
      color: AppColors.buttonNextColor,
    );
  }
}
