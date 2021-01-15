import 'dart:async';

import 'package:calendar_strip/calendar_strip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvp_sevilla/core/utils.dart';
import 'package:mvp_sevilla/js/stripe.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mvp_sevilla/main.dart';
import 'package:mvp_sevilla/models/payment_status.dart';
import 'package:mvp_sevilla/routes/route_names.dart';
import 'package:mvp_sevilla/services/remote_config_service.dart';
import 'package:mvp_sevilla/stores/cart.dart';
import 'package:mvp_sevilla/widgets/discount_countdown_bar.dart';
import 'package:mvp_sevilla/widgets/item_tile.dart';
import 'package:mvp_sevilla/widgets/more_info_buton.dart';
import 'package:mvp_sevilla/widgets/my_box_shadow.dart';
import 'package:mvp_sevilla/widgets/secure_payment_badges.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import "dart:math";
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mvp_sevilla/js/fb_pixel.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  DateTime _orderTime;

  final _formKey = GlobalKey<FormState>();
  bool _formHasErrors;
  bool _orderDateSelectedEventSent;

  bool _isContactInfoEventSent;

  bool _isLoadingCheckout;

  static const List<String> _contactInfoKeys = const [
    NAME_KEY,
    PHONE_KEY,
    EMAIL_KEY,
    ADDRESS_KEY,
  ];

  FirebaseFunctions _firebaseFunctionsInstance;

  static const String NAME_KEY = "name";
  static const String PHONE_KEY = "phone";
  static const String EMAIL_KEY = "email";
  static const String ADDRESS_KEY = "address";

  Map<String, bool> _contactInfoEvents = {};

  Map<String, Timer> _contactInfoTimers = {};

  Map<String, TextEditingController> _contactInfoControllers = {};

  DocumentReference orderDoc;

  ReactiveModel _rmCart;

  List _itemList;

  final _phoneMaskFormatter = MaskTextInputFormatter(
    mask: '### ## ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  TextStyle _titleTextStyle;

  // Widget measures

  ////////////////////
  // MAIN CONTAINER
  /// max container width by default
  double _mainContainterWidth;
  double _mainContainerMaxWidth;
  double _mainContainerLateralMargin;
  double _mainContainerTopMargin;
  double _mainContainerHorizontalPadding;
  double _mainContainerVerticalPadding;

  double _columnSeparation;

  double _textFieldMaxWidth;

  double _leftContentLeftPadding;

  double _screenWidth;
  double _screenHeight;

  bool _isWeb;

  @override
  void initState() {
    _firebaseFunctionsInstance =
        FirebaseFunctions.instanceFor(region: 'europe-west2');

    _firebaseFunctionsInstance.useFunctionsEmulator(
      origin: useEmulator ? "http://localhost:5001" : null,
    );

    FirebaseAnalytics().setCurrentScreen(
      screenName: "Order Confirmation Page",
      screenClassOverride: "OrderConfirmationPage",
    );
    FirebaseAnalytics().logBeginCheckout(
      value: Injector.getAsReactive<Cart>().state.totalPrice,
      currency: "EUR",
    );
    if (noEvents == false) {
      logFBPixelEvents(
        "track",
        "InitiateCheckout",
        FBParams(),
      );
    }

    _isLoadingCheckout = false;

    // Initialize contact info maps
    for (final key in _contactInfoKeys) {
      _contactInfoEvents[key] = false;
      _contactInfoTimers[key] = null;
      _contactInfoControllers[key] = TextEditingController();
    }

    orderDoc = FirebaseFirestore.instance.collection("orders").doc();
    _isContactInfoEventSent = false;
    _orderDateSelectedEventSent = false;
    _formHasErrors = false;

    _rmCart = Injector.getAsReactive<Cart>();

    _itemList = _rmCart.state.dishes.entries
        .map(
          (entry) => {
            "units": entry.value,
            "dish": entry.key.toOrderItem(),
          },
        )
        .toList();

    super.initState();
  }

  @override
  void dispose() {
    _contactInfoControllers.values.forEach((c) => c.dispose());
    _contactInfoTimers.values.forEach((t) => t?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    _isWeb = true;

    _titleTextStyle = Theme.of(context).textTheme.headline4.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );

    _mainContainerLateralMargin = 64.0;
    _mainContainerMaxWidth = 1024.0 - _mainContainerLateralMargin * 2;
    _mainContainerHorizontalPadding = 32.0;
    _mainContainterWidth = min(
      _screenWidth - _mainContainerLateralMargin * 2,
      _mainContainerMaxWidth,
    );

    _leftContentLeftPadding = 16.0;

    _columnSeparation = 16.0;

    _mainContainerTopMargin = 144.0;
    _mainContainerVerticalPadding = 24.0;

    _textFieldMaxWidth = _mainContainterWidth * 0.6 -
        _leftContentLeftPadding -
        _mainContainerHorizontalPadding -
        48.0;

    // TABLET
    if (_screenWidth < 1024 && _screenWidth >= 768.0) {
      _isWeb = false;
      _mainContainerMaxWidth = 768.0;
      _mainContainterWidth = min(
        _screenWidth - _mainContainerLateralMargin * 2,
        _mainContainerMaxWidth,
      );
      _textFieldMaxWidth = double.infinity;
    }
    // PHONE
    else if (_screenWidth < 768.0) {
      _isWeb = false;
      _mainContainerMaxWidth = 768.0;
      _mainContainerLateralMargin = 32.0;
      _mainContainterWidth = null;
      _textFieldMaxWidth = double.infinity;
      if (_screenWidth <= 530) {
        _mainContainerLateralMargin = 0.0;
        _titleTextStyle = Theme.of(context).textTheme.headline5.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            );
      }
      if (_screenWidth < 425) _mainContainerHorizontalPadding = 16.0;
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF701A98),
                  Color(0xFFDF4577),
                ],
              ),
            ),
            width: _screenWidth,
            height: _screenHeight,
          ),
          _buildLogo(),
          Center(child: _buildMainContainer()),
          DiscountCountdownBar(),
        ],
      ),
    );
  }

  Widget _buildLogo() => Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 80.0, 24.0, 0.0),
          child: Image.asset(
            "assets/images/logo.png",
            scale: 6.0,
          ),
        ),
      );

  Widget _buildMainContainer() {
    double orderDetailsContainer;

    if (_isWeb) {
      orderDetailsContainer = (_mainContainterWidth -
              _mainContainerHorizontalPadding * 2 -
              _columnSeparation) *
          0.4;
    } else {
      orderDetailsContainer = 768 -
          _mainContainerHorizontalPadding * 2 -
          _mainContainerLateralMargin;
    }

    return SingleChildScrollView(
      child: Container(
        width: _mainContainterWidth,
        margin: EdgeInsets.fromLTRB(
          _mainContainerLateralMargin,
          _mainContainerTopMargin,
          _mainContainerLateralMargin,
          0.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _mainContainerHorizontalPadding,
          vertical: _mainContainerVerticalPadding,
        ),
        constraints: BoxConstraints(
          maxWidth: _mainContainerMaxWidth,
          minHeight: _screenHeight - 64,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: _isWeb
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftColumn(),
                    SizedBox(width: _columnSeparation),
                    _buildOrderDetailsContainer(
                        containerWidth: orderDetailsContainer),
                  ],
                )
              : Column(
                  children: [
                    _buildTitle(),
                    _buildMobileContent(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildMobileContent() => Container(
        constraints: BoxConstraints(maxWidth: 768.0 / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: MoreInfoButton(),
            ),
            SizedBox(height: 8.0),
            _buildDeliveryTimeSection(),
            SizedBox(height: 16.0),
            _buildLocationSection(),
            _buildOrderDetailsContainer(),
            SizedBox(height: 16.0),
            _buildContactSection(),
          ],
        ),
      );

  Widget _buildLeftColumn() => Container(
        constraints: BoxConstraints(
          maxWidth: (_mainContainterWidth -
                  _mainContainerHorizontalPadding * 2 -
                  _columnSeparation) *
              0.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 16.0),
            _buildLeftColumnContent(),
          ],
        ),
      );

  Widget _buildLeftColumnContent() {
    double leftPadding = 64.0;
    _textFieldMaxWidth = _mainContainterWidth * 0.6 -
        leftPadding -
        _mainContainerHorizontalPadding -
        48.0;

    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoreInfoButton(),
          _buildDeliveryTimeSection(),
          SizedBox(height: 16.0),
          _buildLocationSection(),
          SizedBox(height: 16.0),
          _buildContactSection(),
        ],
      ),
    );
  }

  Widget _buildContactSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadline("Datos de contacto"),
          _buildTextField(
            controller: _contactInfoControllers["name"],
            label: "Nombre",
            key: "name",
            icon: Icon(Icons.person),
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value.isEmpty) return 'Porfavor introduce un nombre';
              return null;
            },
          ),
          _buildTextField(
            controller: _contactInfoControllers["phone"],
            label: "Telefono",
            key: "phone",
            icon: Icon(Icons.phone),
            keyboardType: TextInputType.phone,
            inputFormatters: [_phoneMaskFormatter],
            validator: (value) {
              if (value.isEmpty)
                return 'Porfavor introduce un número de telefono';
              if (_phoneMaskFormatter.getUnmaskedText().length < 9)
                return 'Porfavor introduce un número válido';
              return null;
            },
          ),
          _buildTextField(
            controller: _contactInfoControllers["email"],
            label: "Email",
            key: "email",
            icon: Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) return 'Porfavor introduce tu email';
              final regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
              if (!regExp.hasMatch(value))
                return 'Porfavor introduce un email válido';

              return null;
            },
          ),
        ],
      );

  Widget _buildTextField({
    @required String label,
    @required TextEditingController controller,
    @required Icon icon,
    @required String key,
    TextInputType keyboardType,
    String Function(String) validator,
    List<TextInputFormatter> inputFormatters = const [],
    String hintText,
    bool obscureText = false,
  }) =>
      Container(
        constraints: BoxConstraints(maxWidth: _textFieldMaxWidth),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: icon,
            ),
            hintText: hintText,
          ),
          onChanged: (value) {
            Timer _debounce = _contactInfoTimers[key];
            if (_debounce?.isActive ?? false) _debounce.cancel();
            _contactInfoTimers[key] =
                Timer(Duration(seconds: 1), () => _registerTextField(key));
          },
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: validator,
          textInputAction: TextInputAction.next,
        ),
      );

  Widget _buildHeadline(String text) => Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      );

  Widget _buildLocationSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadline("Elige la dirección de envio"),
          Container(
            constraints: BoxConstraints(maxWidth: _textFieldMaxWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: TextFormField(
                controller: _contactInfoControllers["address"],
                expands: false,
                decoration: InputDecoration(
                  labelText: "Dirección",
                  hintText: "Calle Hong Kong, num 26, piso 3A",
                  icon: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: Icon(Icons.location_on),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  Timer _debounce = _contactInfoTimers["address"];
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _contactInfoTimers["address"] = Timer(Duration(seconds: 1),
                      () => _registerTextField("address"));
                },
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value.isEmpty) return 'Porfavor introduce una dirección';
                  return null;
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildOrderDetailsContainer({double containerWidth}) {
    final showSecurePaymentBadges =
        RemoteConfigService.instance.showSecurePaymentBadges;
    return Container(
      width: containerWidth,
      margin: EdgeInsets.symmetric(vertical: 32.0),
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          myBoxShadow,
        ],
      ),
      child: StateBuilder<Cart>(
          observe: () => Injector.getAsReactive<Cart>(),
          builder: (_, rmCart) {
            double finalPrice;
            String finalPriceString;
            bool applyDiscount = false;

            if (rmCart.state.totalPrice >= 16) {
              finalPrice = rmCart.state.totalPrice - 10.0;
              applyDiscount = true;
            } else {
              finalPrice = rmCart.state.totalPrice;
            }

            finalPriceString = Utils.toPriceString(finalPrice);

            List<Widget> children = [
              Text(
                "Tu pedido",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 26.0),
              )
            ];

            // We add the items from the order
            children.addAll(rmCart.state.dishes.entries
                .map((entry) => ItemTile(
                      dish: entry.key,
                      units: entry.value,
                      isModifyable: false,
                    ))
                .cast<Widget>());

            // We add the total price of the order
            children.addAll([
              SizedBox(height: 8.0),
              applyDiscount
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${rmCart.state.totalPriceString} €",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black54,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    "$finalPriceString €",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              _buildPayButton(rmCart),
              _formHasErrors
                  ? _buildErrorText("Porfavor rellena todos los datos")
                  : Container(),
              showSecurePaymentBadges ? SecurePaymentBadges() : Container(),
            ]);

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );
          }),
    );
  }

  Widget _buildPayButton(ReactiveModel<Cart> rmCart) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            child: InkWell(
              onTap: _isLoadingCheckout ? null : () => _pay(rmCart),
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _isLoadingCheckout
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "Pagar",
                            style: Theme.of(context)
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
      );

  Widget _buildTitle() => Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 16.0),
          Text(
            "Resumen del pedido",
            style: _titleTextStyle,
          ),
        ],
      );

  Widget _buildDeliveryTimeSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadline("Elige tu hora de entrega estimada"),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
            child: Text(
              "Escoge tu hora de entrega estimada. Un repartidor de Deewi"
              " llegará a esa hora para entregarte tu pedido.",
            ),
          ),
          _buildCalendarStrip(),
        ],
      );

  Widget _buildCalendarStrip() {
    return FutureBuilder(
      future: initializeDateFormatting('es_ES', null),
      builder: (_, snapshot) {
        return FormField(
          validator: (val) =>
              val == null ? "Porfavor seleciona un día de entrega" : null,
          builder: (state) {
            final timeAndDateFormat = DateFormat.MMMMEEEEd("es_ES").add_Hm();
            final dateFormat = DateFormat.MMMMEEEEd("es_ES");
            final canOrderSameDay =
                RemoteConfigService.instance.canOrderSameDay;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: state.hasError
                        ? Border.all(
                            color: Theme.of(context).colorScheme.error,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: CalendarStrip(
                    startDate: canOrderSameDay
                        ? DateTime.now()
                        : DateTime.now().add(Duration(hours: 24)),
                    endDate: DateTime.now().add(Duration(days: 7)),
                    addSwipeGesture: true,
                    selectedDate: _orderTime ??
                        (canOrderSameDay
                            ? DateTime.now()
                            : DateTime.now().add(Duration(hours: 24))),
                    dateTileBuilder: _buildDateTile,
                    monthNameWidget: _buildMonthNameWidget,
                    onWeekSelected: (DateTime date) {},
                    onDateSelected: (DateTime date) async {
                      DateTime selectedTime;
                      date = date.add(
                        Duration(
                          hours: DateTime.now().hour,
                          minutes: DateTime.now().minute,
                        ),
                      );
                      DateTime maximumDate = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        23,
                        59,
                      );
                      DateTime minimumDate =
                          DateTime.now().add(Duration(minutes: 30));
                      await showDialog(
                        context: context,
                        builder: (_) => Container(
                          constraints: BoxConstraints(
                            maxWidth: 512.0,
                          ),
                          child: AlertDialog(
                            title: Text(
                              "Selecciona la hora estimada",
                              textAlign: TextAlign.center,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      "Selecciona la hora para el: ",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      dateFormat.format(date),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "Mínimo dentro de 30 minutos",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Theme.of(context).errorColor,
                                      ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 264.0,
                                  ),
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: date.add(
                                      Duration(minutes: 30),
                                    ),
                                    minimumDate: minimumDate,
                                    maximumDate: maximumDate,
                                    onDateTimeChanged: (selection) =>
                                        selectedTime = selection,
                                    use24hFormat: true,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  selectedTime = null;
                                  Navigator.pop(context);
                                },
                                child: Text("Cancelar"),
                              ),
                              RaisedButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                onPressed: () {
                                  selectedTime ??= minimumDate;
                                  Navigator.pop(context);
                                },
                                child: Text("Confirmar"),
                              ),
                            ],
                          ),
                        ),
                      );
                      if (selectedTime != null) {
                        DateTime selectedDate = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );

                        if (_orderDateSelectedEventSent == false) {
                          FirebaseAnalytics().logEvent(
                            name: "order_date_selected",
                            parameters: {
                              "date": selectedDate.millisecondsSinceEpoch,
                            },
                          );
                          if (noEvents == false) {
                            logFBPixelEvents(
                              "track",
                              "AddPaymentInfo",
                              FBParams(),
                            );
                          }
                          setState(() => _orderDateSelectedEventSent = true);
                        }

                        state.didChange(selectedDate);

                        if (noEvents == false) {
                          orderDoc.set(
                            {
                              "delivery_time":
                                  selectedDate.millisecondsSinceEpoch,
                              "client_uid":
                                  FirebaseAuth.instance?.currentUser?.uid,
                              "total_price": _rmCart.state.totalPrice,
                              "item_list": _itemList,
                              "created_at": FieldValue.serverTimestamp(),
                            },
                            SetOptions(merge: true),
                          );
                        }

                        setState(() => _orderTime = selectedDate);
                      }
                    },
                  ),
                ),
                _orderTime != null
                    ? Wrap(
                        children: [
                          Text("Hora de entrega seleccionada:"),
                          SizedBox(width: 2),
                          Text(
                            timeAndDateFormat.format(_orderTime),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : Container(),
                state.hasError ? _buildErrorText(state.errorText) : Container(),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildErrorText(String errorText) => Text(
        "$errorText",
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 12.0,
        ),
      );

  Widget _buildDateTile(
    DateTime date,
    DateTime selectedDate,
    int rowIndex,
    String dayName,
    bool isDateMarked,
    bool isDateOutOfRange,
  ) {
    // Translation to Spanish
    dayName = dayNamesInSpanish[date.weekday - 1];

    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      FittedBox(child: Text(dayName, style: dayNameStyle)),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  Widget _buildMonthNameWidget(String monthString) {
    // We need to reformat the month names to translate them
    final strings = monthString.split(" ");
    String monthLabel = "";

    // If the string is translatable, then we translate it
    for (final string in strings) {
      String translatedMonth;
      translatedMonth = monthNamesInSpanish[string];

      if (translatedMonth != null) {
        monthLabel += "$translatedMonth ";
      } else {
        monthLabel += "$string ";
      }
    }

    return Container(
      child: Text(
        monthLabel,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      padding: EdgeInsets.only(top: 7, bottom: 3),
    );
  }

  void _pay(ReactiveModel<Cart> rmCart) {
    Cart cart = rmCart.state;
    bool isFormValid = _formKey.currentState.validate();

    FirebaseAnalytics().logEvent(
      name: "pay_button_tapped",
      parameters: {
        "success": isFormValid,
      },
    );

    if (isFormValid) {
      orderDoc.set(
        {
          "items": _itemList,
          "client_address": _contactInfoControllers["address"].text,
          "client_name": _contactInfoControllers["name"].text,
          "client_email": _contactInfoControllers["email"].text,
          "client_phone": _contactInfoControllers["phone"].text,
          "total_price": cart.totalPrice,
          "delivery_time": _orderTime.millisecondsSinceEpoch,
          "created_at": FieldValue.serverTimestamp(),
          "client_uid": FirebaseAuth.instance?.currentUser?.uid,
        },
        SetOptions(merge: true),
      );

      _redirectToCheckout();
    } else
      setState(() => _formHasErrors = true);
  }

  void _redirectToCheckout() async {
    try {
      setState(() {
        _isLoadingCheckout = true;
      });
      final response = await _firebaseFunctionsInstance
          .httpsCallable("createStripeCheckoutSession")
          .call({
        "is_test": debugMode,
        "session_params": {
          "payment_method_types": ['card'],
          "mode": 'payment',
          "line_items": _itemList
              .map((item) => {
                    "price": item["dish"]["stripe_price_id"],
                    "quantity": item["units"],
                  })
              .toList(),
          "customer_email": _contactInfoControllers[EMAIL_KEY].text,
          "success_url": Uri.base
              .toString()
              .replaceAll("/checkout", RouteNames.SUCCESS_ROUTE),
          "cancel_url": Uri.base.toString(),
        }
      });

      if (response.data["error"] == null) {
        final String checkoutSessionId = response.data["session_id"];
        Stripe stripe = Stripe(
          debugMode
              ? STRIPE_PUBLISHABLE_TEST_API_KEY
              : STRIPE_PUBLISHABLE_API_KEY,
        );

        orderDoc.set(
          {
            "stripe_checkout_session_id": checkoutSessionId,
            "payment_status": PaymentStatus.waiting,
          },
          SetOptions(merge: true),
        );

        await stripe
            .redirectToCheckout(CheckoutOptions(sessionId: checkoutSessionId));
      } else {
        print(response.data["error"]);
      }
    } catch (e, s) {
      print("Error: ${e.toString()}");
      print("StackTrace: ${s.toString()}");
    }

    setState(() {
      _isLoadingCheckout = true;
    });
  }

  void _registerTextField(String key) {
    if (_contactInfoControllers[key].text != "" && noEvents == false) {
      orderDoc.set(
        {
          "client_$key": _contactInfoControllers[key].text,
          "client_uid": FirebaseAuth.instance?.currentUser?.uid,
          "total_price": _rmCart.state.totalPrice,
          "item_list": _itemList,
          "created_at": FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );

      if (_contactInfoEvents[key] == false) {
        _contactInfoEvents[key] = true;
        FirebaseAnalytics().logEvent(name: "${key}_added");
      }

      if (_contactInfoEvents.values.every((v) => v) &&
          _isContactInfoEventSent == false) {
        FirebaseAnalytics().logAddPaymentInfo();
        _isContactInfoEventSent = true;
      }
    }
  }
}

const List<String> dayNamesInSpanish = [
  "Lun",
  "Mar",
  "Mie",
  "Jue",
  "Vie",
  "Sab",
  "Dom",
];

const Map<String, String> monthNamesInSpanish = {
  "January": "Enero",
  "February": "Febrero",
  "March": "Marzo",
  "April": "Abril",
  "May": "Mayo",
  "June": "Junio",
  "July": "Julio",
  "August": "Agosto",
  "September": "Septiembre",
  "October": "Octubre",
  "November": "Noviembre",
  "December": "Diciembre",
};

List<String> monthLabels = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
