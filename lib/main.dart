import 'package:flutter/material.dart';
//LIB
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/screen/food_screen.dart';
import 'package:restaurant_app/screen/login_screen.dart';
import 'package:restaurant_app/screen/order_screen.dart';
import 'package:restaurant_app/screen/profile_screen.dart';
import 'package:restaurant_app/screen/rastaurant_detail_screen.dart';
//SCREEN
import 'package:restaurant_app/screen/rastaurant_screen.dart';
import 'package:restaurant_app/screen/splash_screen.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'NotoSans'),
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
    );
  }
}

final GoRouter routerConfig = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => SplashScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) => LoginScreen(),
        ),
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) =>
                RastaurantScreen(),
            routes: [
              GoRoute(
                  path: ':id',
                  builder: (BuildContext context, GoRouterState state) =>
                      RastaurantDetailScreen())
            ]),
        GoRoute(
          path: 'food',
          builder: (BuildContext context, GoRouterState state) => FoodScreen(),
        ),
        GoRoute(
          path: 'order',
          builder: (BuildContext context, GoRouterState state) => OrderScreen(),
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) =>
              ProfileScreen(),
        ),
      ])
]);
