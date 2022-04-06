import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleController = TextEditingController();

final category = StateProvider((ref) => ['work', 'school', 'home', 'other']);
final days = StateProvider((ref) => [
      'saturday',
      'sunday',
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday'
    ]);

final dropdownValue = StateProvider((ref) => 'work');
final selectedDay = StateProvider((ref) => 'saturday');
final startTime = StateProvider((ref) => DateTime.now);
