// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishReview _$DishReviewFromJson(Map<String, dynamic> json) {
  return DishReview(
    rating: (json['rating'] as num)?.toDouble(),
    headline: json['headline'] as String,
    createdBy: json['createdBy'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$DishReviewToJson(DishReview instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'headline': instance.headline,
      'createdBy': instance.createdBy,
      'description': instance.description,
    };
