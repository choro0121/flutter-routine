class Time {
  int _hour;
  int _minute;

  // getters
  int get hour => _hour;
  int get minute => _minute;

  // setter hour
  set hour(value) {
    assert(value >= 0);

    if (value >= 24) {
      value = value % 24;
    }

    this._hour = value;
  }

  // setter hour
  set minute(value) {
    assert(value >= 0);

    if (value >= 60) {
      value = value % 60;
    }

    this._minute = value;
  }

  // constructor
  Time({
    int hour = 0,
    int minute = 0,
  }) {
    this.hour = hour;
    this.minute = minute;
  }

  // convert to minutes
  int toMinutes() => hour * 60 + minute;

  // from minutes
  static Time fromMinutes(int minutes) =>
      Time(hour: (minutes / 60).floor(), minute: minutes % 60);

  // to string 0 padding format
  String toString() =>
      '${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}';

  // from DateTime class
  static Time fromDateTime(DateTime dateTime) =>
      Time(hour: dateTime.hour, minute: dateTime.minute);

  // to DateTime class, year/month/day is dummy
  DateTime toDateTime() => DateTime(2000, 1, 1, hour, minute);

  // from current time
  static Time now() => Time.fromDateTime(DateTime.now());

  // check type and parse to minutes
  int _operatorTypeCheckParseMinutes(dynamic value) {
    int minutes;

    if (value is int) {
      minutes = value;
    } else if (value is Time) {
      minutes = value.toMinutes();
    } else {
      assert(false);
    }

    return minutes;
  }

  // operate -, int or Time
  Time operator -(other) => Time.fromMinutes(
      this.toMinutes() - _operatorTypeCheckParseMinutes(other));

  // operate +, int or Time
  Time operator +(other) => Time.fromMinutes(
      this.toMinutes() + _operatorTypeCheckParseMinutes(other));

  // operate ==, int or Time
  @override
  bool operator ==(other) =>
      this.toMinutes() == _operatorTypeCheckParseMinutes(other);
}
