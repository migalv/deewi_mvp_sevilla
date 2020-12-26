import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  static const double _maxRating = 5.0;
  static const double _minRating = 0.0;
  final double rating;
  final int numReviews;

  const StarRating({Key key, @required this.rating, this.numReviews})
      : assert(rating >= _minRating && rating <= _maxRating),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    int wholeNumber = rating.floor();

    children = List.generate(
      wholeNumber,
      (index) => Icon(
        Icons.star_rounded,
        color: Colors.amber,
      ),
    );

    if (rating - rating.floor() >= 0.5) {
      children.add(Icon(
        Icons.star_half_rounded,
        color: Colors.amber,
      ));
    }

    double difference = _maxRating - rating;

    if (difference > 0.5) {
      if (difference - difference.floor() == 0.5) {
        difference -= 1;
      }
      children.addAll(List.generate(
        difference.round(),
        (index) => Icon(
          Icons.star_border_rounded,
          color: Colors.amber,
        ),
      ));
    }

    if (numReviews != null && numReviews > 0) {
      children.addAll([
        SizedBox(width: 8.0),
        Text("$numReviews valoraci${numReviews == 1 ? "ón" : "ones"}"),
      ]);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
