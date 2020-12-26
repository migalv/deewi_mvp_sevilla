import 'package:fake_app_v1/pages/order_confirmation_page.dart';
import 'package:fake_app_v1/stores/cart.dart';
import 'package:fake_app_v1/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    double _containerWidth = 352.0;
    double _containerHeight = _screenHeight * 0.7;
    double _latteralMargin = 32.0;
    bool _isWeb = true;

    if (_screenWidth < 1024.0) _isWeb = false;
    if (_screenWidth <= 352.0 + _latteralMargin * 2) {
      _containerWidth = _screenWidth;
      _latteralMargin = 16.0;
    }

    return Align(
      alignment: _isWeb ? Alignment.topRight : Alignment.bottomRight,
      child: StateBuilder<Cart>(
        observe: () => Injector.getAsReactive<Cart>(),
        builder: (context, rmCart) {
          return rmCart.state.isCartVisible
              ? ScaleTransition(
                  scale: _animation,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: _containerWidth,
                      maxHeight: _containerHeight,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 32.0,
                      horizontal: _latteralMargin,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: 1,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildTitle(rmCart),
                        _buildItemsList(rmCart),
                        rmCart.state.dishes.isNotEmpty
                            ? _buildTotal(rmCart)
                            : Container(),
                      ],
                    ),
                  ),
                )
              : Container();
        },
      ),
    );
  }

  Widget _buildItemsList(ReactiveModel rmCart) => Expanded(
        child: rmCart.state.dishes.isNotEmpty
            ? ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: rmCart.state.dishes.entries
                    .map(
                      (entry) => ItemTile(
                        dish: entry.key,
                        units: entry.value,
                      ),
                    )
                    .cast<Widget>()
                    .toList(),
              )
            : _buildPlaceHolder(),
      );

  Widget _buildTitle(ReactiveModel rmCart) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () =>
                  rmCart.setState((cart) => cart.toggleCartVisibility()),
              iconSize: 32.0,
              icon: Icon(Icons.close),
            ),
          ),
          SizedBox(width: 88.0),
          Text(
            "Carrito",
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      );

  Widget _buildTotal(ReactiveModel rmCart) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Total: ${rmCart.state.totalPriceString}€",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderConfirmationPage(),
                    settings: RouteSettings(name: "Order Confirmation Page"),
                  ),
                ),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Continuar",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 8.0),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildPlaceHolder() => Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Añade tus platos favoritos y vuelve aquí para realizar el pedido",
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Image.asset("assets/icons/carro-vacio.png"),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Carro vacio",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      );
}
