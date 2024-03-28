import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rate_my_app/rate_my_app.dart';

final rateMyAppProvider = Provider((ref) {
  return RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 2,
    minLaunches: 3,
    remindDays: 7,
    remindLaunches: 10,
    //INFO
    //Change the app identifier
    googlePlayIdentifier: 'your.identifier.here',
    appStoreIdentifier: '1234566',
  );
});
