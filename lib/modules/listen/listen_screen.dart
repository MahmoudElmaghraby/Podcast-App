import 'package:flutter/material.dart';
import 'package:podcast_app/shared/styles/constants.dart';

class ListenScreen extends StatelessWidget {
  const ListenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: backTextColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/main_img.jpeg',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Text(
            'Podcast title name',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Author name',
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
          Slider(
            min: 0,
            max: Duration.zero.inSeconds.toDouble(),
            value: Duration.zero.inSeconds.toDouble(),
            onChanged: (value) {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '00:00',
                style: TextStyle(color: textColor),
              ),
              Text(
                '03:24',
                style: TextStyle(color: textColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPlayButtons(
                iconData: Icons.favorite_border,
                context: context,
                buttonWidth: 40,
                buttonHeight: 35,
                iconSize: 20,
              ),
              _buildPlayButtons(
                iconData: Icons.arrow_back,
                context: context,
              ),
              _buildPlayButtons(
                  iconData: Icons.play_arrow,
                  context: context,
                  buttonHeight: 75,
                  buttonWidth: 75,
                  iconSize: 60),
              _buildPlayButtons(
                iconData: Icons.arrow_forward,
                context: context,
              ),
              _buildPlayButtons(
                iconData: Icons.add,
                context: context,
                buttonWidth: 40,
                buttonHeight: 35,
                iconSize: 20,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

Widget _buildPlayButtons({
  required IconData iconData,
  required BuildContext context,
  double buttonHeight = 50,
  double buttonWidth = 50,
  double iconSize = 30,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: Container(
      height: buttonHeight,
      width: buttonWidth,
      color: Theme.of(context).primaryColor,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    ),
  );
}
