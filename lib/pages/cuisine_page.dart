import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvp_sevilla/models/cuisine_model.dart';
import 'package:mvp_sevilla/pages/cart_page.dart';
import 'package:mvp_sevilla/routes/route_names.dart';
import 'package:mvp_sevilla/widgets/cart_button.dart';
import 'package:mvp_sevilla/widgets/cart_fab.dart';
import 'package:mvp_sevilla/widgets/discount_countdown_bar.dart';
import 'package:mvp_sevilla/widgets/dish_card.dart';
import 'package:mvp_sevilla/widgets/more_info_buton.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:mvp_sevilla/widgets/unknown_error_widget.dart';

class CuisinePage extends StatefulWidget {
  /// Firestore id for the Cuisine
  final String cuisineId;

  const CuisinePage({Key key, this.cuisineId}) : super(key: key);

  @override
  _CuisinePageState createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  double _screenWidth;
  double _screenHeight;

  bool _isPhone;

  double _bannerHeight;

  double _lateralMargin;

  int _itemCount;

  TextStyle _titleTextStyle;

  /// If the view is loading / waiting for the Firestore data
  bool _isLoading;

  /// The cuisine model for this Cuisine Page
  Cuisine _cuisine;

  /// If an error ocurred
  bool _hasError;

  @override
  void initState() {
    _isLoading = true;
    _hasError = false;

    try {
      FirebaseFirestore.instance
          .collection("cuisines")
          .doc(widget.cuisineId)
          .get()
          .then((doc) {
        if (doc.exists) {
          setState(() {
            _cuisine = Cuisine.fromFirestore(doc);
            _isLoading = false;
          });
          FirebaseAnalytics().logViewItemList(itemCategory: _cuisine.name);
        } else {
          setState(() {
            _hasError = true;
            _isLoading = false;
          });
        }
      });
    } catch (e) {
      setState(() => _hasError = true);
    }

    FirebaseAnalytics().setCurrentScreen(
      screenName: "Cuisine Page",
      screenClassOverride: "CuisinePage",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _bannerHeight = _screenHeight * 0.3;
    _itemCount = 3;
    _isPhone = false;
    _titleTextStyle = Theme.of(context).textTheme.headline1.copyWith(
          color: Colors.white.withOpacity(0.8),
        );

    // WEB
    if (_screenWidth >= 1024) {
      _lateralMargin = 128.0;
    }
    // TABLET
    else if (_screenWidth < 1024.0 && _screenWidth >= 768.0) {
      _lateralMargin = 104.0;
      _itemCount = 2;
    }
    // PHONE
    else if (_screenWidth < 768.0) {
      _isPhone = true;
      _lateralMargin = 0.0;
      _itemCount = 2;
    }

    // Item count
    if (_screenWidth <= 450) _itemCount = 1;

    return Scaffold(
      body: _hasError
          ? UnknownErrorWidget()
          : Stack(
              children: [
                Container(
                  width: _screenWidth,
                  height: _screenHeight,
                  color: Colors.black,
                ),
                _isLoading
                    ? Container()
                    : Opacity(
                        opacity: 0.4,
                        child: Image.asset(
                          _cuisine.thumbnailImagePath ?? _cuisine.imagePath,
                          width: _screenWidth,
                          height: _screenHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                _buildLogo(),
                _buildTitle(),
                ListView(
                  children: [
                    SizedBox(height: _bannerHeight),
                    _buildDishList(),
                  ],
                ),
                DiscountCountdownBar(),
                CartPage(),
                CartButton(),
              ],
            ),
      floatingActionButton: CartFAB(),
    );
  }

  Widget _buildLogo() => Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: _isPhone ? 56.0 : 24.0,
            left: _isPhone ? 0.0 : 24.0,
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, RouteNames.HOME_ROUTE),
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 6.0,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildTitle() => Container(
        height: _bannerHeight,
        width: _screenWidth,
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: _isPhone ? _lateralMargin + 16.0 : 0.0,
        ),
        child: _isPhone
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 256.0,
                    maxHeight: 80.0,
                  ),
                  child: FittedBox(
                    child: Text(
                      _isLoading ? "..." : "${_cuisine.name}",
                      style: _titleTextStyle,
                    ),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                    left: 182.0,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      _isLoading ? "..." : "${_cuisine.name}",
                      style: _titleTextStyle,
                    ),
                  ),
                ),
              ),
      );

  Widget _buildDishList() => Container(
        constraints: BoxConstraints(
          maxWidth: 1024.0,
          minHeight: _screenHeight - _bannerHeight,
        ),
        margin: EdgeInsets.only(
          left: _lateralMargin,
          right: _lateralMargin,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black45,
              spreadRadius: 3,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: MoreInfoButton(),
                ),
              ],
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _itemCount,
                      childAspectRatio: 1,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _cuisine.dishes.length,
                    padding: const EdgeInsets.all(16.0),
                    // crossAxisCount: _itemCount,
                    // childAspectRatio: 1,
                    itemBuilder: (_, i) => DishCard(dish: _cuisine.dishes[i]),
                  ),
            SizedBox(height: 48.0),
          ],
        ),
      );
}
