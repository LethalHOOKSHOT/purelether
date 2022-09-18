import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/redux/actions.dart';
import 'package:untitled3/redux/app_state.dart';
import 'package:untitled3/redux/middlewares.dart';
import 'package:untitled3/redux/reducers.dart';
import 'package:untitled3/repository/LocalRepository.dart';
import 'package:untitled3/validator/validator.dart';
import 'package:untitled3/widgets/login/login.dart';
import 'package:untitled3/widgets/main_menu/main_menu_view.dart';
import 'package:untitled3/widgets/registration/registration.dart';
import 'package:untitled3/widgets/statistics_screen/statistic_screen.dart';
import 'firebase_options.dart';
import 'widgets/game_screen/game_screen.dart';
import 'package:desktop_webview_auth/desktop_webview_auth.dart';
import 'package:desktop_webview_auth/github.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void dispose() async {
    store.dispatch(SaveStatisticsInFireStoreAction());
    super.dispose();
  }

  final Store<AppState> store = Store(reducer,
      middleware: createAppMiddleware(FireBaseRepository()),
      initialState: AppState.initialized());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "matApp",
          initialRoute: "/",
          routes: <String, WidgetBuilder>{
            "/": (BuildContext context) =>
                LoginScreen(validator: SimpleValidator()),
            "/registration": (BuildContext context) =>
                RegistrationScreen(validator: SimpleValidator()),
            "/main": (BuildContext context) => MainMenu(),
            "/statistics": (BuildContext context) => const StatisticsScreen(),
            "/loom": (BuildContext context) => const GameScreen(),
          },
        ));
  }
}
