import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  final String name;
  final List<Ingredient> ingredients;
  final List<String> allergens;

  Ingredient({
    @required this.name,
    this.ingredients,
    this.allergens,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
