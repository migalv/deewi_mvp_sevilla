// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuisine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cuisine _$CuisineFromJson(Map<String, dynamic> json) {
  return Cuisine(
    name: json['name'] as String,
    dishes: (json['dishes'] as List)
        ?.map(
            (e) => e == null ? null : Dish.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imagePath: json['image_path'] as String,
    thumbnailImagePath: json['thumbnail_image_path'] as String,
  );
}

Map<String, dynamic> _$CuisineToJson(Cuisine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('dishes', instance.dishes?.map((e) => e?.toJson())?.toList());
  writeNotNull('image_path', instance.imagePath);
  writeNotNull('thumbnail_image_path', instance.thumbnailImagePath);
  return val;
}
