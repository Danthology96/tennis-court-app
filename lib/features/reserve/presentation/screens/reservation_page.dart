import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  static const name = 'reservation';
  static const path = '/$name';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final authCubit = context.watch<AuthCubit>();
    const spacer = SizedBox(height: 20);
    const halfSpacer = SizedBox(height: 10);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ReservationAppbar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reservas',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$25",
                        style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.tertiary),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cancha tipo A', style: textTheme.bodySmall),
                      Text("Por hora",
                          style: textTheme.labelSmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant)),
                    ],
                  ),
                  spacer,
                  const Row(
                    children: [
                      Expanded(child: CourtAvailability()),
                      ClimateWidget(),
                    ],
                  ),
                  spacer,
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
