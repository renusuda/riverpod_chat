import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/theme/app_spacing.dart';

extension AppTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
}
