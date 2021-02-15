import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routine/blocs/routine_bloc.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routineBloc = Provider.of<RoutineBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('設定'),
        ),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              routineBloc.setRoutine.add(
                RoutineBlocEvent(
                  action: RoutineBlocEventAction.deleteAll,
                ),
              );
            },
            child: Text('全削除'),
          )
        ],
      ),
    );
  }
}
