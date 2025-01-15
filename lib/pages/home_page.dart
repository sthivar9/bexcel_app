import 'package:bexcel/main/note_page.dart';
import 'package:bexcel/pages/profile_page.dart';
import 'package:bexcel/storage/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const NotePage(),
    const UploadPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const NotePage(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const UploadPage(),
          item: ItemConfig(
            icon: Icon(Icons.add),
            title: "Add",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
            icon: Icon(Icons.person_3),
            title: "Profile",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style8BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
