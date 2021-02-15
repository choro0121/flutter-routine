import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routine/blocs/routine_bloc.dart';
import 'package:routine/models/routine.dart';

class RoutineView extends StatelessWidget {
  final Routine _routine;
  RoutineView({Routine routine}) : _routine = routine;

  @override
  Widget build(BuildContext context) {
    final routineBloc = Provider.of<RoutineBloc>(context);

    return Container();
  }
}
