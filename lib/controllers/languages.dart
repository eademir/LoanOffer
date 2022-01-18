import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'title': 'Kredi Hesaplama',
          'total': 'Toplam Tutar',
          'range': 'Vade Süresi',
          'bottom_line': '₺@total.000 @range Ay Vadeli',
          'oran': 'Oran',
          'aylik_taksit': 'Aylık Taksit',
          'maliyet': 'Maliyet',
          'toplammdu': 'Toplam Maliyete Dahil Olan Ücretler',
          'kredi': 'Kredi',
          'kreditahsilat': 'Kredi Tahsil Ücreti',
          'faiztut': 'Toplam Faiz Miktarı',
          'toplam': 'Toplam Maliyet',
          'yıllıkmaliyet': 'Yıllık Maliyet Oranı',
        }
      };
}
