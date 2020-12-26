import 'package:fake_app_v1/core/utils.dart';
import 'package:fake_app_v1/js/fb_pixel.dart';
import 'package:fake_app_v1/main.dart';
import 'package:fake_app_v1/models/dish_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class Cart {
  Map<Dish, int> _dishes;
  Map<Dish, int> get dishes => _dishes;
  bool _isCartVisible;
  bool get isCartVisible => _isCartVisible;

  Cart({Map<Dish, int> dishes, isCartVisible = false})
      : _dishes = dishes ?? {},
        _isCartVisible = isCartVisible;

  void addDishToCart(Dish dish) {
    if (_dishes.containsKey(dish))
      _dishes[dish] += 1;
    else
      _dishes[dish] = 1;

    FirebaseAnalytics().logAddToCart(
      quantity: 1,
      itemId: dish.id,
      itemName: dish.name,
      itemCategory: dish.cuisineName,
      price: dish.price,
      value: totalPrice,
      currency: "EUR",
    );

    if (noEvents == false) {
      logFBPixelEvents(
        "track",
        "AddToCart",
        FBParams(
            //   content_name: dish.name,
            //   content_type: "product",
            //   currency: "EUR",
            //   value: dish.price,
            ),
      );
    }
  }

  void removeDishFromCart(Dish dish) {
    if (_dishes.containsKey(dish)) {
      _dishes[dish] -= 1;
      if (_dishes[dish] <= 0) _dishes.remove(dish);
    }
    FirebaseAnalytics().logRemoveFromCart(
      quantity: 1,
      itemId: dish.id,
      itemName: dish.name,
      itemCategory: dish.cuisineName,
      price: dish.price,
      value: totalPrice,
      currency: "EUR",
    );
  }

  void toggleCartVisibility() {
    FirebaseAnalytics().logViewItemList(itemCategory: "Cart");
    _isCartVisible = !_isCartVisible;
  }

  void clear() {
    _dishes.clear();
  }

  double get totalPrice {
    double total = 0;

    _dishes.forEach((dish, units) => total += dish.price * units);

    return total;
  }

  String get totalPriceString => Utils.toPriceString(totalPrice);
}
