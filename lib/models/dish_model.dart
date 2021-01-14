import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvp_sevilla/models/dish_review.dart';
import 'package:mvp_sevilla/models/ingredient.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class Dish {
  String id;

  /// Dish name
  final String name;

  /// How the dish is made
  final String description;

  /// A little bit of history around the dish
  final String history;

  // A brief explanation on how to eat the dish
  final String howToEat;

  /// The ingredients of the dish
  final List<Ingredient> ingredients;

  /// If the dish is sold in units
  final bool isSoldInUnits;

  /// The price of the dish
  final double price;
  String get priceAsString => price.toStringAsFixed(2).replaceAll(".", ",");

  /// The path to the default image of the dish
  final String mainImagePath;

  /// The path to the thumbnail (small sized) image of the dish
  final String thumbnailImagePath;

  /// The path to an image of the dish from a side view perspective
  final String sideViewImage;

  final String stripePriceId;

  List<DishReview> _reviews;

  List<DishReview> get reviews => _reviews;

  String cuisineName;

  String cuisineId;

  Set<String> _allergens;

  Set<String> get allergens => _allergens;

  Dish({
    this.id,
    @required this.name,
    @required this.price,
    @required this.mainImagePath,
    this.description,
    this.ingredients,
    this.cuisineName,
    this.cuisineId,
    this.isSoldInUnits = false,
    this.sideViewImage,
    this.thumbnailImagePath,
    this.history,
    this.howToEat,
    this.stripePriceId,
    List<DishReview> reviews = const [],
  }) {
    _allergens = {};
    _reviews = reviews;
    if (ingredients != null) {
      for (var ingredient in ingredients) {
        if (ingredient.allergens != null)
          _allergens.addAll(ingredient.allergens);
      }
    }
  }

  Map<String, dynamic> toOrderItem() => {
        "name": name,
        "price": price,
        "cuisine_name": cuisineName,
        "stripe_price_id": stripePriceId,
      };

  @override
  bool operator ==(Object other) {
    return other is Dish ? other.name == this.name : false;
  }

  @override
  int get hashCode => name.hashCode;

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
  Map<String, dynamic> toJson() => _$DishToJson(this);

  Map<String, dynamic> toReducedJson() => {
        "id": id,
        "name": name,
        "price": price,
        "main_image_path": mainImagePath,
        "thumbnail_image_path": thumbnailImagePath,
      };

  factory Dish.fromFirestore(DocumentSnapshot doc) {
    Dish dish = Dish.fromJson(doc.data());
    dish.id = doc.id;

    return dish;
  }
}
