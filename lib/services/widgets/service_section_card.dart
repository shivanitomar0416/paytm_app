import 'package:flutter/material.dart';
import 'package:paytm_app/core/models/service_item.dart';
import 'package:paytm_app/core/utils/app_colors.dart';
import 'package:paytm_app/services/widgets/service_grid_item.dart';

class ServiceSectionCard extends StatelessWidget {
  final String title;
  final List<ServiceItem> services;
  final int crossAxisCount;
  final double childAspectRatio;

  const ServiceSectionCard({
    super.key,
    required this.title,
    required this.services,
    this.crossAxisCount = 4,
    this.childAspectRatio = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    final calculatedCrossAxisCount = crossAxisCount;

    return Padding(
      // Tighter horizontal padding
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Card(
        // Assuming AppColors.cardBackground is white/light gray
        color: const Color.fromARGB(255, 234, 239, 244),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          // Reduced padding inside the card
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                // Added padding specifically for the title for alignment
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8), // Reduced space after title

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: calculatedCrossAxisCount,
                  childAspectRatio: childAspectRatio,
                  // *** TIGHT SPACING CORRECTION: Set to 0 or minimal value ***
                  mainAxisSpacing: 4, // Minimal vertical spacing
                  crossAxisSpacing: 4, // Minimal horizontal spacing
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  // The ServiceGridItem ensures interactivity via InkWell
                  return ServiceGridItem(item: services[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
