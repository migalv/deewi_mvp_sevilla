import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvp_sevilla/routes/route_names.dart';

class ThankYouPage extends StatelessWidget {
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
                child: IconButton(
                  icon: Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => _goHome(context),
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
                    InkWell(
                      onTap: () => _goHome(context),
                      child: Ink(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            "assets/images/logo_name_under_cut.png",
                            height: 160.0,
                            width: 160.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Gracias por tu pedido",
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Te hemos enviado un correo de confirmación a tu email.",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 20.0, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 20.0, color: Colors.black87),
                        children: [
                          TextSpan(
                              text:
                                  "Cualquier cosa o duda escribenos un correo a: "),
                          TextSpan(
                            text: "info@deewi.net",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: " o llamanos al ",
                          ),
                          TextSpan(
                            text: "+34 618 22 87 31.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
  void _goHome(BuildContext context) => Navigator.pushReplacementNamed(
        context,
        RouteNames.HOME_ROUTE,
      );
}
