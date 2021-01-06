import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvp_sevilla/routes/route_names.dart';

class PaymentErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF701A98),
              Color(0xFFDF4577),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton.icon(
                  label: Text(
                    "Volver",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => _goToCheckout(context),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32.0),
                constraints: BoxConstraints(maxWidth: 768.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image.network(
                      "assets/assets/icons/payment-error.svg",
                      height: 64.0,
                    ),
                    Text(
                      "Pago incorrecto",
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Ocurrió un error con el pago.",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 20.0, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Hemos cancelado el pago.",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 20.0, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Vuelve a intentarlo.",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 20.0, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // METHODS
  void _goToCheckout(BuildContext context) =>
      () => Navigator.pushReplacementNamed(
            context,
            RouteNames.CHECKOUT_ROUTE,
          );
}
