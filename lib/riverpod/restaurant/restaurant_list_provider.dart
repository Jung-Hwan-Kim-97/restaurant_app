import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/apis/models/restaurant/restaurant_model/restaurant.dart';
import 'package:restaurant_app/apis/repository/restaurant.dart';

final restaurantListProvider =
    AsyncNotifierProvider<RestaurantListNotifier, List<RestaurantModel>>(() {
  return RestaurantListNotifier();
});

class RestaurantListNotifier extends AsyncNotifier<List<RestaurantModel>> {
  @override
  Future<List<RestaurantModel>> build() async {
    return RestaurantRepository().getRestaurantMenuList();
  }
}
