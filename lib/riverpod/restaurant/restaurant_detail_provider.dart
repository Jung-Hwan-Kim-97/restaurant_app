import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/apis/models/restaurant/restaurant_detail_model/restaurant_detail.dart';
import 'package:restaurant_app/apis/repository/restaurant.dart';

final restaurantDetailProvider = StateNotifierProvider.family<
    RestaurantDetailNotifier,
    AsyncValue<RestaurantDetailModel>,
    String>((ref, id) => RestaurantDetailNotifier(id));

class RestaurantDetailNotifier
    extends StateNotifier<AsyncValue<RestaurantDetailModel>> {
  RestaurantDetailNotifier(String id) : super(AsyncValue.loading()) {
    fetchRestaurantMenu(id);
  }

  fetchRestaurantMenu(String id) async {
    try {
      final restaurantMenu = await RestaurantRepository().getRestaurantMenu(id);
      state = AsyncValue.data(restaurantMenu);
    } catch (err) {
      state = AsyncValue.error(err, StackTrace.current);
    }
  }
}
