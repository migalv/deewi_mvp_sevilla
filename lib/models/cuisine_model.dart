import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_app_v1/models/dish_model.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cuisine_model.g.dart';

@JsonSerializable()
class Cuisine {
  @JsonKey(ignore: true)
  String id;
  final String name;
  List<Dish> dishes;
  final String imagePath;
  final String thumbnailImagePath;

  Cuisine({
    this.id,
    @required this.name,
    @required this.dishes,
    @required this.imagePath,
    this.thumbnailImagePath,
  }) {
    for (Dish dish in dishes) {
      dish.cuisineName = name;
    }
  }

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);

  Map<String, dynamic> toJson() => _$CuisineToJson(this);

  factory Cuisine.fromFirestore(DocumentSnapshot doc) {
    Cuisine cuisine = Cuisine.fromJson(doc.data());
    cuisine.id = doc.id;

    for (Dish dish in cuisine.dishes) dish.cuisineName = cuisine.name;

    return cuisine;
  }
}
