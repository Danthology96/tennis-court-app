import 'package:flutter/material.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  static const name = 'reservation';
  static const path = '/$name';

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int? dropdownValue;
  int selectedHour = TimeOfDay.now().hour;
  int selectedMinute = TimeOfDay.now().minute;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const spacer = SizedBox(height: 20);
    final size = MediaQuery.of(context).size;

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
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(width: 5),
                      Text('Vía Av. Caracas y Av. P. Caroni',
                          style: textTheme.bodySmall),
                    ],
                  ),
                  spacer,
                  Row(
                    children: [
                      /// To set the dropdown un 3/5 of the screen
                      Expanded(
                        flex: 3,
                        child: CustomDropdownButton(
                          contentPadding: const EdgeInsets.all(6),
                          value: dropdownValue,
                          initialValue: 'Agregar instructor',
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text(
                                'Rafael Nadal',
                                style: textTheme.bodyLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text(
                                'Djokovic',
                                style: textTheme.bodyLarge,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text(
                                'Roger Federer',
                                style: textTheme.bodyLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  spacer,
                ],
              ),
            ),
            Container(
              color: colorScheme.surfaceContainerHighest,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Establecer fecha y hora",
                      style: textTheme.titleMedium,
                    ),
                    spacer,
                    const DateSelectorTile(),
                    spacer,
                    Row(
                      children: [
                        Expanded(
                          child: HourSelector(
                            initialValue: 'Hora de inicio',
                            title: 'Hora de inicio',
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10, bottom: 5),
                            items: List<DropdownMenuItem<int>>.generate(
                              24,
                              (int index) {
                                return DropdownMenuItem<int>(
                                  value: index,
                                  enabled: index != 0 ? true : false,
                                  child: Text(
                                    '$index:00',
                                    style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        decoration: index == 0
                                            ? TextDecoration.lineThrough
                                            : null),
                                  ),
                                );
                              },
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: HourSelector(
                            initialValue: 'Hora de fin',
                            title: 'Hora de fin',
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10, bottom: 5),
                            items: List<DropdownMenuItem<int>>.generate(
                              24,
                              (int index) {
                                return DropdownMenuItem<int>(
                                  value: index,
                                  enabled: index != 0 ? true : false,
                                  child: Text(
                                    '$index:00',
                                    style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        decoration: index == 0
                                            ? TextDecoration.lineThrough
                                            : null),
                                  ),
                                );
                              },
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    spacer,
                    Text(
                      "Agregar un comentario",
                      style: textTheme.titleMedium,
                    ),
                    spacer,
                    TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Escribe un comentario',
                        hintStyle: textTheme.bodyMedium,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: colorScheme.surface,
                      ),
                    ),
                    spacer,
                    spacer,
                    CustomFilledButton(
                      onPressed: () {},
                      text: 'Reservar',
                    ),
                  ],
                ),
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
