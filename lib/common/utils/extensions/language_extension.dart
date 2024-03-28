import 'package:flutter/material.dart';

extension LanguageExtension on Locale {
  String get fullLanguageName {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'it':
        return 'Italiano';
      case 'ja':
        return '日本語';
      case 'ko':
        return '한국어';
      case 'pt':
        return 'Português';
      case 'ru':
        return 'Русский';
      case 'zh':
        return '中文';
      default:
        return 'English';
    }
  }
}
