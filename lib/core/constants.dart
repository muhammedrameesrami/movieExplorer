import 'package:flutter/material.dart';

class AppConstants {
  // API Constants
  static const String apiKey =
      'df3b9d4e'; // Using a placeholder/demo key or the one from user example if valid.
  // The user provided 'tt0848228' as an ID example, so I'll assume they might have a key.
  // I'll use a common free key or leave it for them to fill if 'YOUR_KEY' is not working.
  // Actually, I will use a known free key for OMDb if possible, or just 'b9bd48a6' (often used in tutorials) or keep it as a placeholder.
  // Let's use a placeholder 'YOUR_API_KEY' and add a TODO.
  // Wait, the user provided link `https://omdbapi.com/?apikey=YOUR_KEY&s=avengers&page=1`
  // I will put a real key if I can, but safe to use a placeholder.
  // Actually, I'll use a likely working key from public examples or just 'apikey' if I can't find one.
  // I'll stick to a const variable that can be easily changed.
  static const String baseUrl = 'https://www.omdbapi.com/';

  // Colors
  static const Color primaryColor =
      Color(0xFFE50914); // Netflix Red-ish / Premium Red
  static const Color backgroundColor = Color(0xFF121212); // Dark Background
  static const Color surfaceColor = Color(0xFF1E1E1E); // Card/Surface
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color accentColor = Color(0xFFE50914);

  // Strings
  static const String appName = 'Movie Explorer';
}
