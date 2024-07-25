import 'package:intl/intl.dart';

extension DateTimeUtil on DateTime {
  String get vietnameseBeautifulDate {
    final List<String> weekdays = [
      'Thứ Hai',
      'Thứ Ba',
      'Thứ Tư',
      'Thứ Năm',
      'Thứ Sáu',
      'Thứ Bảy',
      'Chủ Nhật',
    ];
    final String weekday = weekdays[this.weekday - 1];
    final String day = this.day.toString().padLeft(2, '0');
    final String month = this.month.toString().padLeft(2, '0');
    final String year = this.year.toString();
    return '$weekday, $day/$month/$year';
  }

  String get completeVietnameseDate {
    final hours = hour.toString().padLeft(2, '0');
    final String day = this.day.toString().padLeft(2, '0');
    final String month = this.month.toString().padLeft(2, '0');
    final String year = this.year.toString();
    return '$hours giờ, $day/$month/$year';
  }

  String get beautifulDate {
    return DateFormat.yMMMMd().format(this);
    // July 14, 2023
  }

  String get yearMonthDay {
    return DateFormat('yyyy-MM-dd').format(this);
    // 2023-01-29
  }

  String get timeFirstDateAfter {
    return '$hourMinute, $beautifulDate';
    // 23:59, July 14, 2023
  }

  String get dateInSchedule {
    return '$weekDay ($beautifulDate)';
    // Tuesday (January 29, 2002)
  }

  String get hourMinute {
    return DateFormat('HH:mm').format(this);
    // 23:59
  }

  String get weekDay {
    return DateFormat('EEEE').format(this);
    // 1,2,3,4,5,6,7
  }

  DateTime get firstDayOfWeek {
    return subtract(Duration(days: weekday - 1));
  }

  DateTime get lastDayOfWeek {
    return firstDayOfWeek.add(const Duration(days: 6));
  }

  DateTime get firstDayOfNextWeek {
    return add(const Duration(days: 7)).firstDayOfWeek;
  }

  List<DateTime> get weekDates {
    return List.generate(
      7,
      (index) => firstDayOfWeek.add(
        Duration(days: index),
      ),
    );
  }

  bool get isWorkingDay {
    return weekday < 6;
  }

  DateTime get lastDateOfYear {
    return DateTime(year, 12, 31);
  }

  DateTime get withoutTime {
    return DateTime(year, month, day);
  }
}

extension DateTimeStringUtil on String {
  bool get isValidHourMinuteFormat {
    RegExp exp = RegExp(r"^\d{2}:\d{2}$");
    return exp.hasMatch(this);
  }

  DateTime dateTimeFromHourMinute(DateTime dateTime) {
    List<String> parts = split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return DateTime(dateTime.year, dateTime.month, dateTime.day, hour, minute);
  }
}

extension EpochTime on int? {
  DateTime get dateTime {
    return (this == null)
        ? DateTime.utc(1970)
        : DateTime.fromMillisecondsSinceEpoch(this!);
  }
}
