import 'package:fake_app_v1/models/dish_model.dart';
import 'package:fake_app_v1/pages/dish_page.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  final bool isClickable;

  const DishCard({
    Key key,
    @required this.dish,
    this.isClickable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPhone = MediaQuery.of(context).size.width <= 768.0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: isClickable
              ? isPhone
                  ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DishPage(dish: dish),
                          settings: RouteSettings(name: "Dish Page"),
                        ),
                      )
                  : () => showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(child: DishPage(dish: dish));
                        },
                      )
              : null,
          child: Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(dish.thumbnailImagePath ?? dish.mainImagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 72.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                        child: Text(
                          dish.name,
                          style: Theme.of(context).textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: Text(
                          "${dish.priceAsString}€",
                          style: Theme.of(context).textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
