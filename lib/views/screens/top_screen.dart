import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routine/blocs/routine_bloc.dart';
import 'package:routine/models/routine.dart';

import 'package:routine/views/widgets/widgets.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routineBloc = Provider.of<RoutineBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: routineBloc.getRoutines,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<Routine>> snapshot,
              ) {
                return ListView.builder(
                  // todo: SingleChildScrollView?
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return RoutineCard(routine: snapshot.data[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
