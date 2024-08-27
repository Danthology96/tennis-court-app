import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const name = 'home';
  static const path = '/$name';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authCubit = context.watch<AuthCubit>();
    const spacer = SizedBox(height: 20);
    return Scaffold(
      key: scaffoldKey,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: appPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hola ${authCubit.state.user?.names.split(' ')[0]}!",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
              spacer,
              const CourtsHorizontalListView(),
            ],
          ),
        ),
      ),
      endDrawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class CourtsHorizontalListView extends StatelessWidget {
  const CourtsHorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return const ReserveCard();
        },
      ),
    );
  }
}

class ReserveCard extends StatelessWidget {
  const ReserveCard({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 10);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final captionTheme =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400);
    return Card(
      color: colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Image
          SizedBox(
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/tennis-court-1.jpg',
                height: 130,
                fit: BoxFit.fill,
              ),
            ),
          ),
          spacer,

          /// content
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Cancha de tenis',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
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
                    ),
                  ],
                ),
                Text('Cancha tipo A', style: captionTheme),
                spacer,
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 13,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '9 de julio 2024',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: captionTheme,
                    ),
                  ],
                ),
                spacer,
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Disponible',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: captionTheme,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme.tertiary),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time_outlined,
                            size: 13,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '10:00 am a 12:00pm',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: captionTheme,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                spacer,
                spacer,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomFilledButton(
                    onPressed: () {},
                    height: 32,
                    text: 'Reservar',
                    textStyle: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
