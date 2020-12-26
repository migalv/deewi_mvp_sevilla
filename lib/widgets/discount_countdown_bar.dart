import 'package:fake_app_v1/core/utils.dart';
import 'package:fake_app_v1/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DiscountCountdownBar extends StatelessWidget {
  final double textSize = 17.0;

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      observe: () => Injector.getAsReactive<Cart>(),
      builder: (_, rmCart) {
        Cart cart = rmCart.state;
        double discountDifference = 16.0 - cart.totalPrice;
        String discountDifString = Utils.toPriceString(discountDifference);
        bool discountAchieved = discountDifference <= 0.0;

        return Container(
          width: double.infinity,
          color: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: discountAchieved
              ? Text(
                  "¡Enhorabuena! Ya has llegado al minimo para conseguir tu descuento de 10€",
                  style: TextStyle(fontSize: textSize),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              : Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        "Te faltan $discountDifString€ para tus 10€ de descuento ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: textSize),
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      "¡Añade algo más!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
