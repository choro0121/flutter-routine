import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:routine/blocs/routine_bloc.dart';
import 'package:routine/models/routine.dart';
import 'package:routine/models/time.dart';

import 'package:routine/views/widgets/widgets.dart';

class EditScreen extends StatefulWidget {
  final Routine routine;

  EditScreen({Routine routine}) : this.routine = routine.copyWith();

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    final routineBloc = Provider.of<RoutineBloc>(context);

    // check exist routine item
    bool exists = routineBloc.routines.contains(widget.routine);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Visibility(
            visible: exists,
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                routineBloc.setRoutine.add(
                  RoutineBlocEvent(
                    action: RoutineBlocEventAction.delete,
                    routine: widget.routine,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ),
          FlatButton(
            child: Text(
              exists ? '変更' : '追加',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              routineBloc.setRoutine.add(
                RoutineBlocEvent(
                  action: RoutineBlocEventAction.update,
                  routine: widget.routine,
                ),
              );
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'todo: 時計を見ながら入力したい。そもそも別ページじゃなくてトップページで追加や編集ができたらいいんじゃないか。そうするとボトムバーはいらない。'),
          TextFormField(
            initialValue: widget.routine.name,
            onChanged: (value) {
              widget.routine.name = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              hintText: "習慣の名前",
            ),
          ),
          DayOfWeekSelect(
            dayOfWeek: widget.routine.dayOfWeek,
          ),
          FlatButton(
            onPressed: () {
              DatePicker.showTimePicker(
                context,
                showTitleActions: false,
                showSecondsColumn: false,
                currentTime: widget.routine.start.toDateTime(),
                onChanged: (dateTime) {
                  setState(() {
                    widget.routine.start = Time.fromDateTime(dateTime);
                  });
                },
              );
            },
            child: Text(
              '開始時間 ${widget.routine.start.toString()}',
            ),
          ),
          FlatButton(
            onPressed: () {
              DatePicker.showTimePicker(
                context,
                showTitleActions: false,
                showSecondsColumn: false,
                currentTime:
                    Time.fromMinutes(widget.routine.duration).toDateTime(),
                onChanged: (dateTime) {
                  setState(() {
                    widget.routine.duration =
                        Time.fromDateTime(dateTime).toMinutes();
                  });
                },
              );
            },
            child: Text(
              '時間 ${widget.routine.duration.toString()}分',
            ),
          ),
          CheckboxListTile(
            value: widget.routine.notify,
            onChanged: (value) {
              setState(() {
                widget.routine.notify = value;
              });
            },
            title: Text('通知'),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}
