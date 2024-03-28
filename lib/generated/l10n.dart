// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Thanks for using this template!`
  String get onboarding_titlePage1 {
    return Intl.message(
      'Thanks for using this template!',
      name: 'onboarding_titlePage1',
      desc: '',
      args: [],
    );
  }

  /// `Don't underestimate the importance of onboarding!`
  String get onboarding_titlePage2 {
    return Intl.message(
      'Don\'t underestimate the importance of onboarding!',
      name: 'onboarding_titlePage2',
      desc: '',
      args: [],
    );
  }

  /// `You can customize the onboarding screen in this file`
  String get onboarding_bodyPage1 {
    return Intl.message(
      'You can customize the onboarding screen in this file',
      name: 'onboarding_bodyPage1',
      desc: '',
      args: [],
    );
  }

  /// `As always, find more info in the docs.`
  String get onboarding_bodyPage2 {
    return Intl.message(
      'As always, find more info in the docs.',
      name: 'onboarding_bodyPage2',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Select theme`
  String get selectTheme {
    return Intl.message(
      'Select theme',
      name: 'selectTheme',
      desc: '',
      args: [],
    );
  }

  /// `Rate my app`
  String get rateMyApp {
    return Intl.message(
      'Rate my app',
      name: 'rateMyApp',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Get Pro version`
  String get getProVersion {
    return Intl.message(
      'Get Pro version',
      name: 'getProVersion',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `If the email exists, you will receive an email to reset your password.`
  String get resetEmailSnackbarMessage {
    return Intl.message(
      'If the email exists, you will receive an email to reset your password.',
      name: 'resetEmailSnackbarMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordDialogTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to reset your password`
  String get resetPasswordDialogMessage {
    return Intl.message(
      'Enter your email to reset your password',
      name: 'resetPasswordDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get stats {
    return Intl.message(
      'Stats',
      name: 'stats',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get emailValidation {
    return Intl.message(
      'Please enter a valid email',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Your password is too weak.`
  String get passwordValidation {
    return Intl.message(
      'Your password is too weak.',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `No account yet? Register now!`
  String get registerNow {
    return Intl.message(
      'No account yet? Register now!',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Ops, something went wrong!`
  String get generalErrorMessage {
    return Intl.message(
      'Ops, something went wrong!',
      name: 'generalErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials!`
  String get authErrorInvalidCredentials {
    return Intl.message(
      'Invalid credentials!',
      name: 'authErrorInvalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests, try again later!`
  String get authErrorTooManyRequests {
    return Intl.message(
      'Too many requests, try again later!',
      name: 'authErrorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use!`
  String get authErrorEmailAlreadyInUse {
    return Intl.message(
      'Email already in use!',
      name: 'authErrorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Your password is too weak.`
  String get authErrorWeakPassword {
    return Intl.message(
      'Your password is too weak.',
      name: 'authErrorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Session`
  String get session {
    return Intl.message(
      'Session',
      name: 'session',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Meditation timer`
  String get meditationTimer {
    return Intl.message(
      'Meditation timer',
      name: 'meditationTimer',
      desc: '',
      args: [],
    );
  }

  /// `Start meditating`
  String get startMeditating {
    return Intl.message(
      'Start meditating',
      name: 'startMeditating',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Session log`
  String get sessionLog {
    return Intl.message(
      'Session log',
      name: 'sessionLog',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Update Image`
  String get updateImage {
    return Intl.message(
      'Update Image',
      name: 'updateImage',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Freedom to Chat Endlessly`
  String get proFeatureTitle1 {
    return Intl.message(
      'Freedom to Chat Endlessly',
      name: 'proFeatureTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Higher word limit`
  String get proFeatureTitle2 {
    return Intl.message(
      'Higher word limit',
      name: 'proFeatureTitle2',
      desc: '',
      args: [],
    );
  }

  /// `No ads`
  String get proFeatureTitle3 {
    return Intl.message(
      'No ads',
      name: 'proFeatureTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy unrestricted conversations with your AI pal, no more conversation limits.`
  String get proFeatureSubtitle1 {
    return Intl.message(
      'Enjoy unrestricted conversations with your AI pal, no more conversation limits.',
      name: 'proFeatureSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Brobot will not be restricted to 150 characters per message.`
  String get proFeatureSubtitle2 {
    return Intl.message(
      'Brobot will not be restricted to 150 characters per message.',
      name: 'proFeatureSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Brobot will be ad-free for you, forever.`
  String get proFeatureSubtitle3 {
    return Intl.message(
      'Brobot will be ad-free for you, forever.',
      name: 'proFeatureSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Unlock Unlimited Access`
  String get unlockUnlimitedAccess {
    return Intl.message(
      'Unlock Unlimited Access',
      name: 'unlockUnlimitedAccess',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `week`
  String get week {
    return Intl.message(
      'week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get year {
    return Intl.message(
      'year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `once`
  String get once {
    return Intl.message(
      'once',
      name: 'once',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `Yearly`
  String get yearly {
    return Intl.message(
      'Yearly',
      name: 'yearly',
      desc: '',
      args: [],
    );
  }

  /// `Lifetime`
  String get lifetime {
    return Intl.message(
      'Lifetime',
      name: 'lifetime',
      desc: '',
      args: [],
    );
  }

  /// ` - 3 day trial`
  String get trialPeriod {
    return Intl.message(
      ' - 3 day trial',
      name: 'trialPeriod',
      desc: '',
      args: [],
    );
  }

  /// `You are a Pro User`
  String get youAreAProUser {
    return Intl.message(
      'You are a Pro User',
      name: 'youAreAProUser',
      desc: '',
      args: [],
    );
  }

  /// `Restore purchase`
  String get restorePurchase {
    return Intl.message(
      'Restore purchase',
      name: 'restorePurchase',
      desc: '',
      args: [],
    );
  }

  /// `Purchase sucessfully restored`
  String get purchaseSucessfullyRestored {
    return Intl.message(
      'Purchase sucessfully restored',
      name: 'purchaseSucessfullyRestored',
      desc: '',
      args: [],
    );
  }

  /// `We could not restore any purchases. Please check in your store app if you have any active subscriptions`
  String get restoreError {
    return Intl.message(
      'We could not restore any purchases. Please check in your store app if you have any active subscriptions',
      name: 'restoreError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
