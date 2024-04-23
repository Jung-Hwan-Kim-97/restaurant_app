import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool isBackIcon;

  const CustomAppBar(
      {required this.appBarTitle, required this.isBackIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      foregroundColor: Colors.black,
      automaticallyImplyLeading: isBackIcon ? true : false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
