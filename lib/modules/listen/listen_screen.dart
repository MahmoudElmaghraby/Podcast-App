import 'package:flutter/material.dart';

class ListenScreen extends StatelessWidget {
  const ListenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/cover.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/main_img.jpeg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Podcast title name',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Desc. (a long description for this podcast in details)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'NOTES : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  _buildPlayButtons(Icons.access_alarms, context),
                  _buildPlayButtons(Icons.arrow_back, context),
                  _buildPlayButtons(Icons.arrow_forward, context),
                  _buildPlayButtons(Icons.stop, context),
                  _buildPlayButtons(Icons.favorite, context),
                  _buildPlayButtons(Icons.add, context),
                ],
              ),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Bookmark this podcast'),
                ),
              ),
            ],
          ),
        ),

        // TextButton(onPressed: (){}, child: child),
      ],
    );
  }
}

Widget _buildPlayButtons(IconData iconData, BuildContext context) {
  return Expanded(
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    ),
  );
}
