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
    imagePath: json['imagePath'] as String,
    thumbnailImagePath: json['thumbnailImagePath'] as String,
  );
}

Map<String, dynamic> _$CuisineToJson(Cuisine instance) => <String, dynamic>{
      'name': instance.name,
      'dishes': instance.dishes,
      'imagePath': instance.imagePath,
      'thumbnailImagePath': instance.thumbnailImagePath,
    };
