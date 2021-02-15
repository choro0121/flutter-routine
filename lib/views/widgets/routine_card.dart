import 'package:flutter/material.dart';

import 'package:routine/models/routine.dart';
import 'package:routine/views/screens/edit_screen.dart';

class RoutineCard extends StatelessWidget {
  final Routine _routine;
  RoutineCard({Routine routine}) : _routine = routine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditScreen(
              routine: _routine,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            _routine.icon,
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  _routine.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  _routine.dayOfWeek.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${_routine.start.toString()} ~ ${_routine.start.toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Icon(_routine.notify
                    ? Icons.notifications
                    : Icons.notifications_off)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
