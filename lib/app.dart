import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rewards_app/screens/login/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/firebase_cloud_messaging_util.dart';

ValueNotifier<String> languageSelected = ValueNotifier<String>("en");
final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp();
  @override
  MyAppState createState() => MyAppState();

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  Locale _locale = Locale.fromSubtags(languageCode: "en");

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        FirebaseCloudMessagingUtil.initConfigure(appKey.currentContext!);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: "en",
        future: const FlutterSecureStorage().read(key: AppConstants.deviceLanguage),
        builder: (context, snapshot) {
          languageSelected.value = snapshot.data.toString();
          return MaterialApp(
            title: 'Rewards APP',
            navigatorKey: appKey,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            locale: Locale.fromSubtags(languageCode: snapshot.data.toString()),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', ''), // Arabic
              Locale('en', ''), // English
            ],
            home: const LoginScreen(),
          );
        });
  }
}
