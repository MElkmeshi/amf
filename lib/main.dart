import 'package:amf/observer_utils.dart';
import 'package:amf/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [ObserverUtils.routeObserver],
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
