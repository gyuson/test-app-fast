import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/app_router.gr.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/extensions/string_extension.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _buildBody(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFab(context),
    );
  }

  Center _buildBody(BuildContext context) {
    final primary = context.colorScheme.primary;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildCircle(
              context.colorScheme.primary.withOpacity(0.5), context, 0, 0.2),
          _buildCircle(primary.withOpacity(0.7), context, 0.4, 0.2),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              S.of(context).meditationTimer,
              style: context.textTheme.headlineMedium?.copyWith(),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFab(BuildContext context) {
    return FloatingActionButton.extended(
      icon: const Icon(
        Icons.rocket_launch,
      ),
      label: Text(
        S.of(context).startMeditating,
      ),
      onPressed: () {
        showDurationPickerDialog(context).then((value) {
          if (value != null) {
            context.router.navigate(MeditationTimerSceen(
              duration: value * 60,
            ));
          }
        });
      },
    );
  }

  Widget _buildCircle(
      Color color, BuildContext context, double offsetX, double offsetY) {
    final size = MediaQuery.of(context).size.width * 0.7;

    return Positioned(
      left: MediaQuery.of(context).size.width * offsetX,
      top: MediaQuery.of(context).size.height * offsetY,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Future<int?> showDurationPickerDialog(BuildContext context) async {
    int selectedDuration = 5; // Default to 5 minutes
    return showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Duration'.hardcoded),
            content: SizedBox(
              height: 200,
              width: double.maxFinite,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(initialItem: 4),
                itemExtent: 32.0,
                onSelectedItemChanged: (int value) {
                  selectedDuration = value + 1; // Adjust for 0-index
                },
                children: List<Widget>.generate(60, (int index) {
                  return Center(child: Text('${index + 1} min'));
                }),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  S.of(context).cancel,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(selectedDuration),
                child: Text(S.of(context).accept),
              ),
            ],
          );
        });
  }
}
