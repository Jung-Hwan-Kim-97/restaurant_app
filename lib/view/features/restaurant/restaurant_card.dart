import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant/restaurant_detail_model/restaurant_detail.dart';
import 'package:restaurant_app/model/restaurant/restaurant_model/restaurant.dart';
import 'package:restaurant_app/utils/constant/colors.dart';
import 'package:restaurant_app/utils/constant/ip.dart';

class RestaurantCard extends StatelessWidget {
  //이미지
  final Widget image;
  //이름
  final String name;
  //태그
  final List<String> tags;
  //평점
  final int ratingsCount;
  //배송 시간
  final int deliveryTime;
  // 배송 비용
  final int deliveryFee;
  //평균 평점
  final double ratings;

  final bool hasDetail;
  final String? detail;

  const RestaurantCard(
      {
      //이미지
      required this.image,
      //이름
      required this.name,
      //태그
      required this.tags,
      //평점
      required this.ratingsCount,
      //배송 시간
      required this.deliveryTime,
      // 배송 비용
      required this.deliveryFee,
      //평균 평점
      required this.ratings,
      this.hasDetail = false,
      required this.detail,
      super.key});

  factory RestaurantCard.fromModel(
      {required RestaurantModel model, hasDetail = false}) {
    return RestaurantCard(
        image: Image.network(
          '$baseUrl/${model.thumbUrl}',
        ),
        name: model.name,
        tags: model.tags,
        ratingsCount: model.ratingsCount,
        deliveryTime: model.deliveryTime,
        deliveryFee: model.deliveryFee,
        ratings: model.ratings,
        hasDetail: hasDetail,
        detail: model is RestaurantDetailModel ? model.detail : null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Image(image),
        SizedBox(height: 16),
        _FoodName(name),
        SizedBox(height: 4),
        _Tags(tags),
        SizedBox(height: 4),
        _DeliveryData(ratingsCount, deliveryTime, deliveryFee, ratings),
        SizedBox(
          height: 4,
        ),
        detail != null ? Text('$detail') : const SizedBox()
      ],
    );
  }
}

_Image(Widget image) {
  return ClipRRect(
    child: image,
    borderRadius: BorderRadius.circular(12),
  );
}

_FoodName(String name) {
  return Text(
    name,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
  );
}

_Tags(List<String> tags) {
  TextStyle tagStyle = TextStyle(color: BODY_TEXT_COLOR, fontSize: 14);

  return Row(
    children: tags.asMap().entries.map((tag) {
      int index = tag.key;
      int lastIndex = tags.length - 1;

      return index == lastIndex
          ? Text(
              '#${tag.value}',
              style: tagStyle,
            )
          : Text(
              '#${tag.value} · ',
              style: tagStyle,
            );
    }).toList(),
  );
}

_DeliveryData(
    int ratingCount, int deliveryTime, int deliveryFee, double rating) {
  // icons star, receipt, timelapse_outlined,monetization_on
  List<Map<String, dynamic>> deliveryDataList = [
    {'icon': Icons.star, 'label': '$rating'},
    {'icon': Icons.receipt, 'label': '$ratingCount'},
    {'icon': Icons.timelapse_outlined, 'label': '$deliveryTime분'},
    {
      'icon': Icons.monetization_on,
      'label': deliveryFee == 0 ? '무료' : '$deliveryFee원'
    },
  ];

  return Row(
    children: deliveryDataList
        .map<Widget>((deliveryData) => _IconText(
              deliveryData['icon'],
              deliveryData['label'],
            ))
        .toList(),
  );
}

_IconText(IconData icon, String label) {
  return Row(
    children: [
      Icon(
        icon,
        color: PRIMARY_COLOR,
        size: 14,
      ),
      Text(label),
      SizedBox(
        width: 4,
      )
    ],
  );
}
