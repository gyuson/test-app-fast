import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/features/authentication/providers/firebase_auth_repository.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

void handleAuthErrors(
    AsyncValue? previous, AsyncValue next, BuildContext context) {
  if (next is AsyncError && next.error is AuthException) {
    String error = S.of(context).generalErrorMessage;
    if (next.error is InvalidCredentialsException) {
      error = S.of(context).authErrorInvalidCredentials;
    }
    if (next.error is TooManyRequestsException) {
      error = S.of(context).authErrorTooManyRequests;
    }
    if (next.error is EmailAlreadyInUseException) {
      error = S.of(context).authErrorEmailAlreadyInUse;
    }
    if (next.error is WeakPasswordException) {
      error = S.of(context).authErrorWeakPassword;
    }
    error;

    context.showSnackBar(error);
  }
}
