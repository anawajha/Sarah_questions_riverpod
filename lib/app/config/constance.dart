import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static final Constants _instance = Constants._();
  factory Constants ()=> _instance;

  final String font = 'sans_arabic_plain';
  final Size designSize = const Size(393, 913);
  final String englishLangCode = 'en';
  final String arabicLangCode = 'ar';

  final String categoriesCollection = 'Categories';
  final String questionsCollection = 'Questions';

  final String whatsappUrl = "whatsapp://send?text=";
  final String whatsappUrl2 = "https://wa.me/?text=";
  final String phone = "+201021851060";
  final String email = "ahmed.hs9090@gmail.com";
  final String websiteLabel = "www.smeiley.com";
  final String website = "https://www.smeiley.com";

  final String urlUserPlaceholder = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwbYMnoBKydOk2tezl6c1A1g1nQgC_8JXckA&s';
}