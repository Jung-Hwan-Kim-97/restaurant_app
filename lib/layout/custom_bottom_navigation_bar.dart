import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/utils/constant/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> navigationItemList = [
      {'icon': Icons.home_outlined, 'label': '홈'},
      {'icon': Icons.fastfood_outlined, 'label': '음식'},
      {'icon': Icons.receipt_long_outlined, 'label': '주문'},
      {'icon': Icons.person_outline, 'label': '프로필'},
    ];

    void pageNavigationHandler(int index) {
      index == 0
          ? context.push('/home')
          : index == 1
              ? context.push('/food')
              : index == 2
                  ? context.push('/order')
                  : index == 3
                      ? context.push('/profile')
                      : null;
    }

    return BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
          pageNavigationHandler(selectedIndex);
        },
        items: navigationItemList
            .map((navigationItem) => BottomNavigationBarItem(
                icon: Icon(navigationItem['icon']),
                label: navigationItem['label']))
            .toList());
  }
}
