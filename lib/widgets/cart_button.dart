import 'package:fake_app_v1/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    bool _isPhone = false;
    bool _isTablet = false;
    if (_screenWidth < 1024.0) _isTablet = true;
    if (_screenWidth < 768.0) _isPhone = true;

    return _isPhone || _isTablet
        ? Container()
        : StateBuilder<Cart>(
            observe: () => Injector.getAsReactive<Cart>(),
            builder: (_, rmCart) => Positioned(
              top: -32.0,
              right: -32.0,
              child: Material(
                color: Colors.transparent,
                shape: CircleBorder(),
                child: InkWell(
                  onTap: () =>
                      rmCart.setState((cart) => cart.toggleCartVisibility()),
                  child: Ink(
                    height: 88.0,
                    width: 88.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 16.0,
                          bottom: 16.0,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ),
                        _buildItemCount(rmCart.state.dishes.length),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildItemCount(int cartItems) => cartItems >= 1
      ? Positioned(
          left: 36.0,
          bottom: 36.0,
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
      : Container();
}
