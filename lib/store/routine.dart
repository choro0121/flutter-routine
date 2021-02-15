import 'package:flutter/material.dart';

import 'package:routine/models/routine.dart';

class RoutineStore with ChangeNotifier {
  final _routines = Map<String, Routine>();
  List<Routine> get routines => _routines.values.toList();

  void add(Routine routine) {
    _routines[routine.id] = routine;
    notifyListeners();
  }

  void update(Routine routine) {
    _routines[routine.id] = routine;
    notifyListeners();
  }

  void delete(Routine routine) {
    _routines.remove(routine.id);
    notifyListeners();
  }
}
