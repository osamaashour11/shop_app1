import 'package:flutter/material.dart';
import 'package:shop_app/modules/login_screen/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardModel {
  final String image;
  final String title;
  final String description;

  OnBoardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardModel> onBoardList = [
    OnBoardModel(
      image: 'assets/images/on_board_1.png',
      title: 'Title of on_board_1.',
      description: 'Description of on_board_1.',
    ),
    OnBoardModel(
      image: 'assets/images/on_board_2.png',
      title: 'Title of on_board_2.',
      description: 'Description of on_board_2.',
    ),
    OnBoardModel(
      image: 'assets/images/on_board_3.png',
      title: 'Title of on_board_3.',
      description: 'Description of on_board_3.',
    ),
  ];
  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: defultTextButton(
                  onPressed: () {
                    navigateToAndRemoveAll(
                      context,
                      LoginScreen(),
                    );
                  },
                  text: 'Skip',
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => defultOnBoardingItem(
                  onBoardList[index],
                ),
                itemCount: onBoardList.length,
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == onBoardList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: onBoardList.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: defultColor,
                    spacing: 5,
                    expansionFactor: 4,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()),
                        (route) => false,
                      );
                    } else {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget defultOnBoardingItem(OnBoardModel onBoardModel) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(
              onBoardModel.image,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          defultText(
            text: onBoardModel.title,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          defultText(
            text: onBoardModel.description,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ],
      );
}
