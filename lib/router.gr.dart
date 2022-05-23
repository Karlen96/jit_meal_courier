// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'pages/dashboard/dashboard_page.dart' as _i3;
import 'pages/login_page/login_page.dart' as _i2;
import 'pages/order_page/order_page.dart' as _i4;
import 'pages/splash_screen.dart' as _i1;

class Router extends _i5.RootStackRouter {
  Router([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashScreenPage(),
          fullscreenDialog: true);
    },
    LoginRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          fullscreenDialog: true);
    },
    DashboardRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.DashboardPage());
    },
    OrderRoute.name: (routeData) {
      final args = routeData.argsAs<OrderRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.OrderPage(key: args.key, orderId: args.orderId));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i5.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i5.RouteConfig(DashboardRoute.name, path: '/dashboard-page'),
        _i5.RouteConfig(OrderRoute.name, path: '/order-page')
      ];
}

/// generated route for
/// [_i1.SplashScreenPage]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/dashboard-page');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.OrderPage]
class OrderRoute extends _i5.PageRouteInfo<OrderRouteArgs> {
  OrderRoute({_i6.Key? key, required int orderId})
      : super(OrderRoute.name,
            path: '/order-page',
            args: OrderRouteArgs(key: key, orderId: orderId));

  static const String name = 'OrderRoute';
}

class OrderRouteArgs {
  const OrderRouteArgs({this.key, required this.orderId});

  final _i6.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key, orderId: $orderId}';
  }
}
