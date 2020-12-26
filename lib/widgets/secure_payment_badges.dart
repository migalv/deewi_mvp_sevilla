import 'dart:ui';

import 'package:flutter/material.dart';

class SecurePaymentBadges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
          padding: const EdgeInsets.all(8.0),
          constraints: BoxConstraints(
            maxHeight: 64.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 2.0,
              color: Colors.black54,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network('assets/assets/icons/visa.svg'),
              SizedBox(width: 16.0),
              Image.network('assets/assets/icons/mastercard.svg'),
              SizedBox(width: 16.0),
              Image.network('assets/assets/icons/paypal.svg'),
            ],
          ),
        ),
        Positioned(
          left: 24.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                Text(
                  "Pago seguro",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 17.0),
                ),
                SizedBox(width: 8.0),
                Icon(
                  Icons.lock,
                  size: 24.0,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
