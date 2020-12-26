import 'dart:ui';

import 'package:fake_app_v1/pages/faqs_page.dart';
import 'package:flutter/material.dart';

class MoreInfoButton extends StatelessWidget {
  final double maxWidth;

  const MoreInfoButton({Key key, this.maxWidth = 120.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.black.withOpacity(0.04),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FAQsPage(),
              settings: RouteSettings(name: "FAQs Page"),
            ),
          ),
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
