import 'package:fake_app_v1/pages/home_page.dart';
import 'package:fake_app_v1/services/remote_config_service.dart';
import 'package:fake_app_v1/stores/cart.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

const bool debugMode = false;
bool noEvents = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await RemoteConfigService.instance.initialize(debugging: debugMode);

  if (Uri.base.queryParameters["no_events"] != null) {
    FirebaseAnalytics().setAnalyticsCollectionEnabled(false);
    noEvents = true;
  }

  if (debugMode) {
    FirebaseAnalytics().setAnalyticsCollectionEnabled(false);
    noEvents = true;
  } else {
    final user = await FirebaseAuth.instance.signInAnonymously();
    FirebaseAnalytics().setUserId(user.user.uid);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Deewi | Prueba comida casera",
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      ),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
        colorScheme: ColorScheme(
          primary: Colors.amber,
          primaryVariant: Colors.amber,
          secondary: ThemeData.light().colorScheme.secondary,
          secondaryVariant: ThemeData.light().colorScheme.secondaryVariant,
          background: ThemeData.light().colorScheme.background,
          surface: ThemeData.light().colorScheme.surface,
          error: ThemeData.light().errorColor,
          onPrimary: ThemeData.light().colorScheme.onPrimary,
          onSecondary: ThemeData.light().colorScheme.onSecondary,
          onBackground: ThemeData.light().colorScheme.onBackground,
          onSurface: ThemeData.light().colorScheme.onSurface,
          onError: ThemeData.light().colorScheme.onError,
          brightness: ThemeData.light().colorScheme.brightness,
        ),
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          buttonColor: Colors.amber,
        ),
      ),
      home: Injector(
        inject: [
          Inject<Cart>(() => Cart()),
        ],
        builder: (_) => HomePage(),
      ),
    );
  }
}
