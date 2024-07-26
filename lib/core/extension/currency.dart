import 'package:intl/intl.dart';

extension Currency on double {
  String toCurrencyString({int decimalDigits = 0}) {
    final formatter = NumberFormat.currency(
      locale: 'en_US', // US English locale for dot separator
      decimalDigits: decimalDigits,
    );
    return formatter.format(this);
  }
}
