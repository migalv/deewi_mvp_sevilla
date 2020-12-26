import 'package:fake_app_v1/models/cuisine_model.dart';
import 'package:fake_app_v1/pages/cart_page.dart';
import 'package:fake_app_v1/services/firestore_repository.dart';
import 'package:fake_app_v1/widgets/cart_button.dart';
import 'package:fake_app_v1/widgets/cart_fab.dart';
import 'package:fake_app_v1/widgets/cuisine_card.dart';
import 'package:fake_app_v1/widgets/discount_countdown_bar.dart';
import 'package:fake_app_v1/widgets/more_info_buton.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // Screen types
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoadingData;
  List<Cuisine> _cuisines;

  bool _isWeb;

  double _screenWidth;
  double _screenHeight;

  double _horizontalPadding;
  double _verticalPadding;
  double _lateralMargin;

  TextStyle _titleTextStyle;

  CrossAxisAlignment _crossAxisAlignment;

  int _cardsPerRow;

  double _bannerHeight;

  @override
  void initState() {
    _isLoadingData = true;
    FirestoreRepository().downloadData().then(
      (cuisines) {
        setState(() {
          _isLoadingData = false;
          _cuisines = cuisines;
        });
      },
    );
    FirebaseAnalytics().setCurrentScreen(
      screenName: "Home Page",
      screenClassOverride: "HomePage",
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Container(
            constraints: BoxConstraints(maxWidth: 128.0),
            child: Center(
              child: Text(
                "¡10€ de descuento en tu primer pedido!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          content: Container(
            constraints: BoxConstraints(maxWidth: 128.0),
            child: Text(
              "Haz un pedido de más de 15€ y te descontamos 10€ en tu primer pedido",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Aceptar"),
            ),
          ],
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    // Number of cuisines cards per row in the Grid View
    _cardsPerRow = 3;

    _isWeb = true;

    _bannerHeight = _screenHeight * 0.4;

    // Paddings
    _horizontalPadding = 32.0;
    _verticalPadding = 24.0;

    // TextStyles
    _titleTextStyle = Theme.of(context).textTheme.headline4;

    // Alignments
    _crossAxisAlignment = CrossAxisAlignment.start;
    _lateralMargin = 64.0;

    // Tablet
    if (_screenWidth <= 1024 && _screenWidth > 768) {
      _isWeb = false;
      _cardsPerRow = 2;
    } // Phone
    else if (_screenWidth <= 768) {
      _isWeb = false;
      _cardsPerRow = 2;
      _crossAxisAlignment = CrossAxisAlignment.center;
      _titleTextStyle =
          Theme.of(context).textTheme.headline4.copyWith(fontSize: 24.0);
      _horizontalPadding = 24.0;
      _lateralMargin = 32.0;

      if (_screenWidth < 650 && _screenWidth >= 450) {
        _cardsPerRow = 1;
      } else if (_screenWidth < 450) {
        _cardsPerRow = 1;
        _horizontalPadding = 16.0;
        _lateralMargin = 0.0;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: _screenWidth,
              height: _screenHeight,
              color: Colors.black,
            ),
            Opacity(
              opacity: 0.8,
              child: Image.asset(
                "assets/images/home_banner.jpg",
                width: _screenWidth,
                height: _screenHeight,
                alignment: Alignment(0.0, -0.45),
                fit: BoxFit.cover,
              ),
            ),
            _buildLogo(),
            ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                SizedBox(height: _bannerHeight),
                _buildCuisineList(),
              ],
            ),
            DiscountCountdownBar(),
            CartPage(),
            CartButton(),
          ],
        ),
      ),
      floatingActionButton: CartFAB(),
    );
  }

  Widget _buildLogo() => Align(
        alignment: !_isWeb ? Alignment.topCenter : Alignment.topLeft,
        child: Padding(
          padding: !_isWeb
              ? EdgeInsets.fromLTRB(64.0, 80.0, 64.0, 0.0)
              : EdgeInsets.only(top: 64.0, left: 64.0),
          child: Image.asset(
            "assets/images/logo.png",
            scale: 2,
          ),
        ),
      );

  Widget _buildCuisineList() => Container(
        margin: EdgeInsets.symmetric(horizontal: _lateralMargin),
        constraints: BoxConstraints(
          minHeight: _screenHeight - _bannerHeight,
          maxHeight: _isLoadingData
              ? (_screenHeight - _bannerHeight)
              : double.infinity,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32.0),
            topLeft: Radius.circular(32.0),
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: _verticalPadding,
            horizontal: _horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: _crossAxisAlignment,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "¿Con qué comidas te atreves hoy?",
                  style: _titleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MoreInfoButton(),
              ),
              _isLoadingData
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : GridView.builder(
                      // crossAxisCount: _cardsPerRow,
                      // childAspectRatio: 4 / 3,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _cardsPerRow,
                        childAspectRatio: 4 / 3,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _cuisines.length,
                      itemBuilder: (_, i) => CuisineCard(cuisine: _cuisines[i]),
                      // children: _cuisines
                      //     .map((cuisine) => CuisineCard(cuisine: cuisine))
                      //     .toList(),
                    ),
            ],
          ),
        ),
      );
}
