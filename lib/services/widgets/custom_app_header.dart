import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paytm_app/core/utils/app_colors.dart';
import 'package:paytm_app/features/search/presentation/search_screen.dart';

// Ensure this path is correct:

// --- CONVERTED TO STATEFULWIDGET ---
class CustomAppHeader extends StatefulWidget {
  const CustomAppHeader({super.key});

  @override
  State<CustomAppHeader> createState() => _CustomAppHeaderState();
}

class _CustomAppHeaderState extends State<CustomAppHeader> {
  // 1. STATE VARIABLE: Tracks whether the TextField should be shown
  bool _isSearching = false;

  List<ServiceItem> _getAllServices() {
    List<ServiceItem> allServices = [];

    // Recharge Services
    allServices.addAll([
      ServiceItem(
        name: 'Mobile Recharge',
        icon: Icon(Icons.phone_android, color: AppColors.primaryBlue),
        category: 'Recharge',
        onTap: () {
          // Navigate to mobile recharge
        },
      ),
      ServiceItem(
        name: 'FASTag Recharge',
        icon: Icon(Icons.local_car_wash, color: AppColors.primaryBlue),
        category: 'Recharge',
        onTap: () {
          // Navigate to FASTag
        },
      ),
      ServiceItem(
        name: 'DTH',
        icon: Icon(Icons.tv, color: AppColors.primaryBlue),
        category: 'Recharge',
        onTap: () {
          // Navigate to DTH
        },
      ),
      ServiceItem(
        name: 'Cable TV',
        icon: Icon(Icons.desktop_windows, color: AppColors.primaryBlue),
        category: 'Recharge',
        onTap: () {
          // Navigate to Cable TV
        },
      ),
    ]);

    // Donations & Devotion
    allServices.addAll([
      ServiceItem(
        name: 'Donate',
        icon: Icon(Icons.volunteer_activism, color: AppColors.primaryBlue),
        category: 'Donations & Devotion',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Devotion',
        icon: Icon(Icons.temple_hindu, color: AppColors.primaryBlue),
        category: 'Donations & Devotion',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Ram Mandir',
        icon: Icon(Icons.temple_buddhist, color: AppColors.primaryBlue),
        category: 'Donations & Devotion',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Donate meal',
        icon: Icon(Icons.restaurant, color: AppColors.primaryBlue),
        category: 'Donations & Devotion',
        onTap: () {},
      ),
    ]);

    // Financial Services & Taxes
    allServices.addAll([
      ServiceItem(
        name: 'LIC/Insurance',
        icon: Icon(Icons.shield, color: AppColors.primaryBlue),
        category: 'Financial Services & Taxes',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Municipal Tax & Services',
        icon: Icon(Icons.home_work, color: AppColors.primaryBlue),
        category: 'Financial Services & Taxes',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Recurring Deposit',
        icon: Icon(Icons.calendar_today, color: AppColors.primaryBlue),
        category: 'Financial Services & Taxes',
        onTap: () {},
      ),
      ServiceItem(
        name: 'NPS',
        icon: Icon(Icons.trending_up, color: AppColors.primaryBlue),
        category: 'Financial Services & Taxes',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Loan Repayment',
        icon: Icon(Icons.money, color: AppColors.primaryBlue),
        category: 'Financial Services & Taxes',
        onTap: () {},
      ),
    ]);

    // More Services
    allServices.addAll([
      ServiceItem(
        name: 'Clubs & Associations',
        icon: Icon(Icons.groups, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Apartments',
        icon: Icon(Icons.apartment, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Hospitals',
        icon: Icon(Icons.local_hospital, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Buy FASTag',
        icon: Icon(Icons.credit_card, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Rental',
        icon: Icon(Icons.car_rental, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
      ServiceItem(
        name: 'NCMC Recharge',
        icon: Icon(Icons.payment, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Education Fees',
        icon: Icon(Icons.school, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
      ServiceItem(
        name: 'Prepaid Meter',
        icon: Icon(Icons.electric_meter, color: AppColors.primaryBlue),
        category: 'More Services',
        onTap: () {},
      ),
    ]);

    return allServices;
  }

  // Helper function to build a single rounded line segment (for QR section)
  Widget _buildLineSegment({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.accentOrange,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  // Helper function for the initial Search Icon placeholder
  Widget _buildSearchIconPlaceholder() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        key: const ValueKey('search_icon'),
        icon: const Icon(Icons.search_outlined, color: Colors.white, size: 28),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(
                allServices: _getAllServices(), // Method to get all services
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper function for the active TextField search bar
  Widget _buildSearchTextField() {
    return Container(
      key: const ValueKey('search_field'),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        autofocus: true, // Focus immediately when shown
        decoration: InputDecoration(
          hintText: 'Search for anything...',
          hintStyle: TextStyle(color: Colors.white70, fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Colors.white, size: 24),

          // Remove all standard TextField borders/lines for a clean look
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(
            top: 8.0,
          ), // Adjust vertical alignment
        ),
        style: TextStyle(color: Colors.white, fontSize: 16),
        cursorColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final qrBlockSize = screenWidth * 0.6;

    const double cornerLength = 30.0;
    const double cornerThickness = 3.0;
    const double lineOffset = 0.0;

    return Container(
      padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF001F52), Color(0xFF0D47A1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          // --- 1. Top Bar (Profile, Search, Wallet, Notification) ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1a. Left Side: Profile & Location (Tap to exit search mode)
              GestureDetector(
                onTap: () {
                  // Tapping the profile/location area reverts to icon view if searching
                  if (_isSearching) {
                    setState(() {
                      _isSearching = false;
                    });
                  }
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 24),
                        SizedBox(width: 4),
                        Text(
                          'Location',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      'B-207, New Ashok Nagar',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // 1b. Center: Dynamic Content (Toggles between Icon and TextField)
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  // Ternary operator controls which widget is displayed
                  child: _isSearching
                      ? _buildSearchTextField()
                      : _buildSearchIconPlaceholder(),
                ),
              ),

              const SizedBox(width: 8),

              // 1c. Right Side: Action Icons
              IconButton(
                icon: const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // Separator between the header bar and the QR section
          const SizedBox(height: 20),

          // --- 2. Quick Scan To Pay Section (QR Scanner Visual) ---
          SizedBox(
            height: qrBlockSize,
            width: qrBlockSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {
                  print('Quick Scan To Pay tapped!');
                },
                borderRadius: BorderRadius.circular(20),
                splashColor: AppColors.accentOrange.withOpacity(0.3),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background QR Code Graphic
                    const Opacity(
                      opacity: 0.2,
                      child: Icon(
                        Icons.qr_code_2,
                        color: Colors.white,
                        size: 120,
                      ),
                    ),

                    // Corner Frame Implementation (Top-Left, Top-Right, etc.)
                    Positioned(
                      top: lineOffset,
                      left: lineOffset,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLineSegment(
                            width: cornerLength,
                            height: cornerThickness,
                          ),
                          _buildLineSegment(
                            width: cornerThickness,
                            height: cornerLength,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: lineOffset,
                      right: lineOffset,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildLineSegment(
                            width: cornerLength,
                            height: cornerThickness,
                          ),
                          _buildLineSegment(
                            width: cornerThickness,
                            height: cornerLength,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: lineOffset,
                      left: lineOffset,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildLineSegment(
                            width: cornerThickness,
                            height: cornerLength,
                          ),
                          _buildLineSegment(
                            width: cornerLength,
                            height: cornerThickness,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: lineOffset,
                      right: lineOffset,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildLineSegment(
                            width: cornerThickness,
                            height: cornerLength,
                          ),
                          _buildLineSegment(
                            width: cornerLength,
                            height: cornerThickness,
                          ),
                        ],
                      ),
                    ),

                    // Central Content
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quick Scan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'To Pay',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        SizedBox(height: 4),
                        Icon(Icons.touch_app, color: Colors.white, size: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
