import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/common/widgets/primary_button.dart';
import 'package:fast_flutter_template/features/pro/provider/revenue_cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../generated/l10n.dart';

@RoutePage()
class ProScreen extends ConsumerStatefulWidget {
  const ProScreen({super.key});

  @override
  ConsumerState<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends ConsumerState<ProScreen> {
  Package? selectedPackage;

  @override
  Widget build(BuildContext context) {
    final revenueCat = ref.watch(offeringsControllerProvider);

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: revenueCat.when(
            data: (data) => _buildContent(context, data, ref),
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Center(child: Text(e.toString())),
          ),
        ));
  }

  Widget _buildContent(BuildContext context, Offerings? data, WidgetRef ref) {
    if (data == null) {
      return const Center(
        child: Text(
          'NOTE: No offerings configured. Go checkout RevenueCat dashboard.',
          textAlign: TextAlign.center,
        ),
      );
    }
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      S.of(context).unlockUnlimitedAccess,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    const Divider(
                      endIndent: 40,
                      indent: 40,
                    ),
                    ListTile(
                      title: Text(S.of(context).proFeatureTitle1),
                      subtitle: Text(S.of(context).proFeatureSubtitle1),
                      leading: const Icon(Icons.hiking_sharp),
                    ),
                    ListTile(
                      title: Text(S.of(context).proFeatureTitle2),
                      subtitle: Text(S.of(context).proFeatureSubtitle2),
                      leading: const Icon(Icons.bar_chart_outlined),
                    ),
                    ListTile(
                      title: Text(S.of(context).proFeatureTitle3),
                      subtitle: Text(S.of(context).proFeatureSubtitle3),
                      leading: const Icon(Icons.bar_chart_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Column(
              children: [
                if (data.current?.availablePackages != null)
                  ...data.current!.availablePackages.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RadioListTile<Package?>(
                        groupValue: selectedPackage,
                        value: item,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedPackage = value;
                          });
                        },
                        title: Text(_getTitle(item)),
                        subtitle: Text(_getSubtitle(item)),
                      ),
                    );
                  }).toList(),
                verticalSpace16,
                PrimaryButton(
                  onPressed: selectedPackage == null
                      ? null
                      : () async {
                          try {
                            await ref
                                .read(offeringsControllerProvider.notifier)
                                .purchasePro(selectedPackage!);
                            if (context.mounted) context.popRoute();
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Error while purchasing the subscription. Please try again later.',
                                  ),
                                ),
                              );
                            }
                          }
                        },
                  text: S.of(context).subscribe,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getSubtitle(Package? item) {
    return '${item?.storeProduct.priceString}/${_getPeriod(item)}';
  }

  String _getPeriod(Package? item) {
    switch (item?.packageType) {
      case PackageType.weekly:
        return S.of(context).week;
      case PackageType.annual:
        return S.of(context).year;

      default:
        return S.of(context).once;
    }
  }

  String _getTitle(Package? item) {
    final freeTrialAvailable =
        item?.storeProduct.subscriptionOptions?.length == 2;

    String title = '';
    switch (item?.packageType) {
      case PackageType.weekly:
        title = S.of(context).weekly;
        break;
      case PackageType.annual:
        title = S.of(context).yearly;
        break;

      default:
        title = S.of(context).lifetime;
        break;
    }
    if (freeTrialAvailable) {
      title += '- ${S.of(context).trialPeriod}';
    }

    return title;
  }
}
