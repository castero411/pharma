// provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this is the provider for the switches widgets
final switchProvider = StateProvider<bool>((ref) => false);
final displaySwitchProvider = StateProvider<bool>((ref) => false);

//this is the provider for the medicine widgets
final selectedPeriodsProvider = StateProvider<List<String>>((ref) => []);

// this is the provider for the time picker
final timeProvider = StateProvider<TimeOfDay>((ref) => TimeOfDay.now());
final dateProvider = StateProvider<DateTime>((ref) => DateTime.now());

//used in updating gender data
final genderProvider = StateProvider<String>((ref) => 'male');

final medicineTypeProvider = StateProvider<String>((ref) => 'pills');

final hoursMethodProvider =
    StateProvider<bool>((ref) => false); //fasle = days, true = hours
