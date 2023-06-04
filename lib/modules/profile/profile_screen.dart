import 'package:flutter/material.dart';
import 'package:podcast_app/shared/styles/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: backTextColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16,),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/main_img.jpeg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                       Text(
                        'Mahmoud Elmaghraby',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'mahmoud@gmail.com',
                        style: TextStyle(
                          color: deadColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFF02afa2),
                icon: Icons.phone_android,
                title: 'Add your phone number',
                subTitle: 'to get special offers',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFF5e5bff),
                icon: Icons.person,
                title: 'Your account',
                subTitle: 'Your personal info',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFF965afe),
                icon: Icons.subscriptions,
                title: 'Subscriptions',
                subTitle: 'Manage your purchases',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFFfeaf5f),
                icon: Icons.lock,
                title: 'Privacy settings',
                subTitle: 'Music privacy, stories & sharing',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFF975afd),
                icon: Icons.music_note,
                title: 'Music settings',
                subTitle: 'Audio quality & music behaviour',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFFdc4ce3),
                icon: Icons.settings,
                title: 'App settings',
                subTitle: 'Dark mode & language',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFFe24f53),
                icon: Icons.notification_add,
                title: 'Notifications',
                subTitle: 'Recommendations, chats & activities',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFF009bfc),
                icon: Icons.import_contacts,
                title: 'Import your music',
                subTitle: 'Bring in your Spotify, Deezer or Youtube music',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFFcd3450),
                icon: Icons.error,
                title: 'Help center',
                subTitle: 'Facing some issues? We\'ll help you',
              ),
              _buildProfileItem(
                iconBackgroundColor: const Color(0xFFce3151),
                icon: Icons.logout,
                title: 'Logout',
                subTitle: 'mahmoud@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildProfileItem({
  required Color iconBackgroundColor,
  required IconData icon,
  required String title,
  required String subTitle,
}) {
  return Column(
    children: [
      ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            color: deadColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 40,
            height: 40,
            color: iconBackgroundColor,
            child: Icon(
              icon,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: textColor,
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(),
          ),
        ),
      ),
    ],
  );
}
