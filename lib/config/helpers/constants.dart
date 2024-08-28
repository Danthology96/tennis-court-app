import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/helpers/enums.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

const appPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const appPaddingHorizontal = EdgeInsets.symmetric(horizontal: 20);

List<Court> defaultCourts = [
  Court(
    id: '1',
    name: 'Court 1',
    courtType: CourtType.A,
    pricePerHour: 10.0,
    latLngLocation:
        LatLng(latitude: 6.252472222222222, longitude: -75.56533333333333),
    address: 'San Francisco, CA',
    instructors: ['Instructor 1', 'Instructor 2'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-1.jpg',
      'assets/images/tennis-court-2.jpg'
    ],
  ),
  Court(
    id: '2',
    name: 'Court 2',
    courtType: CourtType.B,
    pricePerHour: 15.0,
    latLngLocation: LatLng(latitude: 37.7749, longitude: -122.4194),
    address: 'San Francisco, CA',
    instructors: ['Instructor 1', 'Instructor 2'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-2.jpg',
      'assets/images/tennis-court-3.jpg'
    ],
  ),
  Court(
    id: '3',
    name: 'Court 3',
    courtType: CourtType.C,
    pricePerHour: 20.0,
    latLngLocation: LatLng(latitude: 37.7749, longitude: -122.4194),
    address: 'San Francisco, CA',
    instructors: ['Instructor 1', 'Instructor 2'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-1.jpg',
      'assets/images/tennis-court-3.jpg'
    ],
  ),
  Court(
    id: '4',
    name: 'Court 4',
    courtType: CourtType.A,
    pricePerHour: 25.0,
    latLngLocation: LatLng(latitude: 37.7749, longitude: -122.4194),
    address: 'San Francisco, CA',
    instructors: ['Instructor 1', 'Instructor 2'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-1.jpg',
      'assets/images/tennis-court-2.jpg'
    ],
  ),
  Court(
    id: '5',
    name: 'Court 5',
    courtType: CourtType.B,
    pricePerHour: 30.0,
    latLngLocation: LatLng(latitude: 37.7749, longitude: -122.4194),
    address: 'San Francisco, CA',
    instructors: ['Instructor 1', 'Instructor 2'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-1.jpg',
      'assets/images/tennis-court-3.jpg'
    ],
  ),
  Court(
    id: '6',
    name: 'Court 6',
    courtType: CourtType.C,
    pricePerHour: 35.0,
    latLngLocation: LatLng(latitude: 37.7749, longitude: -122.4194),
    address: 'San Francisco, CA',
    instructors: ['Instructor 1', 'Instructor 2'],
    reservations: [1, 2],
    imagePaths: [
      'assets/images/tennis-court-2.jpg',
      'assets/images/tennis-court-3.jpg'
    ],
  ),
];

const iconsServerUrl = 'https://openweathermap.org/img/wn/';
