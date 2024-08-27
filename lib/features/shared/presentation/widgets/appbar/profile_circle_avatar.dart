import 'package:flutter/material.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({
    super.key,
    this.radius,
  });
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: const AssetImage('assets/images/profile.jpg'),
      maxRadius: radius ?? 12,
    );
  }
}
