class DayOfWeek {
  static const int sunday = 1 << DateTime.sunday;
  static const int monday = 1 << DateTime.monday;
  static const int tuesday = 1 << DateTime.tuesday;
  static const int wednesday = 1 << DateTime.wednesday;
  static const int thursday = 1 << DateTime.thursday;
  static const int friday = 1 << DateTime.friday;
  static const int saturday = 1 << DateTime.saturday;

  static const int weekday = monday | tuesday | wednesday | thursday | friday;
  static const int holiday = sunday | saturday;
  static const int everyday = weekday | holiday;

  static const Map<int, String> mapString = {
    sunday: '日',
    monday: '月',
    tuesday: '火',
    wednesday: '水',
    thursday: '木',
    friday: '金',
    saturday: '土',
  };

  int _days;
  int get days => _days;

  bool isSet(int days) => (_days & days) == days;
  bool isWeekday() => isSet(weekday);
  bool isHoliday() => isSet(holiday);
  bool isEveryday() => isSet(everyday);

  static DayOfWeek parseFromDateTime(DateTime dt) {
    return DayOfWeek(1 << dt.weekday);
  }

  DayOfWeek([int days = 0]) {
    _days = days;
  }

  void setDay(int day) {
    _days |= day;
  }

  void clearDay(int day) {
    _days &= ~day;
  }

  void toggleDay(int day) {
    _days ^= day;
  }

  List<String> getStringList() {
    List<String> list = [];

    mapString.forEach((key, value) {
      if (isSet(key)) {
        list.add(value);
      }
    });

    return list;
  }

  @override
  String toString() {
    return getStringList().toString();
  }
}
