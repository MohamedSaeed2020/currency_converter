import 'package:intl/intl.dart';

extension DateFormattingExtensions on DateTime {
  String formatDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
