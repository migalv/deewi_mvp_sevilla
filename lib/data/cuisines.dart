import 'package:fake_app_v1/data/dishes.dart';
import 'package:fake_app_v1/models/cuisine_model.dart';

final List<Cuisine> cuisines = [
  Cuisine(
    name: "Japonesa",
    dishes: japaneseDishes,
    imagePath: "assets/images/cuisine_images/japanese.jpg",
  ),
  Cuisine(
    name: "Peruana",
    dishes: peruanDishes,
    imagePath: "assets/images/cuisine_images/peru.jpg",
  ),
  Cuisine(
    name: "Ecuatoriana",
    dishes: ecuadorDishes,
    imagePath: "assets/images/cuisine_images/ecuador.jpg",
  ),
  Cuisine(
    name: "Italiana",
    dishes: italianDishes,
    imagePath: "assets/images/cuisine_images/italian.jpg",
  ),
  Cuisine(
    name: "Francesa",
    dishes: frenchDishes,
    imagePath: "assets/images/cuisine_images/france.jpg",
  ),
  Cuisine(
    name: "Española",
    dishes: spanishDishes,
    imagePath: "assets/images/cuisine_images/spanish.jpg",
  ),
];
