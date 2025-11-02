import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paytm_app/core/utils/app_colors.dart';
import 'package:paytm_app/features/creditcard_screen/presentation/creditcard_screen.dart';
import 'package:paytm_app/features/home_screen/presentation/home_screen.dart';
import 'package:paytm_app/features/login_screen/presentation/login_screen.dart';
import 'package:paytm_app/features/search/presentation/search_screen.dart';

// Import all your screens here

/// Central route map to reduce duplication
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    '/': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/credit_card_bill': (context) => const CreditCardBillScreen(),
  };
}

/// Main GoRouter instance
final GoRouter appRouter = GoRouter(
  initialLocation: '/', // starting screen
  routes: getRoutes().entries
      .map(
        (entry) => GoRoute(
          name: entry.key,
          path: entry.key,
          builder: (context, state) => entry.value(context),
        ),
      )
      .toList(),
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('No route found: ${state.uri.path}'))),
);
