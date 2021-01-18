import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class FakeThankYouDialog extends StatelessWidget {
  final ReactiveModel rmCart;

  const FakeThankYouDialog({Key key, @required this.rmCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "¡Gracias por pedir en Deewi!",
        textAlign: TextAlign.center,
      ),
      content: Container(
        constraints: BoxConstraints(maxWidth: 300.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 4.0),
            Text(
              "Actualmente aún estamos en construcción 🏗️",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.0),
            Text(
              "Y nos ayudaría un montón conocer tu opinión.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.0),
            Text(
              "Puede ser que te contactemos para charlar unos minutos 😊",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              "Como ya nos conocemos, te dejamos este código:",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            FittedBox(
              child: Text(
                "SOYDELOSPRIMEROS",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Utilizalo en tu siguiente pedido y tendremos un regalo para tí.",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            rmCart.setState((cart) => cart.clear());
          },
          child: Text("Cerrar"),
        ),
      ],
    );
  }
}
