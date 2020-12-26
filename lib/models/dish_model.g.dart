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
    mainImagePath: json['main_image_path'] as String,
    ingredients: (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cuisineName: json['cuisine_name'] as String,
    isSoldInUnits: json['is_sold_in_units'] as bool,
    sideViewImage: json['side_view_image'] as String,
    thumbnailImagePath: json['thumbnail_image_path'] as String,
    history: json['history'] as String,
    howToEat: json['how_to_eat'] as String,
    reviews: (json['reviews'] as List)
        ?.map((e) =>
            e == null ? null : DishReview.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DishToJson(Dish instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('history', instance.history);
  writeNotNull('how_to_eat', instance.howToEat);
  writeNotNull(
      'ingredients', instance.ingredients?.map((e) => e?.toJson())?.toList());
  writeNotNull('is_sold_in_units', instance.isSoldInUnits);
  writeNotNull('price', instance.price);
  writeNotNull('main_image_path', instance.mainImagePath);
  writeNotNull('thumbnail_image_path', instance.thumbnailImagePath);
  writeNotNull('side_view_image', instance.sideViewImage);
  writeNotNull('reviews', instance.reviews?.map((e) => e?.toJson())?.toList());
  writeNotNull('cuisine_name', instance.cuisineName);
  return val;
}
