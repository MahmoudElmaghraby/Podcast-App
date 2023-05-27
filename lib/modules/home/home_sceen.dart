import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildListTile();
      },
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
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
