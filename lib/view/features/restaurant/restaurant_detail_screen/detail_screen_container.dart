import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant/restaurant_detail_model/restaurant_detail.dart';
import 'package:restaurant_app/view/features/restaurant/restaurant_card.dart';
import 'package:restaurant_app/view/features/restaurant/restaurant_detail_screen/menu_card.dart';

class DetailScreenContainer extends StatelessWidget {
  final RestaurantDetailModel restaurantDetailData;

  const DetailScreenContainer({required this.restaurantDetailData, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _MenuDetailImage(restaurantDetailData),
        _Title(),
        _MenuList(restaurantDetailData)
      ],
    );
  }
}

_MenuDetailImage(RestaurantDetailModel restaurantDetailModel) =>
    SliverToBoxAdapter(
      child: RestaurantCard.fromModel(model: restaurantDetailModel),
    );

_MenuList(RestaurantDetailModel restaurantDetailModel) => SliverList(
    delegate: SliverChildBuilderDelegate(
        childCount: restaurantDetailModel.products.length,
        (context, index) => Padding(
              padding: EdgeInsets.only(top: 8),
              child: MenuCard.fromModel(
                  model: restaurantDetailModel.products[index]),
            )));

_Title() => SliverToBoxAdapter(
        child: Text(
      '메뉴',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    ));
