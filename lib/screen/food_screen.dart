import 'package:flutter/material.dart';
import 'package:restaurant_app/layout/index.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        showAppBar: true,
        showBottomNavigationBar: true,
        appBarTitle: 'FOOD SCREEN',
        body: Column(
          children: [],
        ));
  }
}
