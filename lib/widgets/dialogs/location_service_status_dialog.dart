import 'package:flutter/material.dart';
import 'package:mvp_sevilla/services/location_service.dart';

class LocationServiceStatusDialog extends StatelessWidget {
  final LocationPermissionsStatus status;

  const LocationServiceStatusDialog({Key key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Activa la localización"),
      content: Container(
        constraints: BoxConstraints(maxWidth: 300.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Para poder ofrecerte una mejor experiencia activa la localización."),
            Text(
                "La localización nos permite mostrarte los mejores platos según tu zona."),
          ],
        ),
      ),
      actions: [
        RaisedButton(
          child: Text("Activar"),
          onPressed: () {
            if (status == LocationPermissionsStatus.SERVICE_DISABLED) {}
          },
        ),
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
