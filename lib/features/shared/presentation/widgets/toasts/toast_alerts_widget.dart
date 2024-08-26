import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/shared/presentation/widgets/toasts/circular_progress_indicator_blur_widget.dart';

/// This is the type of alert that will be shown in the app (info, success, error, loading)
/// - [type] represent which type of alert ([AlertType]) will be shown
/// - [message] if you want to display a message below the alert
/// - [context] is only for theme colors, there is no need to bring em in
/// - [duration] is the time that the alert will be shown
Function() customToastAlerts({
  required AlertType type,
  String? message,
  BuildContext? context,
  Duration? duration,
}) {
  if (type == AlertType.loading) {
    return _alertLoading(context: context, message: message);
  } else {
    return _customAlert(
        context: context, message: message, type: type, duration: duration);
  }
}

/// This is the alert that will be shown in the app (info, success, error)
Function() _customAlert(
    {BuildContext? context,
    String? message,
    required AlertType type,
    Duration? duration}) {
  return BotToast.showCustomNotification(
      duration: duration ?? const Duration(milliseconds: 2500),
      toastBuilder: (cancelFunc) => _CustomAlertWidget(
            cancelFunc: cancelFunc,
            message: message,
            alertType: type,
          ));
}

Function() _alertLoading({BuildContext? context, String? message}) {
  return BotToast.showCustomLoading(
      useSafeArea: false,
      backgroundColor: Colors.black.withOpacity(0),
      toastBuilder: (cancelFunc) =>
          _CustomAlertLoadingWidget(cancelFunc: cancelFunc));
}

class _CustomAlertWidget extends StatelessWidget {
  const _CustomAlertWidget(
      {required this.cancelFunc, this.message, required this.alertType});
  final CancelFunc cancelFunc;
  final String? message;
  final AlertType alertType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: colorScheme.primary,
    );

    Color cardColor = colorScheme.surfaceContainerHighest;

    /// This is the color of the alert, it depends on the type of alert
    switch (alertType) {
      case AlertType.info:
        cardColor = colorScheme.surfaceContainerHighest;
        break;
      case AlertType.success:
        cardColor = colorScheme.secondaryContainer;
        break;
      case AlertType.error:
        cardColor = colorScheme.error;
        break;
      default:
        cardColor = colorScheme.error;
        break;
    }

    /// This is the alert widget, it is a card with a message inside
    return SizedBox(
      width: size.width * 0.8,
      child: Card(
          elevation: 4,
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              message ?? "",
              style: textStyle,
            ),
          )),
    );
  }
}

Future<void> closeLoadingScreen() async {
  /// to simulate a loading time
  await Future.delayed(const Duration(seconds: 2));

  /// to remove the loading screen
  BotToast.closeAllLoading();
}

/// This is the loading alert, it is a bit different from the others
/// because it has a circular progress indicator
class _CustomAlertLoadingWidget extends StatelessWidget {
  const _CustomAlertLoadingWidget({required this.cancelFunc});
  final CancelFunc cancelFunc;

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicatorBlurWidget();
  }
}
