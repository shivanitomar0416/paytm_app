import 'package:flutter/material.dart';
import 'package:paytm_app/core/models/service_data.dart';
import 'package:paytm_app/core/utils/app_colors.dart';
import 'package:paytm_app/services/widgets/bottom_navbar.dart';
import 'package:paytm_app/services/widgets/custom_app_header.dart';
import 'package:paytm_app/services/widgets/service_section_card.dart';
import 'package:paytm_app/services/widgets/success_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Tapped index: $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header
              const CustomAppHeader(),
              const SizedBox(height: 16),

              // 🔹 Credit Card & My Bills Section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    // 🔸 Credit Card Bill (Larger Card)
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left Side Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.credit_card,
                                        size: 20,
                                        color: AppColors.primaryBlue,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Credit Card - 9685',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '₹1200 due on Wed, 25 Jan',
                                    style: TextStyle(
                                      color: Colors.redAccent.shade100,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Right Pay Button
                            ElevatedButton(
                              onPressed: () {
                                // Route the "Pay" action to the shared SuccessPage via direct routing
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SuccessPage(
                                      title:
                                          'Credit Card Payment', // Provide a specific title for context
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                    color: AppColors
                                        .primaryBlue, // Use the same blue for the border
                                    width: 1.0, // Define the border thickness
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Pay',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 4, 47, 83),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // 🔹 My Bills (Smaller Card)
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'My Bills',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 Service Sections
              ServiceSectionCard(
                title: 'Money Transfers',
                services: moneyTransferServices,
              ),
              ServiceSectionCard(
                title: 'Popular Recharge',
                services: popularServices.sublist(0, 4),
              ),
              ServiceSectionCard(title: 'Utilities', services: utilityServices),
              ServiceSectionCard(
                title: 'Donations & Devotion',
                services: donationsDevotion,
              ),
              ServiceSectionCard(
                title: 'Financial Services & Taxes',
                services: financialServices,
                childAspectRatio: 0.9,
              ),
              ServiceSectionCard(
                title: 'More Services',
                services: moreServices,
                childAspectRatio: 0.9,
              ),
            ],
          ),
        ),
      ),

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
      ),
    );
  }
}
