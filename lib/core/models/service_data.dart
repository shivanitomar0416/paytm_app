import 'package:flutter/material.dart';
import '../models/service_item.dart';
// service_data.dart
class RoutePaths {
  static const String root = '/';
  static const String home = '/home';
  static const String creditCardBill = '/credit_card_bill'; // <- match router.dart
}

final List<ServiceItem> moneyTransferServices = [
  ServiceItem(Icons.person_outline, 'Pay to Contact'),
  ServiceItem(Icons.account_balance_outlined, 'To Bank/UPI ID'),
  ServiceItem(Icons.autorenew, 'Self Account'),
  ServiceItem(Icons.account_balance_wallet_outlined, 'Check Balance'),
];

final List<ServiceItem> popularServices = [
  ServiceItem(Icons.phone_android_outlined, 'Mobile Recharge'),
  ServiceItem(Icons.directions_car_outlined, 'FASTag Recharge'),
  ServiceItem(Icons.satellite_outlined, 'DTH'),
  ServiceItem(Icons.account_balance_wallet_outlined, 'Loan Repayment'),
];

final List<ServiceItem> utilityServices = [
  ServiceItem(Icons.home_outlined, 'Rent'),
  ServiceItem(Icons.water_drop_outlined, 'Water'),
  ServiceItem(Icons.lightbulb_outline, 'Electricity'),
  ServiceItem(Icons.local_fire_department_outlined, 'Cylinder'),
  ServiceItem(Icons.receipt_long, 'Postpaid'),
  ServiceItem(Icons.wifi_outlined, 'Broadband'),
   ServiceItem(Icons.credit_card_outlined, 'Credit Card', route: '/credit_card_bill'),
    ServiceItem(Icons.gas_meter_outlined, 'Piped Gas'),
];

final List<ServiceItem> donationsDevotion = [
  ServiceItem(Icons.handshake_outlined, 'Donate'),
  ServiceItem(Icons.self_improvement, 'Devotion'),
  ServiceItem(Icons.temple_hindu, 'Ram Mandir'),
  ServiceItem(Icons.fastfood_sharp, 'Donate meal'),
];

final List<ServiceItem> financialServices = [
  ServiceItem(Icons.security, 'LIC/ Insurance'),
  ServiceItem(Icons.account_balance, 'Municipal Tax'),
  ServiceItem(Icons.calendar_month, 'Recurring Deposit'),
  ServiceItem(Icons.accessibility_new, 'NPS'),
  ServiceItem(Icons.account_balance_wallet, 'Loan Repayment'),
];

final List<ServiceItem> moreServices = [
  ServiceItem(Icons.group, 'Clubs & Associations'),
  ServiceItem(Icons.apartment, 'Apartments'),
  ServiceItem(Icons.local_hospital, 'Hospitals'),
  ServiceItem(Icons.local_shipping, 'Buy FASTag'),
  ServiceItem(Icons.directions_car_filled, 'Rental'),
    ServiceItem(Icons.credit_card, 'NVMC Recharge'),
  ServiceItem(Icons.school, 'Education Fees'),
  ServiceItem(Icons.speed, 'Prepaid Meter'),
];