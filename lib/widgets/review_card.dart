import 'dart:math';

import 'package:fake_app_v1/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String headline;
  final double rating;
  final String createdBy;
  final String description;

  const ReviewCard({
    Key key,
    @required this.headline,
    @required this.rating,
    @required this.createdBy,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int maxLines = 8;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 512.0) {
      int difference = (512.0 - screenWidth).round();
      maxLines = max(1, 8 - (difference / 35).round());
    }

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headline,
              style: Theme.of(context).textTheme.subtitle2,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                StarRating(rating: rating),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Text(
                    "Por $createdBy",
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Text(
                description,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
