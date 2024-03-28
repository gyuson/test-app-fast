import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/common/widgets/default_text_field.dart';
import 'package:fast_flutter_template/common/widgets/errors/data_scaffold.dart';
import 'package:fast_flutter_template/features/authentication/providers/user_provider.dart';
import 'package:fast_flutter_template/features/settings/views/providers/edit_profile_controller.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final nameController =
        useTextEditingController(text: user.asData?.value.displayName ?? '');

    final pickedFile = useState<XFile?>(null);
    final imageUrl = user.asData?.value.photoURL;

    final editProfileController = ref.watch(editProfileControllerProvider);

    return DataScaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        actions: [
          TextButton(
            onPressed: editProfileController.isLoading
                ? null
                : () {
                    ref.read(editProfileControllerProvider.notifier).save(
                          pickedFile.value?.path,
                          nameController.text,
                        );
                  },
            child: Text(
              S.of(context).save,
            ),
          ),
        ],
      ),
      value: ref.watch(editProfileControllerProvider),
      onData: (data) => ListView(
        padding: defaultListPadding,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImage(pickedFile, imageUrl, context),
              TextButton(
                  child: Text(S.of(context).updateImage),
                  onPressed: () async {
                    pickedFile.value = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                  }),
            ],
          ),
          verticalSpace20,
          DefaultTextField(
            controller: nameController,
            hintText: S.of(context).name,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  GestureDetector _buildImage(ValueNotifier<XFile?> pickedFile,
      String? imageUrl, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        pickedFile.value =
            await ImagePicker().pickImage(source: ImageSource.gallery);
      },
      child: CircleAvatar(
        radius: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: pickedFile.value?.path != null
              ? Image.file(
                  File(pickedFile.value?.path ?? ''),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                )
              : imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    )
                  : Icon(
                      Icons.person,
                      size: 80,
                      color: context.colorScheme.onBackground,
                    ),
        ),
      ),
    );
  }
}
