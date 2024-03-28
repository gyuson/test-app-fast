import 'package:intl/intl.dart';

extension DateTimeEdxtension on DateTime {
  String get formatDateTimeShort =>
      DateFormat().add_yMMMd().add_Hm().format(toLocal());

  String get formatDateTimeFull => DateFormat().format(toLocal());

  String get formatTime => DateFormat('HH:mm').format(toLocal());
}
