import 'dart:ui';

import 'package:flutter/material.dart';

/// Widget that shows a circular progress indicator with a blur
class CircularProgressIndicatorBlurWidget extends StatelessWidget {
  const CircularProgressIndicatorBlurWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: colorScheme.primary,
            strokeWidth: 4,
          )),
    );
  }
}
