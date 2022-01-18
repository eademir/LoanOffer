import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'title': 'Kredi Hesaplama',
          'total': 'Toplam Tutar',
          'range': 'Vade Süresi',
          'bottom_line': '₺@total.000 @range Ay Vadeli'
        }
      };
}
