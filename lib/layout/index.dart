import 'package:flutter/material.dart';
import 'package:restaurant_app/layout/custom_app_bar.dart';
import 'package:restaurant_app/layout/custom_bottom_navigation_bar.dart';

class DefaultLayout extends StatelessWidget {
  final Color backgroundColor;
  final bool? showAppBar;
  final bool? showBottomNavigationBar;
  final bool? isBackIcon;
  final Widget body;
  final String appBarTitle;

  const DefaultLayout(
      {this.backgroundColor = Colors.white,
      this.showAppBar,
      this.isBackIcon,
      this.appBarTitle = '',
      this.showBottomNavigationBar,
      required this.body,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: showAppBar == true
              ? CustomAppBar(
                  appBarTitle: appBarTitle,
                  isBackIcon: isBackIcon == true ? true : false)
              : null,
          //
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: body,
          ),
          //
          bottomNavigationBar: showBottomNavigationBar == true
              ? CustomBottomNavigationBar()
              : null),
    );
  }
}
