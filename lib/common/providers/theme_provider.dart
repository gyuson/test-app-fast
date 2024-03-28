import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'storage_provider.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.values[ref.read(storageProvider).getTheme()];
});
