import 'package:fake_app_v1/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CartFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    bool _isPhone = false;
    bool _isTablet = false;
    if (_screenWidth < 1024.0) _isTablet = true;
    if (_screenWidth < 768.0) _isPhone = true;

    return _isPhone || _isTablet
        ? StateBuilder<Cart>(
            observe: () => Injector.getAsReactive<Cart>(),
            builder: (_, rmCart) {
              int cartItems = rmCart.state.dishes.length;
              return FloatingActionButton(
                backgroundColor: Colors.amber,
                onPressed: () =>
                    rmCart.setState((cart) => cart.toggleCartVisibility()),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.shopping_cart,
                        size: 32.0,
                        color: Colors.white,
                      ),
                    ),
                    cartItems >= 1
                        ? Positioned(
                            top: 4.0,
                            right: 8.0,
                            child: Material(
                              color: Colors.white,
                              elevation: 2,
                              shape: CircleBorder(),
                              child: Container(
                                width: 16.0,
                                child: Text(
                                  "$cartItems",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          )
        : Container();
  }
}
