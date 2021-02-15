import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:routine/models/routine.dart';

// CRUD actions
enum RoutineBlocEventAction {
  update,
  delete,
  deleteAll,
}

// event class
class RoutineBlocEvent {
  final RoutineBlocEventAction action;
  final Routine routine;

  RoutineBlocEvent({this.action, this.routine});
}

class RoutineBloc {
  // input stream
  final _inputController = BehaviorSubject<RoutineBlocEvent>();
  Sink<RoutineBlocEvent> get setRoutine => _inputController.sink;

  // output stream
  final _outputController = BehaviorSubject<List<Routine>>();
  Stream<List<Routine>> get getRoutines => _outputController.stream;

  // map
  final _routines = Map<String, Routine>();
  List<Routine> get routines => _routines.values.toList();

  // update routine
  // note: use Routine.copyWith method
  void _updateRoutine(Routine routine) {
    _routines[routine.id] = routine;
  }

  // delete routine
  void _deleteRoutine(Routine routine) {
    _routines.remove(routine.id);
  }

  // delete all
  void _deleteAllRoutine() {
    _routines.clear();
  }

  RoutineBloc() {
    _inputController.stream.listen((event) {
      print(event);
      // switch by action
      if (event.action == RoutineBlocEventAction.update) {
        _updateRoutine(event.routine);
      } else if (event.action == RoutineBlocEventAction.delete) {
        _deleteRoutine(event.routine);
      } else if (event.action == RoutineBlocEventAction.deleteAll) {
        _deleteAllRoutine();
      }

      // stream
      _outputController.sink.add(routines);
    });
  }

  // close stream when state disposed
  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
