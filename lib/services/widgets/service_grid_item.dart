import 'package:flutter/material.dart';
import 'package:paytm_app/core/models/service_item.dart';
import 'package:paytm_app/services/widgets/success_page.dart';

class ServiceGridItem extends StatelessWidget {
  final ServiceItem item;
  const ServiceGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessPage(
              title: item.title, // Pass the service name as the page title
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // Use a Container for controlled padding/margin
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 4.0,
        ), // Less horizontal padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container (to make the icon more prominent/card-like if desired, though not strictly needed here)
            Icon(
              item.icon,
              // Increased size to match the prominence in the screenshots
              size: 38,
              // Use the item's color, which should be set to Blue or Orange for consistency
              color: item.color,
            ),
            const SizedBox(
              height: 6,
            ), // Slightly more space between icon and text
            Flexible(
              // Use Flexible to prevent text overflow in the tight grid
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                // Ensure text style matches the general app theme
                style: const TextStyle(
                  fontSize: 10, // Small, clean font size
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  height: 1.1, // Tighten line height for multi-line labels
                ),
                maxLines: 2, // Allow multi-line names (e.g., "FASTag Recharge")
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
