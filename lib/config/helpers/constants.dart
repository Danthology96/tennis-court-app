import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/helpers/enums.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

const appPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const appPaddingHorizontal = EdgeInsets.symmetric(horizontal: 20);

/// Default courts for the app, used when the app is first opened.
List<Court> defaultCourts = [
  Court(
    id: '1',
    name: 'Epic Box',
    courtType: CourtType.A,
    pricePerHour: 10.0,
    latLngLocation:
        LatLng(latitude: 6.252472222222222, longitude: -75.56533333333333),
    address: 'Vía Av. Caracas y Av. P. Caroni',
    instructors: ['Mark Gonzales', 'Pedro Escamoso'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-1.jpg',
      'assets/images/tennis-court-2.jpg'
    ],
  ),
  Court(
    id: '2',
    name: 'Sports Box',
    courtType: CourtType.B,
    pricePerHour: 15.0,
    latLngLocation: LatLng(latitude: 37.7749, longitude: -122.4194),
    address: 'San Francisco, CA',
    instructors: ['Mark Suckerberg', 'Celline Dion'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-2.jpg',
      'assets/images/tennis-court-3.jpg'
    ],
  ),
  Court(
    id: '3',
    name: 'Miami Court',
    courtType: CourtType.C,
    pricePerHour: 20.0,
    latLngLocation:
        LatLng(latitude: 36.12150075834208, longitude: -115.16177626786619),
    address: 'Sphere, 255 Sands Ave, Las Vegas',
    instructors: ['Peter', 'Doe'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-1.jpg',
      'assets/images/tennis-court-3.jpg'
    ],
  ),
  Court(
    id: '4',
    name: 'Empire State Court',
    courtType: CourtType.A,
    pricePerHour: 50.0,
    latLngLocation:
        LatLng(latitude: 40.748740628063636, longitude: -73.98536996364564),
    address: 'Empire State Building, 20 W 34th St, New York',
    instructors: ['Federer', 'Nadal'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-1.jpg',
      'assets/images/tennis-court-2.jpg'
    ],
  ),
];

const iconsServerUrl = 'https://openweathermap.org/img/wn/';
