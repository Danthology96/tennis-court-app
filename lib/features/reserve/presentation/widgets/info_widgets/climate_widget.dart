import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClimateWidget extends StatelessWidget {
  const ClimateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/rainy_icon.svg',
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 5),
        const Text(
          '100%',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
