import 'package:intl/intl.dart';

String priceFormat(num number) {
  NumberFormat formater = NumberFormat('###,###,##0.##');
  return formater.format(number).replaceAll(',', '.');
}

String rateFormat(num number) {
  final NumberFormat formater = NumberFormat('0.0');
  return formater.format(number);
}

const currency = ' ₫';
