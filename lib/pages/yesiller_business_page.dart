import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/kaliparka.dart';

///
class YesillerBusinessPage extends StatefulWidget {
  ///
  const YesillerBusinessPage({Key key}) : super(key: key);

  @override
  _YesillerBusinessPageState createState() => _YesillerBusinessPageState();
}

class _YesillerBusinessPageState extends State<YesillerBusinessPage> {
  @override
  void initState() {
    animate();
    super.initState();
  }

  bool animated = false;

  Future<void> animate() async {
    await Future.delayed(const Duration(milliseconds: 150));
    setState(() {
      animated = (true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return KalipArka(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "HAKKIMIZDA",
              style: TextStyle(color: Colors.white, fontSize: 29),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              height: 1,
              width: 185,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "’Kömürde İç Anadolu’nun lideri’’\n1970 yılında kurulan Yeşiller Kömür, İç Anadolu bölgesinde birinci kuşak tarafından yönetildi. Meram bölgesinde eski sanayi içerisinde faaliyet gösteren firma, azim temeli ile yol aldı. 1970 yılı ve sonrasında ikinci kuşak zamanı ile kararlılık gösteren Yeşiller, yeni görüş açıları, sektör haline gelen ticaret zamanı, sağlam adım ve memnuniyet ısrarı ile sektörde kararlılığını gösterdi. İkinci kuşak ve sonrasında ise, ekonomik, kalite, doğru zamanda doğru ürün istikametinde ilke görerek çalışmalarını sürdürdü. Üçüncü kuşak ile yoluna devam ederek, emin adımlarla ilerleme kayıt edip, ürün yelpazesini müşteri taleplerine göre ve sektör gereksinimleri doğrultusunda genişleterek sektörde öncü kuruluş ünvanını almış oldu. Merkezi ısıtma sistemleri ve kat kontrol ısıtma sistemleri ile de hizmet alanında hem istihdam hem de memnuniyet sağlıyor. 1970 yılında atılan ilk adım, bugün İç Anadolu bölgesine hakim bir adımdır.\n\nDünyaca ünlü markalarla ortak çalışmalar başlatan YASİN YEŞİL Yeşiller Kuruluşu, Konya ve çevresine hizmeti Şubeleri ve Bayileri ile ulaştırdı. Her zaman yeni adımlar için hazırlanan Yeşiller Kömür, ARGE aşaması tamamlanmış projeleri halka sunuyor. Merkez bünyesinde sevkiyat ve koordinasyon merkezine sahip olup 1000 m2 alanda hizmet veren Yeşiller Kömür, Şube ve Bayii taleplerini de en hızlı şekilde tamamlıyor. Geniş araç filo sistemi ile kısa zamanda çözüm üreten Yeşiller Kömür, Merkez ofisiyle daima müşteri ziyaretlerine açık olup Cumartesi/Pazar günleri de destek vermeye devam ediyor.\n\nÇEVRE DOSTU KÖMÜR\nİlkesi ve kalitesi ile “çevre dostu kömür” hizmeti veren bir firma olarak isim yapan Yeşiller Kömür, Türkiye Cumhuriyeti Anayasası’nın “Herkes sağlıklı ve dengeli bir çevrede yaşama hakkına sahiptir. Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek devletin ve vatandaşın ödevidir.”diyen 56. maddesini dikkate alarak yaptığı hizmetler ile tüketicilere yıllardır sağlıklı, kaliteli ve çevre dostu kömür sunuyor.",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    ));
  }
}

///
/// Burada birşey
/// Gitte son
