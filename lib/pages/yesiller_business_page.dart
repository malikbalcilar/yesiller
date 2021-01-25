import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yesiller/widgets/kaliparka.dart';

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
    await Future.delayed(Duration(milliseconds: 150));
    setState(() {
      animated = (true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return KalipArka(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text(
              "HAKKIMIZDA",
              style: TextStyle(color: Colors.white, fontSize: 29),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              height: 1,
              width: 185,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "’Kömürde İç Anadolu’nun lideri’’\n1970 yılında kurulan Yeşiller Kömür, İç Anadolu bölgesinde birinci kuşak tarafından yönetildi. Meram bölgesinde eski sanayi içerisinde faaliyet gösteren firma, azim temeli ile yol aldı. 1970 yılı ve sonrasında ikinci kuşak zamanı ile kararlılık gösteren Yeşiller, yeni görüş açıları, sektör haline gelen ticaret zamanı, sağlam adım ve memnuniyet ısrarı ile sektörde kararlılığını gösterdi. İkinci kuşak ve sonrasında ise, ekonomik, kalite, doğru zamanda doğru ürün istikametinde ilke görerek çalışmalarını sürdürdü. Üçüncü kuşak ile yoluna devam ederek, emin adımlarla ilerleme kayıt edip, ürün yelpazesini müşteri taleplerine göre ve sektör gereksinimleri doğrultusunda genişleterek sektörde öncü kuruluş ünvanını almış oldu. Merkezi ısıtma sistemleri ve kat kontrol ısıtma sistemleri ile de hizmet alanında hem istihdam hem de memnuniyet sağlıyor. 1970 yılında atılan ilk adım, bugün İç Anadolu bölgesine hakim bir adımdır.\n\nDünyaca ünlü markalarla ortak çalışmalar başlatan YASİN YEŞİL Yeşiller Kuruluşu, Konya ve çevresine hizmeti Şubeleri ve Bayileri ile ulaştırdı. Her zaman yeni adımlar için hazırlanan Yeşiller Kömür, ARGE aşaması tamamlanmış projeleri halka sunuyor. Merkez bünyesinde sevkiyat ve koordinasyon merkezine sahip olup 1000 m2 alanda hizmet veren Yeşiller Kömür, Şube ve Bayii taleplerini de en hızlı şekilde tamamlıyor. Geniş araç filo sistemi ile kısa zamanda çözüm üreten Yeşiller Kömür, Merkez ofisiyle daima müşteri ziyaretlerine açık olup Cumartesi/Pazar günleri de destek vermeye devam ediyor.\n\nÇEVRE DOSTU KÖMÜR\nİlkesi ve kalitesi ile “çevre dostu kömür” hizmeti veren bir firma olarak isim yapan Yeşiller Kömür, Türkiye Cumhuriyeti Anayasası’nın “Herkes sağlıklı ve dengeli bir çevrede yaşama hakkına sahiptir. Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek devletin ve vatandaşın ödevidir.”diyen 56. maddesini dikkate alarak yaptığı hizmetler ile tüketicilere yıllardır sağlıklı, kaliteli ve çevre dostu kömür sunuyor.",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    ));
    return Scaffold(
      backgroundColor: Color(0xFF012418),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.topLeft,
              children: [
                Positioned(
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "lo.jpg",
                      repeat: ImageRepeat.repeat,
                    ),
                  ),
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: BackdropFilter(
                      child: Container(
                        width: size.width,
                        height: size.height,
                      ),
                      filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25)),
                  left: 0,
                  height: 0,
                  top: 0,
                  width: 0,
                ),
                AnimatedPositioned(
                  left: animated ? 0 : 40,
                  bottom: 0,
                  right: animated ? 0 : -40,
                  top: 0,
                  duration: Duration(milliseconds: 1630),
                  curve: Curves.easeInOutCubic,
                  child: AnimatedOpacity(
                    opacity: animated ? 1 : 0,
                    duration: Duration(milliseconds: 3000),
                    curve: Curves.easeInOutCubic,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HAKKIMIZDA",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 29),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Colors.white,
                              height: 1,
                              width: 185,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "’Kömürde İç Anadolu’nun lideri’’\n1970 yılında kurulan Yeşiller Kömür, İç Anadolu bölgesinde birinci kuşak tarafından yönetildi. Meram bölgesinde eski sanayi içerisinde faaliyet gösteren firma, azim temeli ile yol aldı. 1970 yılı ve sonrasında ikinci kuşak zamanı ile kararlılık gösteren Yeşiller, yeni görüş açıları, sektör haline gelen ticaret zamanı, sağlam adım ve memnuniyet ısrarı ile sektörde kararlılığını gösterdi. İkinci kuşak ve sonrasında ise, ekonomik, kalite, doğru zamanda doğru ürün istikametinde ilke görerek çalışmalarını sürdürdü. Üçüncü kuşak ile yoluna devam ederek, emin adımlarla ilerleme kayıt edip, ürün yelpazesini müşteri taleplerine göre ve sektör gereksinimleri doğrultusunda genişleterek sektörde öncü kuruluş ünvanını almış oldu. Merkezi ısıtma sistemleri ve kat kontrol ısıtma sistemleri ile de hizmet alanında hem istihdam hem de memnuniyet sağlıyor. 1970 yılında atılan ilk adım, bugün İç Anadolu bölgesine hakim bir adımdır.\n\nDünyaca ünlü markalarla ortak çalışmalar başlatan YASİN YEŞİL Yeşiller Kuruluşu, Konya ve çevresine hizmeti Şubeleri ve Bayileri ile ulaştırdı. Her zaman yeni adımlar için hazırlanan Yeşiller Kömür, ARGE aşaması tamamlanmış projeleri halka sunuyor. Merkez bünyesinde sevkiyat ve koordinasyon merkezine sahip olup 1000 m2 alanda hizmet veren Yeşiller Kömür, Şube ve Bayii taleplerini de en hızlı şekilde tamamlıyor. Geniş araç filo sistemi ile kısa zamanda çözüm üreten Yeşiller Kömür, Merkez ofisiyle daima müşteri ziyaretlerine açık olup Cumartesi/Pazar günleri de destek vermeye devam ediyor.\n\nÇEVRE DOSTU KÖMÜR\nİlkesi ve kalitesi ile “çevre dostu kömür” hizmeti veren bir firma olarak isim yapan Yeşiller Kömür, Türkiye Cumhuriyeti Anayasası’nın “Herkes sağlıklı ve dengeli bir çevrede yaşama hakkına sahiptir. Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek devletin ve vatandaşın ödevidir.”diyen 56. maddesini dikkate alarak yaptığı hizmetler ile tüketicilere yıllardır sağlıklı, kaliteli ve çevre dostu kömür sunuyor.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 60,
            alignment: Alignment.centerRight,
            color: const Color(0xFF012418),
            child: Container(
              color: Colors.black.withOpacity(0.8),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.centerRight,
              child: Container(
                height: 60,
                width: 280,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.transparent
                ], stops: const [
                  0.53,
                  1
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 60,
                  width: 120,
                  child: Image.asset(
                    "assets/logoyeni.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

///
/// Burada birşey
/// Gitte son
