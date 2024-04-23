import 'package:flutter/material.dart';
import 'package:restaurant_app/view/layout/index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        showBottomNavigationBar: true,
        showAppBar: true,
        appBarTitle: 'Profile Screen',
        body: Column(
          children: [],
        ));
  }
}
