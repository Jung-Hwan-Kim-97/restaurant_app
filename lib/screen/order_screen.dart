import 'package:flutter/material.dart';
import 'package:restaurant_app/layout/index.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        showBottomNavigationBar: true,
        showAppBar: true,
        appBarTitle: 'Order Screen',
        body: Column(
          children: [],
        ));
  }
}
