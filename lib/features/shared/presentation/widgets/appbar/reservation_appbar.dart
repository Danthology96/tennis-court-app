import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/shared/presentation/presentation.dart';

class ReservationAppbar extends StatelessWidget {
  const ReservationAppbar({super.key, this.images});

  final List<String>? images;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return SliverAppBar(
        expandedHeight: size.height * 0.4,
        leadingWidth: 100,
        pinned: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: Stack(
          children: [
            Positioned(
              top: 5,
              left: 20,
              child: BackArrow(
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
        flexibleSpace: (images == null)
            ? null
            : FlexibleSpaceBar(
                titlePadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                background: Stack(
                  children: [
                    Swiper(
                      viewportFraction: 1,
                      scale: 0.9,
                      autoplay: true,
                      itemCount: images?.length ?? 0,
                      pagination: SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                            color: colorScheme.surface.withOpacity(0.6),
                            activeColor: colorScheme.secondary,
                          )),
                      itemBuilder: (context, index) {
                        return FadeInImage(
                          placeholder: const AssetImage(
                            "assets/images/no-image.png",
                          ),
                          placeholderFit: BoxFit.cover,
                          image: AssetImage(
                            images![index],
                          ),
                          fit: BoxFit.cover,
                        );
                      },
                      fade: 0.1,
                    ),
                  ],
                ),
              ));
  }
}
