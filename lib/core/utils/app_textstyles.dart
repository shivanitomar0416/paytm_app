import 'package:flutter/material.dart';
import 'app_colors.dart'; // Assuming AppColors is in the same core/theme directory

// =================================================================================
// lib/core/theme/app_text_styles.dart
// =================================================================================

class AppTextStyles {
  // Define a custom TextTheme based on the application's color scheme.
  static const TextTheme paytmTextTheme = TextTheme(
    // Used for large titles, like the one on the Login Screen (handled responsively there)
    headlineLarge: TextStyle(
      color: AppColors.primaryBlue, 
      fontWeight: FontWeight.w900,
      letterSpacing: 1.5,
    ),
    
    // Default style for bold, page-level titles
    titleLarge: TextStyle(
      color: AppColors.primaryBlue, 
      fontWeight: FontWeight.bold,
    ),
    
    // Standard body text
    bodyMedium: TextStyle(
      color: Colors.black87,
    ),
    
    // Small secondary text, useful for footnotes or service descriptions
    bodySmall: TextStyle(
      color: AppColors.secondaryText,
      fontSize: 12,
    ),
  );
}
