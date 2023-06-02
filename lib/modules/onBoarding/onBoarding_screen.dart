import 'package:flutter/material.dart';
import 'package:podcast_app/layout/bottom_nav_layout.dart';
import 'package:podcast_app/modules/login/login_screen.dart';
import 'package:podcast_app/shared/styles/constants.dart';
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
        color: const Color(0xFF090608),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 700,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    isLastPage = value == 2;
                  });
                },
                controller: pageViewController,
                children: [
                  _buildPage(
                      image: 'assets/images/onBoarding8.jpg',
                      title: 'First onBoarding',
                      subTitle:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
                  _buildPage(
                      image: 'assets/images/onBoarding5.jpg',
                      title: 'Second onBoarding',
                      subTitle:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
                  _buildPage(
                      image: 'assets/images/onBoarding6.jpg',
                      title: 'Third onBoarding',
                      subTitle:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: pageViewController,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Color(0xFFcb3979),
                dotWidth: 7,
                dotHeight: 7,
              ),
            ),
            const SizedBox(height: 16),
            buildMyElevatedButton(
              color: const Color(0xFFcb3979),
              text: 'NEXT',
              onButtonPressed: () {
                if (isLastPage) {
                  navigateToLoginScreen(context);
                } else {
                  pageViewController.nextPage(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeOut,
                  );
                }
              },
            ),
            buildMyElevatedButton(
              color: deadColor,
              text: isLastPage ? 'Get Started' : 'SKIP',
              onButtonPressed: () {
                if (isLastPage) {
                  navigateToLoginScreen(context);
                } else {
                  pageViewController.jumpToPage(2);
                }
              },
            ),
          ],
        ),
      ),

/*      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
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
            ),*/
    );
  }
}

Widget _buildPage({
  required String image,
  required String title,
  required String subTitle,
}) =>
    Column(
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
          style: TextStyle(
            color: textColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ],
    );

Widget buildMyElevatedButton({
  required Color color,
  required String text,
  Color buttonTextColor = const Color(0xFFfefcfd),
  required VoidCallback? onButtonPressed,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            color, //const Color(0xFFcb3979),
          ),
        ),
        onPressed: onButtonPressed,
        child: Text(
          text,
          style: TextStyle(
            color: buttonTextColor,
          ),
        ),
      ),
    ),
  );
}

navigateToLoginScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
}
