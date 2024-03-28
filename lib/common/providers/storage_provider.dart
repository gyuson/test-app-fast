import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/constants.dart';
import '../utils/logger.dart';

late Box preferencesBox;

Future<void> initHive() async {
  try {
    preferencesBox = await Hive.openBox(preferencesBoxKey);
    getLogger('Storage').i('init hive');
  } catch (e) {
    getLogger('Storage')
        .e('init hive failed. deleting box now and trying again', error: e);
    await Hive.deleteBoxFromDisk(preferencesBoxKey);

    preferencesBox = await Hive.openBox(preferencesBoxKey);
  }
}

final storageProvider = ChangeNotifierProvider<Storage>((ref) {
  final storage = Storage();
  return storage;
});

class Storage extends ChangeNotifier {
  final _logger = getLogger('Storage');

  int getTheme() {
    return preferencesBox.get(themePreferenceKey, defaultValue: 2);
  }

  void setTheme(int index) {
    preferencesBox.put(themePreferenceKey, index);
    _logger.d('themePreferenceKey: $index');

    notifyListeners();
  }

  String getSelecedLanguageCode() {
    return preferencesBox.get(languageKey, defaultValue: defaultLanguage);
  }

  void setLanguage(String languageCode) {
    preferencesBox.put(languageKey, languageCode);
    _logger.d('languageKey: $languageCode');
    notifyListeners();
  }

  bool getOnboardingDone() {
    return preferencesBox.get(onBoardingDoneKey, defaultValue: false);
  }

  void setOnboardingDone(bool value) {
    preferencesBox.put(onBoardingDoneKey, value);
    _logger.d('onBoardingDoneKey: $value');
    notifyListeners();
  }
}
