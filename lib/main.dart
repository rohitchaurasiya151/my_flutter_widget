import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_widget/firebase_analytics/google_analytics_main.dart';

import 'firebase_analytics/firebase_config.dart';
import 'google_ads/banner_inline_page.dart';
import 'google_ads/destination.dart';
import 'google_ads/home_page.dart';
import 'google_ads/native_inline_page.dart';
import 'on_borading_project/screens/onboarding/onboarding.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(MaterialAppType.googleAnalytics);
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
 runApp(const App());
}

enum MaterialAppType {
  onBoarding,
  googleAddMob,
  googleAnalytics,
}

getMaterialApp(MaterialAppType materialAppType) {
  switch(materialAppType) {
    case MaterialAppType.onBoarding:
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OnBoarding Concept',
        home: Builder(
          builder: (BuildContext context) {
            final screenHeight = MediaQuery.of(context).size.height;
            return Onboarding(screenHeight: screenHeight);
          },
        ),
      );
      break;
    case MaterialAppType.googleAddMob:
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, WidgetBuilder>{
          '/banner': (context) =>
              BannerInlinePage(entries: Destination.samples),
          '/native': (context) =>
              NativeInlinePage(entries: Destination.samples),
        },
        home: HomePage(),
      );

      case MaterialAppType.googleAnalytics:
      return const MyApp();
  }
}
