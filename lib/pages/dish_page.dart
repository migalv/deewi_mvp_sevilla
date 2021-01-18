import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvp_sevilla/models/dish_model.dart';
import 'package:mvp_sevilla/pages/cart_page.dart';
import 'package:mvp_sevilla/services/remote_config_service.dart';
import 'package:mvp_sevilla/stores/cart.dart';
import 'package:mvp_sevilla/widgets/discount_countdown_bar.dart';
import 'package:mvp_sevilla/widgets/more_info_buton.dart';
import 'package:mvp_sevilla/widgets/review_carousel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:mvp_sevilla/widgets/unknown_error_widget.dart';
import 'package:oktoast/oktoast.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DishPage extends StatefulWidget {
  final String dishId;

  const DishPage({
    Key key,
    @required this.dishId,
  }) : super(key: key);

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  bool _showReviews;

  bool _isLoading;
  bool _hasError;

  Dish _dish;

  @override
  void initState() {
    _showReviews = RemoteConfigService.instance.showReviews;

    _isLoading = true;
    _hasError = false;

    try {
      FirebaseFirestore.instance
          .collection("dishes")
          .doc(widget.dishId)
          .get()
          .then((doc) {
        if (doc.exists) {
          setState(() {
            _dish = Dish.fromFirestore(doc);
            _isLoading = false;
          });
          FirebaseAnalytics().logViewItem(
            itemId: _dish.id,
            itemName: _dish.name,
            itemCategory: _dish.cuisineName,
            currency: "EUR",
            value: _dish.price,
            price: _dish.price,
          );
        } else {
          setState(() => _hasError = true);
          print("This dish does not exits (id: ${widget.dishId})");
        }
      });
    } catch (e) {
      print(e);
      setState(() => _hasError = true);
    }

    FirebaseAnalytics().setCurrentScreen(
      screenName: "Dish Page",
      screenClassOverride: "DishPage",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _descriptionWidth = 512.0;

    bool isPhone = false;

    // PHONE
    if (_screenWidth <= 768.0) {
      isPhone = true;
      _descriptionWidth = _screenWidth - 64.0;
    }

    return Container(
      constraints: BoxConstraints(maxWidth: 768.0),
      child: Scaffold(
        body: Column(
          children: [
            isPhone ? DiscountCountdownBar() : Container(),
            Expanded(
              child: Stack(
                children: [
                  OKToast(
                    child: CustomScrollView(
                      slivers: [
                        _buildAppBar(isPhone: isPhone),
                        _buildList(descriptionWidth: _descriptionWidth),
                      ],
                    ),
                  ),
                  isPhone ? CartPage() : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar({@required bool isPhone}) => SliverAppBar(
        expandedHeight: 304.0,
        pinned: true,
        actions: [isPhone ? _buildCartButton() : Container()],
        flexibleSpace: FlexibleSpaceBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FittedBox(
              child: Text(_isLoading ? "..." : "${_dish.name}"),
            ),
          ),
          centerTitle: true,
          background: Stack(
            fit: StackFit.expand,
            children: [
              _isLoading
                  ? Container(color: Colors.black)
                  : Image.asset(
                      _dish.thumbnailImagePath ?? _dish.mainImagePath,
                      fit: BoxFit.cover,
                    ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 0.5),
                    end: Alignment(0.0, 0.0),
                    colors: <Color>[
                      Color(0x60000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0x60000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildList({@required double descriptionWidth}) => SliverList(
        delegate: SliverChildListDelegate(
          _hasError
              ? [UnknownErrorWidget()]
              : [
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MoreInfoButton(),
                    ),
                  ),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: descriptionWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildPrice(context),
                          _buildAddToCartButton(context, small: true),
                        ],
                      ),
                    ),
                  ),
                  // Description
                  _buildParagraph(
                    context: context,
                    descriptionWidth: descriptionWidth,
                    title: "Descripción del plato",
                    text: _isLoading ? "..." : _dish.description,
                  ),
                  // History
                  _dish?.history != null
                      ? _buildParagraph(
                          context: context,
                          descriptionWidth: descriptionWidth,
                          title: "Un poco de historia",
                          text: _isLoading ? "..." : _dish.history,
                        )
                      : Container(),
                  // How to eat
                  _dish?.howToEat != null
                      ? _buildParagraph(
                          context: context,
                          descriptionWidth: descriptionWidth,
                          title: "Como comer",
                          text: _isLoading ? "..." : _dish.howToEat,
                        )
                      : Container(),
                  SizedBox(height: 16.0),
                  _buildDishIngredients(context, descriptionWidth),
                  SizedBox(height: 16.0),
                  Center(child: _buildAddToCartButton(context)),
                  if (_showReviews)
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : _dish.reviews.isNotEmpty
                            ? Center(
                                child: ReviewCarousel(
                                  reviews: _dish.reviews,
                                ),
                              )
                            : Container()
                  else
                    Container(),
                  SizedBox(height: 16.0),
                ],
        ),
      );

  Widget _buildParagraph({
    @required BuildContext context,
    @required double descriptionWidth,
    @required String title,
    @required String text,
  }) =>
      Center(
        child: Container(
          width: descriptionWidth,
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: ExpansionTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  text,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildDishIngredients(BuildContext context, double descriptionWidth) {
    if (_isLoading == false && _dish.ingredients.isNotEmpty) {
      List<Widget> children = [];

      children.addAll(
        _dish.ingredients.map(
          (ingredient) => ingredient.allergens != null
              ? ListTile(
                  title: Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    "Alérgenos: ${ingredient.allergens.join(", ")}",
                    style: TextStyle(color: Colors.red[900]),
                  ),
                )
              : ListTile(
                  title: Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
        ),
      );

      return Center(
        child: Container(
          width: descriptionWidth,
          child: ExpansionTile(
            title: Text(
              "Ingredientes",
              style: Theme.of(context).textTheme.headline5,
            ),
            children: children,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  // ignore: unused_element
  Widget _buildDishAllergens(BuildContext context, double descriptionWidth) {
    if (_isLoading == false && _dish.allergens.isNotEmpty) {
      List<Widget> children = [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Alergenos",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(height: 16.0),
      ];

      children.addAll(
        _dish.allergens.map(
          (allergen) => ListTile(
            title: Text(
              allergen,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      );

      return Center(
        child: Container(
          width: descriptionWidth,
          child: Column(
            children: children,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildPrice(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _isLoading ? "..." : "${_dish.priceAsString}€",
            style: Theme.of(context).textTheme.headline4,
          ),
          _isLoading == false && _dish.isSoldInUnits
              ? SizedBox(width: 8.0)
              : Container(),
          _isLoading == false && _dish.isSoldInUnits
              ? Text(
                  "Por unidad",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 16.0),
                )
              : Container(),
        ],
      );

  Widget _buildAddToCartButton(BuildContext context, {bool small = false}) =>
      StateBuilder<Cart>(
        observe: () => Injector.getAsReactive<Cart>(),
        builder: (context, rmCart) {
          return Column(
            children: [
              small ? Container() : _buildUnitSelector(rmCart),
              Padding(
                padding: small
                    ? const EdgeInsets.all(0.0)
                    : const EdgeInsets.all(16.0),
                child: Material(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            rmCart
                                .setState((cart) => cart.addDishToCart(_dish));

                            showToast(
                              "Plato añadido al carrito",
                              position: ToastPosition.bottom,
                              backgroundColor: Colors.black54,
                              radius: 8.0,
                              textPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              textStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              animationBuilder: Miui10AnimBuilder(),
                            );

                            // Fluttertoast.showToast(
                            //   msg: "Plato añadido al carrito",
                            //   webPosition: "center",
                            //   toastLength: Toast.LENGTH_LONG,
                            //   gravity: ToastGravity.BOTTOM,
                            //   timeInSecForIosWeb: 2,
                            //   textColor: Colors.white,
                            //   fontSize: 22.0,
                            // );
                          },
                          child: Ink(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: small ? 16.0 : 40.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                  size: small ? 22.0 : 24.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  small ? "Añadir" : "Añadir al carrito",
                                  overflow: TextOverflow.clip,
                                  style: small
                                      ? Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.white)
                                      : Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      );

  Widget _buildCartButton() => StateBuilder<Cart>(
        observe: () => Injector.getAsReactive<Cart>(),
        builder: (_, rmCart) => Stack(
          children: [
            Center(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () =>
                    rmCart.setState((cart) => cart.toggleCartVisibility()),
              ),
            ),
            _buildItemCount(rmCart.state.dishes.length),
          ],
        ),
      );

  Widget _buildItemCount(int cartItems) => cartItems >= 1
      ? Positioned(
          top: 8.0,
          right: 2.0,
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: CircleBorder(),
            child: Container(
              width: 16.0,
              child: Text(
                "$cartItems",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      : Container();

  Widget _buildUnitSelector(ReactiveModel<Cart> rmCart) {
    double iconSize = 22.0;
    const double iconPadding = 8.0;
    int units = rmCart.state.dishes[_dish] ?? 0;

    return units > 0
        ? Column(
            children: [
              SizedBox(height: 8.0),
              Text(
                "Quieres más de uno? Añadelo directamente a la cesta",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 3,
                    shape: CircleBorder(),
                    child: InkWell(
                      onTap: () =>
                          rmCart.setState((cart) => cart.addDishToCart(_dish)),
                      child: Padding(
                        padding: const EdgeInsets.all(iconPadding),
                        child: Ink(
                          child: Icon(
                            Icons.add,
                            size: iconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("$units"),
                  ),
                  Material(
                    elevation: 3,
                    shape: CircleBorder(),
                    child: InkWell(
                      onTap: () => rmCart
                          .setState((cart) => cart.removeDishFromCart(_dish)),
                      child: Padding(
                        padding: const EdgeInsets.all(iconPadding),
                        child: Ink(
                          child: Icon(
                            Icons.remove,
                            size: iconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : Container();
  }
}
