import 'package:intl/intl.dart';

extension Formater on num {
  String priceFormat() {
    NumberFormat formater = NumberFormat('###,###,##0.##');
    return formater.format(this).replaceAll(',', '.');
  }

  String rateFormat() {
    final NumberFormat formater = NumberFormat('0.0');
    return formater.format(this);
  }
}

const currency = ' ₫';
