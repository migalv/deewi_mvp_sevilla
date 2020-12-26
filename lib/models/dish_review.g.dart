// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishReview _$DishReviewFromJson(Map<String, dynamic> json) {
  return DishReview(
    rating: (json['rating'] as num)?.toDouble(),
    headline: json['headline'] as String,
    createdBy: json['created_by'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$DishReviewToJson(DishReview instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rating', instance.rating);
  writeNotNull('headline', instance.headline);
  writeNotNull('created_by', instance.createdBy);
  writeNotNull('description', instance.description);
  return val;
}
