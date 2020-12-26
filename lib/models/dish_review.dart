import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'dish_review.g.dart';

@JsonSerializable()
class DishReview {
  final double rating;
  final String headline;
  final String createdBy;
  final String description;

  DishReview({
    @required this.rating,
    @required this.headline,
    @required this.createdBy,
    @required this.description,
  });

  factory DishReview.fromJson(Map<String, dynamic> json) =>
      _$DishReviewFromJson(json);
  Map<String, dynamic> toJson() => _$DishReviewToJson(this);
}
