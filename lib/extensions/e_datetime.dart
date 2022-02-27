import 'package:intl/intl.dart';

extension EDateTime on DateTime {
  String toFormat({String patten = 'EEE'}) {
    return DateFormat(patten).format(this);
  }
}
