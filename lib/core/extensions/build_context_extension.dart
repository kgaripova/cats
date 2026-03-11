import 'package:cats/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

final Map<String, DateTime> _snackThrottleByKey = {};

extension ExTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  void showThrottledSnackBar(
    String message, {
    String key = 'default',
    Duration throttle = const Duration(seconds: 2),
  }) {
    final now = DateTime.now();
    final lastShownAt = _snackThrottleByKey[key];
    if (lastShownAt != null && now.difference(lastShownAt) < throttle) {
      return;
    }
    _snackThrottleByKey[key] = now;

    final messenger = ScaffoldMessenger.maybeOf(this);
    if (messenger == null) return;

    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}