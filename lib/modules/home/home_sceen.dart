import 'package:flutter/material.dart';
import 'package:podcast_app/shared/styles/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backTextColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: _buildCustomAppBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Explore',
              style: TextStyle(
                color: textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildUnderExploreContainers('Top in Egypt'),
              _buildUnderExploreContainers('Recently Played'),
            ],
          ),
          const SizedBox(height: 16),
          _buildMostSharedCard(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _buildListTile();
              },
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildListTile() {
  return ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset('assets/images/main_img.jpeg'),
    ),
    title: const Text('Main title'),
    subtitle: const Text('Sub title'),
    onTap: () {},
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    ),
  );
}

Widget _buildUnderExploreContainers(String text) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      color: deadColor,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ),
  );
}

Widget _buildMostSharedCard() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      elevation: 30,
      color: deadColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Shared',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                        const Text('Song Description'),
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
      ),
    ),
  );
}

Widget _buildCustomAppBar() {
  return ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        'assets/images/main_img.jpeg',
        width: 40,
        height: 40,
      ),
    ),
    title: Text(
      'Mahmoud Elmaghraby',
      style: TextStyle(
        color: textColor,
      ),
    ),
    subtitle: Text(
      'Sub title',
      style: TextStyle(
        color: deadColor,
      ),
    ),
    onTap: () {},
  );
}
