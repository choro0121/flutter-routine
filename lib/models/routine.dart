import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:routine/models/dayofweek.dart';
import 'package:routine/models/time.dart';

class Routine {
  String id;

  String name;
  Icon icon;
  Color color;
  bool notify;

  DayOfWeek dayOfWeek;
  Time start;
  int duration;

  Routine({
    String id,
    this.name = '',
    Icon icon,
    this.color = Colors.red,
    this.notify = false,
    DayOfWeek dayOfWeek,
    Time start,
    this.duration = 30,
  })  : this.id = id ?? Uuid().v4(),
        this.icon = icon ?? Icon(Icons.ac_unit),
        this.dayOfWeek = dayOfWeek ?? DayOfWeek(),
        this.start = start ?? Time.now();

  Routine copyWith({
    String name,
    Icon icon,
    Color color,
    bool notify,
    DayOfWeek weekOfDay,
    Time start,
    int duration,
  }) {
    return Routine(
      id: this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      notify: notify ?? this.notify,
      dayOfWeek: weekOfDay ?? this.dayOfWeek,
      start: start ?? this.start,
      duration: duration ?? this.duration,
    );
  }

  // compare by id
  @override
  bool operator ==(other) => this.id == other.id;
}
