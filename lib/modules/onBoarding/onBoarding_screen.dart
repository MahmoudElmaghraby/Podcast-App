import 'package:flutter/material.dart';
import 'package:podcast_app/layout/bottom_nav_layout.dart';
import 'package:podcast_app/modules/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

var pageViewController = PageController();
bool isLastPage = false;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              isLastPage = value == 2;
            });
          },
          controller: pageViewController,
          children: [
            _buildPage(
                image: 'assets/images/onBoarding1.jpg',
                title: 'First onBoarding',
                subTitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
            _buildPage(
                image: 'assets/images/onBoarding2.jpg',
                title: 'Second onBoarding',
                subTitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
            _buildPage(
                image: 'assets/images/onBoarding3.jpg',
                title: 'Third onBoarding',
                subTitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      pageViewController.jumpToPage(2);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.green.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      onDotClicked: (index) => pageViewController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      ),
                      controller: pageViewController,
                      count: 3,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageViewController.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.green.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

Widget _buildPage({
  required String image,
  required String title,
  required String subTitle,
}) =>
    Container(
      color: Colors.orange.shade400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 64),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subTitle,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
