import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.trailing,
  });
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      forceMaterialTransparency: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff032250),
              colorScheme.surfaceContainer,
            ],
            stops: const [0.01, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      title: Image.asset(
        'assets/images/header_logo.png',
        width: 130,
        height: 25,
        fit: BoxFit.fill,
      ),
      centerTitle: false,
      actions: [
        const CircleAvatar(
          foregroundImage: AssetImage('assets/images/profile.jpg'),
          maxRadius: 12,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: colorScheme.surface,
            )),
        EndDrawerButton(
          color: colorScheme.surface,
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size(double.infinity, AppBar().preferredSize.height);
}
