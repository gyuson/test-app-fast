import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/providers/rate_my_app_provider.dart';
import 'package:fast_flutter_template/common/utils/constants.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/widgets/primary_button.dart';
import 'package:fast_flutter_template/features/authentication/providers/auth_provider.dart';
import 'package:fast_flutter_template/features/authentication/providers/user_provider.dart';
import 'package:fast_flutter_template/features/pro/provider/revenue_cat_provider.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app_router.gr.dart';
import '../../../common/utils/style.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPro = ref.watch(proUserProvider).asData?.value ?? false;

    final user = ref.watch(userProvider).asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: Column(
        children: [
          if (isPro)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: context.colorScheme.primary),
                    borderRadius: BorderRadius.circular(8)),
                title: Text(S.of(context).youAreAProUser),
                leading: const Icon(Icons.star),
              ),
            )
          else
            PrimaryButton(
              text: S.of(context).getProVersion,
              onPressed: () => context.navigateTo(const ProRoute()),
            ),
          Expanded(
            child: SettingsList(
              darkTheme: SettingsThemeData(
                titleTextColor: context.colorScheme.primary,
                settingsListBackground: Colors.transparent,
                settingsSectionBackground:
                    Theme.of(context).colorScheme.surface,
              ),
              lightTheme: SettingsThemeData(
                titleTextColor: context.colorScheme.primary,
                settingsListBackground: Colors.transparent,
              ),
              platform: DevicePlatform.android,
              brightness: Brightness.light,
              sections: [
                SettingsSection(
                  title: Text(S.of(context).account),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      title: Text(S.of(context).editProfile),
                      leading: const Icon(Icons.account_circle_outlined),
                      onPressed: (_) {
                        context.router.navigate(const ProfileRoute());
                      },
                    ),
                    //INFO this is only for builds in debug
                    if (kDebugMode)
                      SettingsTile.navigation(
                        title: const Text('Debug Menu'),
                        leading: const Icon(Icons.language),
                        onPressed: (_) {
                          context.router.navigate(const DebugRoute());
                        },
                      ),
                    if (user != null)
                      SettingsTile(
                        title: Text(S.of(context).emailAddress),
                        leading: const Icon(Icons.person_3_outlined),
                        value: Text(user.email),
                      ),
                    SettingsTile.navigation(
                      title: Text(S.of(context).selectTheme),
                      leading: const Icon(Icons.draw),
                      onPressed: (_) {
                        context.router.navigate(const ThemeSelectionRoute());
                      },
                    ),
                    SettingsTile.navigation(
                      title: Text(S.of(context).language),
                      leading: const Icon(Icons.language),
                      onPressed: (_) {
                        context.router.navigate(const LanguageSelectionRoute());
                      },
                    ),
                    SettingsTile.navigation(
                      title: Text(S.of(context).rateMyApp),
                      leading: const Icon(Icons.rate_review),
                      onPressed: (_) {
                        ref.read(rateMyAppProvider).launchStore();
                      },
                    ),
                    if (isPro)
                      SettingsTile(
                        title: Text(S.of(context).restorePurchase),
                        leading: const Icon(Icons.settings_backup_restore),
                        onPressed: (_) {
                          ref
                              .refresh(restorePurchaseProvider.future)
                              .then((value) {
                            if (value?.activeSubscriptions.isNotEmpty ??
                                false) {
                              ref.invalidate(proUserProvider);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    S.of(context).purchaseSucessfullyRestored),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(S.of(context).restoreError),
                              ));
                            }
                          });
                        },
                      ),
                  ],
                ),
                SettingsSection(
                  title: Text(S.of(context).info),
                  tiles: [
                    SettingsTile.navigation(
                      title: Text(S.of(context).privacyPolicy),
                      leading: const Icon(Icons.privacy_tip),
                      onPressed: (_) {
                        launchUrl(
                          Uri.parse(privacyUrl),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    SettingsTile.navigation(
                      title: Text(S.of(context).termsOfService),
                      leading: const Icon(Icons.description),
                      onPressed: (_) {
                        launchUrl(
                          Uri.parse(termsUrl),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    SettingsTile.navigation(
                      title: Text(S.of(context).contact),
                      leading: const Icon(Icons.email),
                      onPressed: (_) {
                        launchUrl(
                          Uri.parse('mailto:test@test.app'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    SettingsTile(
                      title: const Text('Open source licenses'),
                      leading: const Icon(Icons.code),
                      onPressed: (_) {
                        showLicensePage(
                          context: context,
                          applicationName: 'Fast Flutter Template',
                          applicationLegalese: '© 2023 Fast Flutter Template',
                        );
                      },
                    ),
                    SettingsTile(
                      leading: const Icon(Icons.new_releases_outlined),
                      title: Text(S.of(context).version),
                      value: FutureBuilder(
                        future: PackageInfo.fromPlatform(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            final packageInfo = snapshot.data as PackageInfo;
                            return Text(
                              '${packageInfo.version} (${packageInfo.buildNumber})',
                              style: context.textTheme.labelMedium,
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text(S.of(context).session),
                  tiles: [
                    SettingsTile(
                      leading: const Icon(Icons.logout),
                      title: Text(S.of(context).logout),
                      onPressed: (c) async {
                        ref.read(authProvider.notifier).logout();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace20,
        ],
      ),
    );
  }
}
