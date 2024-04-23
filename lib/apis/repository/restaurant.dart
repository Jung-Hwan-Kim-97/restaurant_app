import 'package:dio/dio.dart';
import 'package:restaurant_app/apis/models/common/pagination/pagination_model.dart';
import 'package:restaurant_app/apis/models/restaurant/restaurant_detail_model/restaurant_detail.dart';
import 'package:restaurant_app/apis/models/restaurant/restaurant_model/restaurant.dart';
import 'package:restaurant_app/utils/constant/ip.dart';
import 'package:restaurant_app/utils/constant/tokens.dart';

class RestaurantRepository {
  final _dio = Dio();

  Future<List<RestaurantModel>> getRestaurantMenuList() async {
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await _dio.get('$baseUrl/restaurant',
        options: Options(headers: {'authorization': 'Bearer $accessToken'}));

    final value = PaginationModel<RestaurantModel>.fromJson(response.data,
        (json) => RestaurantModel.fromJson(json as Map<String, dynamic>));

    return value.data;
  }

  Future<RestaurantDetailModel> getRestaurantMenu(String id) async {
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await _dio.get('$baseUrl/restaurant/$id',
        options: Options(headers: {'authorization': 'Bearer $accessToken'}));

    return RestaurantDetailModel.fromJson(response.data);
  }
}
