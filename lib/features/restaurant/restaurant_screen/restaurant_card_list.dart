import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/apis/models/restaurant/restaurant_model/restaurant.dart';
import 'package:restaurant_app/features/restaurant/restaurant_card.dart';

class RestaurantCardList extends StatelessWidget {
  final List<RestaurantModel> restaurantCardList;

  const RestaurantCardList({required this.restaurantCardList, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: restaurantCardList.length,
      itemBuilder: (_, index) {
        final item = restaurantCardList[index];

        return GestureDetector(
          onTap: () => context.push('/home/${item.id}', extra: item.name),
          child: RestaurantCard.fromModel(
            model: item,
          ),
        );
      },
      separatorBuilder: (_, index) => SizedBox(height: 4),
    );
  }
}
