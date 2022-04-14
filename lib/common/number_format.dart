import 'package:intl/intl.dart';

String priceFormnat(num number) {
  NumberFormat formater = NumberFormat('###,###,##0.##');
  return formater.format(number).replaceAll(',', '.');
}
