// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) {
  return Dish(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    price: (json['price'] as num)?.toDouble(),
    mainImagePath: json['mainImagePath'] as String,
    ingredients: (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cuisineName: json['cuisineName'] as String,
    isSoldInUnits: json['isSoldInUnits'] as bool,
    sideViewImage: json['sideViewImage'] as String,
    thumbnailImagePath: json['thumbnailImagePath'] as String,
    history: json['history'] as String,
    howToEat: json['howToEat'] as String,
    reviews: (json['reviews'] as List)
        ?.map((e) =>
            e == null ? null : DishReview.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'history': instance.history,
      'howToEat': instance.howToEat,
      'ingredients': instance.ingredients,
      'isSoldInUnits': instance.isSoldInUnits,
      'price': instance.price,
      'mainImagePath': instance.mainImagePath,
      'thumbnailImagePath': instance.thumbnailImagePath,
      'sideViewImage': instance.sideViewImage,
      'reviews': instance.reviews,
      'cuisineName': instance.cuisineName,
    };
