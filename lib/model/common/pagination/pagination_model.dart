import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationModel<T> {
  final PaginationMeta meta;
  final List<T> data;

  PaginationModel({required this.meta, required this.data});

  factory PaginationModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationModelFromJson(json, fromJsonT);
}

@JsonSerializable()
class PaginationMeta {
  final int count;
  final bool hasMore;

  PaginationMeta({required this.count, required this.hasMore});

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
