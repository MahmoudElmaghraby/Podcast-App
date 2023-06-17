import 'package:flutter/material.dart';
import 'package:podcast_app/modules/home/home_sceen.dart';
import 'package:podcast_app/shared/styles/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backTextColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Search & Discover',
                style: TextStyle(
                  fontSize: 40,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: textColor,
                    filled: true,
                    labelStyle: TextStyle(color: deadColor),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                      ),
                    ),
                    hintText: 'Songs, artists, playlists, etc...',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Popular',
                style: TextStyle(
                  fontSize: 25,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPopularItems(
                        screenHeight: fullHeight,
                        screenWidth: fullWidth,
                        imagePath: 'assets/images/onBoarding6.jpg',
                        text: 'New Music',
                      ),
                      _buildPopularItems(
                        screenHeight: fullHeight,
                        screenWidth: fullWidth,
                        imagePath: 'assets/images/onBoarding5.jpg',
                        text: 'Top',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPopularItems(
                        screenHeight: fullHeight,
                        screenWidth: fullWidth,
                        imagePath: 'assets/images/onBoarding4.jpg',
                        text: 'Podcast',
                      ),
                      _buildPopularItems(
                        screenHeight: fullHeight,
                        screenWidth: fullWidth,
                        imagePath: 'assets/images/onBoarding7.jpg',
                        text: 'For you',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Hot & Trending',
                style: TextStyle(
                  fontSize: 25,
                  color: textColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/song2.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Song title',
                                style: TextStyle(
                                  color: textColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Song Description',
                                style: TextStyle(
                                  color: deadColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPopularItems({
  required double screenWidth,
  required double screenHeight,
  required String imagePath,
  required String text,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        // image: AssetImage('assets/images/onBoarding6.jpg'),
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
    width: screenWidth * 0.43,
    height: screenHeight * 0.15,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 32,
        left: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
