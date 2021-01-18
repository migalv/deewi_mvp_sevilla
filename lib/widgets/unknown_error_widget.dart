import 'package:flutter/material.dart';

class UnknownErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network("assets/assets/icons/error.svg", height: 64.0),
          Text(
            "Ocurrió un error inesperado",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
