import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvp_sevilla/routes/route_names.dart';

class MoreInfoButton extends StatelessWidget {
  final double maxWidth;

  const MoreInfoButton({Key key, this.maxWidth = 136.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.black.withOpacity(0.04),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, RouteNames.FAQS_ROUTE),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Ink(
              child: Row(
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(width: 4.0),
                  Text(
                    "Saber más",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
