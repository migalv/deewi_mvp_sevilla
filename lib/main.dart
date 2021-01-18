import 'package:mvp_sevilla/routes/route_names.dart';
import 'package:mvp_sevilla/routes/router.dart';
import 'package:mvp_sevilla/services/remote_config_service.dart';
import 'package:mvp_sevilla/stores/cart.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvp_sevilla/theme/deewi_theme.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

const bool debugMode = true;
const bool useEmulator = false;
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
      title: "Deewi | Prueba auténtica multicultural",
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      theme: DeewiTheme().themeData,
      initialRoute: RouteNames.HOME_ROUTE,
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: Injector(
          inject: [
            Inject<Cart>(() => Cart()),
          ],
          builder: (_) => child,
        ),
      ),
    );
  }
}
