import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routine/blocs/routine_bloc.dart';
import 'package:routine/models/routine.dart';

import 'package:routine/views/screens/edit_screen.dart';
import 'package:routine/views/widgets/widgets.dart';

import 'package:routine/store/routine.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routineBloc = Provider.of<RoutineBloc>(context);
    final routines = context.select((RoutineStore store) => store.routines);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('習慣'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // create new routine
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditScreen(routine: Routine()),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
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
    );
  }
}
