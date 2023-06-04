import 'package:flutter/material.dart';
import 'package:podcast_app/shared/styles/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backTextColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 16, right: 16),
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
              Container(
                height: 600,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildSearchItem('Name of search');
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
}

Widget _buildSearchItem(String title) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            alignment: Alignment.centerLeft,
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}
