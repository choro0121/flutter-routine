import 'package:flutter/material.dart';
import 'package:routine/models/dayofweek.dart';

class DayOfWeekSelect extends StatefulWidget {
  final DayOfWeek _dayOfWeek;
  DayOfWeekSelect({DayOfWeek dayOfWeek}) : _dayOfWeek = dayOfWeek;

  @override
  _DayOfWeekSelectState createState() => _DayOfWeekSelectState();
}

class _DayOfWeekSelectState extends State<DayOfWeekSelect> {
  @override
  Widget build(BuildContext context) {
    List<Widget> chips = [];

    DayOfWeek.mapString.forEach((key, value) {
      chips.add(ChoiceChip(
        label: Text(value),
        selected: false,
        backgroundColor:
            widget._dayOfWeek.isSet(key) ? Colors.blue : Colors.grey,
        onSelected: (value) {
          setState(() {
            widget._dayOfWeek.toggleDay(key);
          });
        },
      ));
    });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: chips,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () {
                setState(() {
                  widget._dayOfWeek.setDay(DayOfWeek.everyday);
                });
              },
              child: Text('毎日'),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  widget._dayOfWeek.setDay(DayOfWeek.weekday);
                  widget._dayOfWeek.clearDay(DayOfWeek.holiday);
                });
              },
              child: Text('平日のみ'),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  widget._dayOfWeek.setDay(DayOfWeek.holiday);
                  widget._dayOfWeek.clearDay(DayOfWeek.weekday);
                });
              },
              child: Text('休日のみ'),
            ),
          ],
        )
      ],
    );
  }
}
