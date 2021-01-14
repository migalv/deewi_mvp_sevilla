import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvp_sevilla/models/dish_model.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cuisine_model.g.dart';

@JsonSerializable()
class Cuisine {
  @JsonKey(ignore: true)
  String id;
  final String name;
  @JsonKey(toJson: _dishesToJson, fromJson: _dishesFromJson)
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
      dish.cuisineId = id;
    }
  }

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);

  Map<String, dynamic> toJson() => _$CuisineToJson(this);

  static List<Map<String, dynamic>> _dishesToJson(List<Dish> dishes) =>
      dishes.map((dish) => dish.toReducedJson()).toList();

  static List<Dish> _dishesFromJson(List json) =>
      json.map((jsonDish) => Dish.fromJson(jsonDish)).toList();

  factory Cuisine.fromFirestore(DocumentSnapshot doc) {
    Cuisine cuisine = Cuisine.fromJson(doc.data());
    cuisine.id = doc.id;

    for (Dish dish in cuisine.dishes) {
      dish.cuisineName = cuisine.name;
    }

    return cuisine;
  }
}
