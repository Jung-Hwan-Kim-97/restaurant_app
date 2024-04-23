import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant/restaurant_detail_model/restaurant_detail.dart';
import 'package:restaurant_app/utils/constant/colors.dart';
import 'package:restaurant_app/utils/constant/ip.dart';

class MenuCard extends StatelessWidget {
  final String imgUrl;
  final String detail;
  final String name;
  final int price;

  const MenuCard(
      {required this.imgUrl,
      required this.detail,
      required this.name,
      required this.price,
      super.key});

  factory MenuCard.fromModel({required RestaurantProductModel model}) {
    return MenuCard(
      imgUrl: model.imgUrl,
      detail: model.detail,
      name: model.name,
      price: model.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _menuImage(imgUrl),
          SizedBox(
            width: 5,
          ),
          Expanded(child: _menuInfo(detail, name, price))
        ],
      ),
    );
  }
}

_menuImage(String imgUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
      '$baseUrl/${imgUrl}',
      fit: BoxFit.cover,
      width: 100,
      height: 100,
    ),
  );
}

_menuInfo(String detail, String name, int price) {
  TextStyle textStyle = TextStyle(fontSize: 10);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      Text(
        detail,
        style: TextStyle(
            color: BODY_TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 14),
        overflow: TextOverflow.ellipsis,
      ),
      Text('W$price',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: PRIMARY_COLOR, fontSize: 12, fontWeight: FontWeight.w500)),
    ],
  );
}
