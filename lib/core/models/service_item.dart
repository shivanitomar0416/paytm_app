import 'package:flutter/material.dart';
import 'package:paytm_app/core/utils/app_colors.dart';

class ServiceItem {
  final IconData icon;
  final String title;
  final Color color;
  final String? route;

  ServiceItem(
    this.icon,
    this.title, {
    this.color = AppColors.primaryBlue,
    this.route,
  });
}
