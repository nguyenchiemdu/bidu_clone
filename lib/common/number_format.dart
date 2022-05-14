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

extension Parser on String {
  bool isInteger() {
    if (int.tryParse(this) == null) {
      return false;
    }
    return true;
  }

  int? toInt() {
    return int.tryParse(this);
  }
}

const currency = ' ₫';
