import 'dart:convert' show json;

import 'package:flutter/material.dart' show ThemeData;
import 'package:isar/isar.dart';

import '../../../utils/themes/themes.dart';

part 'setting_model.g.dart';

@Collection()
class AppConfig {
  final int id;
  final bool firstRun;
  final int themeIndex;

  AppConfig({
    required this.id,
    this.firstRun = true,
    this.themeIndex = 0, // SelectedTheme.light.index,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstRun': firstRun,
        'themeIndex': themeIndex,
      };

  factory AppConfig.fromMap(Map<String, dynamic> map) => AppConfig(
        id: map['id'] as int,
        firstRun: map['firstRun'] ?? false,
        themeIndex: map['themeIndex']?.toInt() ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppConfig(id: $id, firstRun: $firstRun, theme: ${SelectedTheme.values[themeIndex].name})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppConfig && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  AppConfig copyWith({
    int? id,
    bool? firstRun,
    int? themeIndex,
  }) {
    return AppConfig(
      id: id ?? this.id,
      firstRun: firstRun ?? this.firstRun,
      themeIndex: themeIndex ?? this.themeIndex,
    );
  }
}

extension AppConfigExtension on AppConfig {
  ThemeData get theme => SelectedTheme.values[themeIndex].theme;
}
