import 'package:flutter/material.dart';
import 'package:untitled3/ContactUsPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'WelcomeScreen.dart';

class CatFoodScreen extends StatefulWidget {
  final String foodType;

  const CatFoodScreen({Key? key, required this.foodType}) : super(key: key);

  @override
  _CatFoodScreenState createState() => _CatFoodScreenState();
}

class _CatFoodScreenState extends State<CatFoodScreen> {
  final List<Map<String, dynamic>> catFoods = [
    // อาหารเปียก
    {
      'name': 'Moochie',
      'image': 'assets/Moochie.png',
      'videoUrl': 'https://www.youtube.com/watch?v=DqzPL1ac_dM',
      'shopeeUrl':
          'https://shopee.co.th/-%F0%9F%94%A5MY418SEP-My-Paws-(Moochie)-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B8%A1%E0%B8%B9%E0%B8%AA-%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%99%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B9%81%E0%B8%95%E0%B9%88-1-%E0%B9%80%E0%B8%94%E0%B8%B7%E0%B8%AD%E0%B8%99%E0%B8%82%E0%B8%B6%E0%B9%89%E0%B8%99%E0%B9%84%E0%B8%9B-i.220797418.16345273029',
      'type': 'อาหารเปียก',
      'ingredients': 'เนื้อทูน่า, เนื้อแซลมอน, ทอรีน, น้ำมันมะพร้าว',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '1 แพ็ค 12 ซอง 150 บาท\nราคาต่อซอง: 12 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Royal Canin',
      'image': 'assets/Royal Canin.png',
      'videoUrl': 'https://www.youtube.com/watch?v=8crjyfXHJnI',
      'shopeeUrl':
          'https://shopee.co.th/Royal-Canin-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%9B%E0%B8%B5%E0%B8%A2%E0%B8%81-Royal-Canin-Instinctive-%E0%B9%80%E0%B8%9E%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%A3%E0%B9%88%E0%B8%B2%E0%B8%87%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%AA%E0%B8%A1%E0%B8%AA%E0%B9%88%E0%B8%A7%E0%B8%99-85-g-%C3%9712-%E0%B8%8B%E0%B8%AD%E0%B8%87-i.767870.378076720',
      'type': 'อาหารเปียก',
      'ingredients': 'เกรวี่, เนื้อละเอียด, เยลลี่',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '1 แพ็ค 12 ซอง 313 บาท\nราคาต่อซอง: 26 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Pramy',
      'image': 'assets/Pramy.png',
      'videoUrl': 'https://www.youtube.com/watch?v=PZ3ZIAT9lgc',
      'shopeeUrl':
          'https://shopee.co.th/Pramy-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%81%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%9B%E0%B8%B5%E0%B8%A2%E0%B8%81-%E0%B8%9A%E0%B8%A3%E0%B8%A3%E0%B8%88%E0%B8%B8%E0%B8%8B%E0%B8%AD%E0%B8%87-70g-i.114389551.12109651866',
      'type': 'อาหารเปียก',
      'ingredients': 'เนื้อปลาทุ, เนื้อแซลมอน, เจลลี่',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '1 แพ็ค 12 ซอง 180 บาท\nราคาต่อซอง: 15  บาท',
      'isFavorite': false,
    },
    {
      'name': 'Cat’s Taste',
      'image': 'assets/Cat’s Taste.png',
      'videoUrl': 'https://www.youtube.com/watch?v=oqV6SLLu4KM',
      'shopeeUrl':
          'https://shopee.co.th/Cat%27s-Taste-%E0%B9%81%E0%B8%84%E0%B8%97%E0%B9%80%E0%B8%97%E0%B8%AA%E0%B8%95%E0%B9%8C-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%80%E0%B8%9B%E0%B8%B5%E0%B8%A2%E0%B8%81%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-75-%E0%B8%81%E0%B8%A3%E0%B8%B1%E0%B8%A1-12-%E0%B8%8B%E0%B8%AD%E0%B8%87-(%E0%B9%80%E0%B8%A5%E0%B8%B7%E0%B8%AD%E0%B8%81%E0%B8%A3%E0%B8%AA%E0%B9%84%E0%B8%94%E0%B9%89)-i.138020609.16780226285',
      'type': 'อาหารเปียก',
      'ingredients': 'เนื้อปลาทุ, เนื้อแซลมอน, เจลลี่',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '1 แพ็ค 12 ซอง 168 บาท\nราคาต่อซอง: 14 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Purina Felix',
      'image': 'assets/Purina Felix.png',
      'videoUrl': 'https://www.youtube.com/watch?v=EScEZLHg7tw',
      'shopeeUrl':
          'https://shopee.co.th/Purina-Felix-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B8%88%E0%B8%B2%E0%B8%81%E0%B8%AD%E0%B8%AD%E0%B8%AA%E0%B9%80%E0%B8%95%E0%B8%A3%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2-70-%E0%B8%81%E0%B8%A3%E0%B8%B1%E0%B8%A1-12-%E0%B8%8B%E0%B8%AD%E0%B8%87-i.1037541.2646079619',
      'type': 'อาหารเปียก',
      'ingredients': 'เนื้อไก่, เจลลี่',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '1 แพ็ค 12 ซอง 169 บาท\nราคาต่อซอง: 14 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Regalos',
      'image': 'assets/Regalos.png',
      'videoUrl': 'https://www.youtube.com/watch?v=g0sdB5eB9g0',
      'shopeeUrl':
          'https://shopee.co.th/%E0%B8%A3%E0%B8%B5%E0%B8%81%E0%B8%B2%E0%B8%A5%E0%B8%AD%E0%B8%AA-Regalos-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%9B%E0%B8%B5%E0%B8%A2%E0%B8%81-%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-70g.-%E0%B9%80%E0%B8%99%E0%B8%B7%E0%B9%89%E0%B8%AD%E0%B8%9B%E0%B8%A5%E0%B8%B2%E0%B9%80%E0%B8%99%E0%B9%89%E0%B8%99%E0%B9%86-12-%E0%B8%8B%E0%B8%AD%E0%B8%87-(%E0%B8%82%E0%B8%B2%E0%B8%A2%E0%B8%A2%E0%B8%81%E0%B9%82%E0%B8%AB%E0%B8%A5-%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%84%E0%B8%A5%E0%B8%B0%E0%B8%A3%E0%B8%AA)-i.59267486.7991457608',
      'type': 'อาหารเปียก',
      'ingredients': 'เนื้อปลาทู เจลลี่',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': 'แพ็ค 12 ซอง 158 บาท\nราคาต่อซอง: 13 บาท',
      'isFavorite': false,
    },
    //อาหารแห้ง
    {
      'name': 'Me-O',
      'image': 'assets/meo.png',
      'videoUrl': 'https://www.youtube.com/watch?v=9zVm6CN0DhU',
      'shopeeUrl':
          'https://shopee.co.th/Me-O-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B8%84%E0%B8%A5%E0%B8%B0%E0%B8%A3%E0%B8%AA%E0%B8%8A%E0%B8%B2%E0%B8%95%E0%B8%B4-%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-1.1-1.2-%E0%B8%81%E0%B8%B4%E0%B9%82%E0%B8%A5%E0%B8%81%E0%B8%A3%E0%B8%B1%E0%B8%A1-i.154416713.2374123185',
      'type': 'อาหารแห้ง',
      'ingredients': 'เนื้อปลา, ข้าว, เนื้อไก่, โอเมก้า 3',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '180 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Royal Canin',
      'image': 'assets/royal_canin.png',
      'videoUrl': 'https://www.youtube.com/watch?v=Yqt70tnsnCA',
      'shopeeUrl':
          'https://shopee.co.th/Royal-Canin-400g.-Kitten-%E0%B9%82%E0%B8%A3%E0%B8%A2%E0%B8%B1%E0%B8%A5%E0%B8%84%E0%B8%B2%E0%B8%99%E0%B8%B4%E0%B8%99-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B8%A5%E0%B8%B9%E0%B8%81%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B9%81%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%A1%E0%B9%87%E0%B8%94-%F0%9F%90%B1-i.155102849.2341428150',
      'type': 'อาหารแห้ง',
      'ingredients': 'เนื้อแซลมอน, ข้าวกล้อง, วิตามินอี, ทอรีน',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '350 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Whiskas',
      'image': 'assets/whiskasDry.png',
      'videoUrl': 'https://youtu.be/U3eyr02UjJo?si=Wb8mSkxJeJ92LFkM',
      'shopeeUrl':
          'https://shopee.co.th/Whiskas-Indoor-1.1kg-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B8%A7%E0%B8%B4%E0%B8%AA%E0%B8%81%E0%B8%B1%E0%B8%AA-%E0%B9%81%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%A1%E0%B9%87%E0%B8%94-%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%82%E0%B8%95-%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B9%89%E0%B8%A2%E0%B8%87%E0%B9%83%E0%B8%99%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99-i.70234530.15501764501',
      'type': 'อาหารแห้ง',
      'ingredients': 'ข้าว, เนื้อปลา, พืช, ไขมัน, วิตามินอี',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '165 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Purina ONE',
      'image': 'assets/PurinaoneMed.png',
      'videoUrl':
          'https://www.youtube.com/watch?v=_XKhYSGb-jM&ab_channel=NestleThailand',
      'shopeeUrl':
          'https://shopee.co.th/PURINA-ONE-%E0%B9%80%E0%B8%9E%E0%B8%B5%E0%B8%A2%E0%B8%A7%E0%B8%A3%E0%B8%B4%E0%B8%99%E0%B9%88%E0%B8%B2%E0%B8%A7%E0%B8%B1%E0%B8%99-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B8%96%E0%B8%B8%E0%B8%87%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-1.2kg-%E0%B8%97%E0%B8%B8%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3-%E0%B9%80%E0%B8%81%E0%B8%A3%E0%B8%94%E0%B8%9E%E0%B8%A3%E0%B8%B5%E0%B9%80%E0%B8%A1%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A1-%E0%B8%AD%E0%B8%B8%E0%B8%94%E0%B8%A1%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%A2%E0%B8%AA%E0%B8%B2%E0%B8%A3%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B9%80%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%B0%E0%B8%AA%E0%B8%A1%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%83%E0%B8%99%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%A5%E0%B8%B0%E0%B8%8A%E0%B9%88%E0%B8%A7%E0%B8%87%E0%B8%A7%E0%B8%B1%E0%B8%A2-i.898301812.19165925188',
      'type': 'อาหารแห้ง',
      'ingredients': 'ข้าว, โอเมก้า 3',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '299 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Maxima',
      'image': 'assets/MaximaMed.png',
      'videoUrl': 'https://youtu.be/y5DZnjM-Zg8?si=7Q3sShjRN81PZKDB',
      'shopeeUrl': '',
      'type': 'อาหารแห้ง',
      'ingredients': 'เนื้อสัตว์ปีก, เนื้อปลา, วิตามินอี',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation':
          'https://shopee.co.th/%E0%B9%81%E0%B8%A1%E0%B9%87%E0%B8%81%E0%B8%8B%E0%B8%B5%E0%B8%A1%E0%B9%88%E0%B8%B2-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7-maxima-15-kg-i.672929438.10186024051',
      'price': '1035 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Kaniva',
      'image': 'assets/kanivaMed.png',
      'videoUrl':
          'https://www.youtube.com/watch?v=KGw9lzC4zcg&ab_channel=T.Prdch',
      'shopeeUrl':
          'https://shopee.co.th/Kaniva-%E0%B8%84%E0%B8%B2%E0%B8%99%E0%B8%B4%E0%B8%A7%E0%B9%88%E0%B8%B2-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-1.3-1.5-%E0%B8%81%E0%B8%81.-i.767870.4387020403',
      'type': 'อาหารแห้ง',
      'ingredients': 'เนื้อไก่, ปลาทูน่า, วิตามินอี',
      'nutrition': 'รองรับสุขภาพหัวใจ',
      'explanation': '',
      'price': '445 บาท',
      'isFavorite': false,
    },
    //ขนมแมว
    {
      'name': 'VFcore',
      'image': 'assets/Vfocrekanom.png',
      'videoUrl': '',
      'shopeeUrl':
          'https://shopee.co.th/VFcore-%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%80%E0%B8%AA%E0%B8%A3%E0%B8%B4%E0%B8%A1%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B9%81%E0%B8%9A%E0%B8%9A%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2-10-%E0%B8%8B%E0%B8%AD%E0%B8%87-i.944560235.22434477730',
      'type': 'ขนมแมว',
      'ingredients':
          'MAC, Melofeed, Methionine, Arginine, Inositol, Taurine, Multi-vitamin, Omega 3&6, Biotin, Folic Acid. 2. KC',
      'nutrition':
          'Helps fight free radicals,Reduce inflammation of the kidneys,Reduce inflammation of the kidneys',
      'explanation': '',
      'price': '149 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Lifemate',
      'image': 'assets/LifemateKanom.png',
      'videoUrl': '',
      'shopeeUrl':
          'https://shopee.co.th/Lifemate-%E0%B9%81%E0%B8%9E%E0%B9%87%E0%B8%84-4%E0%B8%8B%E0%B8%AD%E0%B8%87-%E0%B9%84%E0%B8%A5%E0%B8%9F%E0%B9%8C%E0%B9%80%E0%B8%A1%E0%B8%95-%E0%B8%82%E0%B8%99%E0%B8%A1%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2%E0%B9%80%E0%B8%9E%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%AA%E0%B8%B8%E0%B8%82%E0%B8%A0%E0%B8%B2%E0%B8%9E-%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B9%84%E0%B8%94%E0%B9%89%E0%B8%9A%E0%B9%88%E0%B8%AD%E0%B8%A2%E0%B8%AD%E0%B8%A3%E0%B9%88%E0%B8%AD%E0%B8%A2%E0%B9%84%E0%B8%95%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%9E%E0%B8%B1%E0%B8%87-%E0%B9%81%E0%B8%84%E0%B8%A5%E0%B8%95%E0%B9%88%E0%B8%B3-i.19056998.23275764890',
      'type': 'ขนมแมว',
      'ingredients':
          'Tuna, thickener, salmon, fiber, sunflower seed oil. Fluctooligosaccharite Tuna oil, taurine, yucca extract',
      'nutrition':
          'Add prebiotics that are food for good bacteria in the intestines. - Add taurine, which is an essential amino acid that helps with the work of the heart, eyes, and muscles. - Add Yucca Schidigera extract to help reduce the smell of feces. - No preservatives added',
      'explanation': '',
      'price': '45 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Natural Core Merry Chu',
      'image': 'assets/Natural Core Merry ChuKanom.png',
      'videoUrl': '',
      'shopeeUrl':
          'https://shopee.co.th/Natural-Core-Merry-Chu-%E0%B8%82%E0%B8%99%E0%B8%A1%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2-%E0%B8%99%E0%B8%B3%E0%B9%80%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%88%E0%B8%B2%E0%B8%81%E0%B9%80%E0%B8%81%E0%B8%B2%E0%B8%AB%E0%B8%A5%E0%B8%B5-%E0%B8%A7%E0%B8%B1%E0%B8%95%E0%B8%96%E0%B8%B8%E0%B8%94%E0%B8%B4%E0%B8%9A%E0%B8%9E%E0%B8%A3%E0%B8%B5%E0%B9%80%E0%B8%A1%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A1-%E0%B9%80%E0%B8%81%E0%B8%A3%E0%B8%94%E0%B8%84%E0%B8%99%E0%B8%81%E0%B8%B4%E0%B8%99-%E0%B8%A7%E0%B8%B4%E0%B8%95%E0%B8%B2%E0%B8%A1%E0%B8%B4%E0%B8%99%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B9%81%E0%B8%A3%E0%B9%88%E0%B8%98%E0%B8%B2%E0%B8%95%E0%B8%B8%E0%B8%84%E0%B8%A3%E0%B8%9A-56-g-i.779177.9815263367',
      'type': 'ขนมแมว',
      'ingredients':
          'Tuna, thickener, salmon, fiber, sunflower seed oil. Fluctooligosaccharite Tuna oil, taurine, yucca extract',
      'nutrition':
          'Add prebiotics that are food for good bacteria in the intestines. - Add taurine, which is an essential amino acid that helps with the work of the heart, eyes, and muscles. - Add Yucca Schidigera extract to help reduce the smell of feces. - No preservatives added',
      'explanation': '',
      'price': '69 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Tamago Mouzze',
      'image': 'assets/Tamago MouzzeKom.png',
      'videoUrl': '',
      'shopeeUrl':
          'https://shopee.co.th/%E0%B8%97%E0%B8%B2%E0%B8%A1%E0%B8%B2%E0%B9%82%E0%B8%81%E0%B8%B0-Tamago-3%E0%B9%81%E0%B8%9E%E0%B9%87%E0%B8%84-%E0%B8%82%E0%B8%99%E0%B8%A1%E0%B8%AA%E0%B8%B8%E0%B8%99%E0%B8%B1%E0%B8%82-%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B9%82%E0%B8%A3%E0%B8%84%E0%B9%84%E0%B8%95%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B9%84%E0%B8%94%E0%B9%89-Tamago-Mouzze-%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2-%E0%B8%AA%E0%B8%B8%E0%B8%99%E0%B8%B1%E0%B8%82%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2-%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2-%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-36-%E0%B8%81%E0%B8%A3%E0%B8%B1%E0%B8%A1-i.581224385.21071451947',
      'type': 'ขนมแมว',
      'ingredients':
          'Tuna, Sweet Potato, Egg, White, Guar Gum, Fish Concentrate, Vitamins & Minerals.',
      'nutrition': '',
      'explanation': '',
      'price': '168 บาท',
      'isFavorite': false,
    },
    {
      'name': 'Wilari',
      'image': 'assets/WilariKanom.png',
      'videoUrl': '',
      'shopeeUrl':
          'https://shopee.co.th/-%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88-Wilari-%E0%B8%82%E0%B8%99%E0%B8%A1%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B8%A2%E0%B9%80%E0%B8%81%E0%B8%A3%E0%B8%94%E0%B8%9E%E0%B8%A3%E0%B8%B5%E0%B9%80%E0%B8%A1%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A1-%E0%B9%81%E0%B8%9E%E0%B9%87%E0%B8%84-5-%E0%B8%8B%E0%B8%AD%E0%B8%87-%E0%B8%A3%E0%B8%AA%E0%B9%84%E0%B8%81%E0%B9%88-%E0%B9%84%E0%B8%81%E0%B9%88%E0%B9%81%E0%B8%99%E0%B9%88%E0%B8%99%E0%B9%86-%E0%B8%99%E0%B8%B2%E0%B8%A2%E0%B8%97%E0%B9%88%E0%B8%B2%E0%B8%99%E0%B8%8A%E0%B8%AD%E0%B8%9A-i.283994247.12936878721',
      'type': 'ขนมแมว',
      'ingredients':
          'Tuna, Sweet Potato, Egg, White, Guar Gum, Fish Concentrate, Vitamins & Minerals.',
      'nutrition': '',
      'explanation': '',
      'price': '20 บาท',
      'isFavorite': false,
    },
    //ของเล่นแมว
    {
      'name': 'ไม้ตกแมว',
      'image': 'assets/ไม้ตกแมว.png',
      'videoUrl':
          'https://www.youtube.com/watch?v=KGw9lzC4zcg&ab_channel=T.Prdch',
      'shopeeUrl':
          'https://shopee.co.th/KUMA-%E3%81%BE-%E0%B9%84%E0%B8%A1%E0%B9%89%E0%B8%95%E0%B8%81%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B8%84%E0%B8%91%E0%B8%B2%E0%B8%99%E0%B8%B2%E0%B8%87%E0%B8%9F%E0%B9%89%E0%B8%B2-%E0%B9%84%E0%B8%A1%E0%B9%89%E0%B8%95%E0%B8%81%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%AB%E0%B8%8D%E0%B8%B4%E0%B8%87-%E0%B9%84%E0%B8%A1%E0%B9%89%E0%B8%95%E0%B8%81%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B8%9F%E0%B8%A3%E0%B8%B8%E0%B9%89%E0%B8%87%E0%B8%9F%E0%B8%A3%E0%B8%B4%E0%B9%89%E0%B8%87-%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%99%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B9%84%E0%B8%A1%E0%B9%89%E0%B8%A5%E0%B9%88%E0%B8%AD%E0%B9%81%E0%B8%A1%E0%B8%A7-Cat-toy-i.290162236.9837966311',
      'type': 'ของเล่นแมว',
      'ingredients': '',
      'nutrition': '',
      'explanation':
          'ไม้ตกแมวเป็นของเล่นแมวที่ควรมีติดบ้านชิ้นหนึ่ง เพราะมีราคาถูก หาซื้อง่าย เป็นของเล่นที่ไม่ว่าแมวตัวไหนก็ต้องพ่ายแพ้ วิธีเล่นก็เพียงแกว่งไม้ตกแมวไปมา ก็เรียกความสนใจจากแมวได้เป็นอย่างดี ยิ่งไม้ตกแมวที่มาพร้อมเสียงกรุ๊งกริ๊งของกระดิ่ง ก็ยิ่งทำให้แมวพร้อมวิ่งเข้ามาตะครุบทันที',
      'price': '30 บาท',
      'isFavorite': false,
    },
    {
      'name': 'หนูไขลาน',
      'image': 'assets/หนูไขลาน.png',
      'videoUrl':
          'https://www.youtube.com/watch?v=jdICcEAtwI4&ab_channel=%E0%B9%80%E0%B8%AA%E0%B8%B7%E0%B8%AD%E0%B8%99%E0%B9%89%E0%B8%AD%E0%B8%A2%E0%B8%88%E0%B8%B8%E0%B8%94%E0%B8%AA%E0%B8%AD%E0%B8%87%E0%B8%AB%E0%B9%89%E0%B8%AD%E0%B8%A2',
      'shopeeUrl':
          'https://shopee.co.th/MJ-%E0%B8%AB%E0%B8%99%E0%B8%B9%E0%B9%84%E0%B8%82%E0%B8%A5%E0%B8%B2%E0%B8%99-%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%99%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B9%81%E0%B8%A1%E0%B8%A7-(-4-%E0%B8%AA%E0%B8%B5-)-i.49956351.1583166924',
      'type': 'ของเล่นแมว',
      'ingredients': '',
      'nutrition': '',
      'explanation':
          'แมวกับหนูเป็นของคู่กัน! การหาตุ๊กตาหนูไขลานมาให้แมววิ่งไล่ ปลุกสัญชาตญาณความเป็นนักล่าในตัวก็สร้างความสนุกและเพลิดเพลินได้เป็นอย่างดี นอกจากได้เสริมพัฒนาการเคลื่อนไหวแล้ว หนูไขลานยังช่วยฝึกสกิลการจับหนูเบื้องต้นได้อีกด้วย',
      'price': '25 บาท',
      'isFavorite': false,
    },
    {
      'name': 'อุโมงค์แมว',
      'image': 'assets/อุโมงค์แมว.png',
      'videoUrl':
          'https://www.youtube.com/watch?v=oEit9mYoKt4&ab_channel=BoJiya',
      'shopeeUrl':
          'https://shopee.co.th/Thai.th-%E0%B8%AD%E0%B8%B8%E0%B9%82%E0%B8%A1%E0%B8%87%E0%B8%84%E0%B9%8C%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%99%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%99%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%AA%E0%B8%B1%E0%B8%95%E0%B8%A7%E0%B9%8C%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B9%89%E0%B8%A2%E0%B8%87-%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%99%E0%B9%81%E0%B8%A1%E0%B8%A7-%E0%B8%AA%E0%B8%99%E0%B8%B8%E0%B8%81%E0%B8%99%E0%B8%B8%E0%B9%88%E0%B8%A1%E0%B9%80%E0%B8%9B%E0%B9%87%E0%B8%99%E0%B8%A1%E0%B8%B4%E0%B8%95%E0%B8%A3%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%AA%E0%B8%B1%E0%B8%95%E0%B8%A7%E0%B9%8C%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B9%89%E0%B8%A2%E0%B8%87-CS-76(%E0%B8%A1%E0%B8%B5%E0%B8%A3%E0%B8%B2%E0%B8%84%E0%B8%B2%E0%B8%AA%E0%B9%88%E0%B8%87)-i.131727347.8351634062',
      'type': 'ของเล่นแมว',
      'ingredients': '',
      'nutrition': '',
      'explanation':
          'ถ้าน้องแมวชอบเล่นซ่อนหาหรือชอบมุดแอบใต้โต๊ะหรือเก้าอี้เป็นประจำ อุโมงค์แมวนับว่าเป็นของเล่นอีกชิ้นที่ควรมีติดบ้าน เพราะแมวสามารถใช้เป็นที่ซ่อนตัวรอจู่โจมงับขาเจ้าของได้ อุโมงค์แมวมักจะทำจากผ้าร่ม บางรุ่นถูกดีไซน์ให้มีรูด้านบน เพื่อให้แมวโผล่หัวออกมาได้ บางรุ่นก็มีตุ๊กตาห้อยไว้ตรงทางเข้าอุโมงค์ สำหรับให้แมวตะครุบด้วย',
      'price': '120 บาท',
      'isFavorite': false,
    },
  ];

  String query = '';

  void toggleFavorite(int index) {
    setState(() {
      catFoods[index]['isFavorite'] = !catFoods[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredCatFoods = catFoods.where((catFood) {
      return (catFood['type'] == widget.foodType) &&
          (catFood['name']!.toLowerCase().contains(query.toLowerCase()) ||
              catFood['ingredients']!
                  .toLowerCase()
                  .contains(query.toLowerCase()));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'รายการอาหารแมว',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 189, 48, 48),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 74, 74),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/catprofile.png'), // Add your image here
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('หน้าแรก'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('ติดต่อเรา'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactUsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 146, 197),
              Color.fromARGB(255, 100, 201, 248),
            ],
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'ค้นหาชื่ออาหารแมวหรือส่วนผสม...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.pinkAccent, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.pinkAccent.withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.pinkAccent, width: 2),
                  ),
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.pinkAccent),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: filteredCatFoods.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CatFoodDetailScreen(
                            name: filteredCatFoods[index]['name']!,
                            image: filteredCatFoods[index]['image']!,
                            videoUrl: filteredCatFoods[index]['videoUrl']!,
                            shopeeUrl: filteredCatFoods[index]['shopeeUrl'],
                            type: filteredCatFoods[index]['type']!,
                            ingredients: filteredCatFoods[index]
                                ['ingredients']!,
                            nutrition: filteredCatFoods[index]['nutrition']!,
                            price: filteredCatFoods[index]['price']!,
                            explanation: filteredCatFoods[index]
                                ['explanation']!,
                            isFavorite: filteredCatFoods[index]['isFavorite'],
                            onFavoriteToggle: () => toggleFavorite(index),
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = 0.0;
                            var end = 1.0;
                            var curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end).chain(
                              CurveTween(curve: curve),
                            );

                            return FadeTransition(
                              opacity: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset(
                              filteredCatFoods[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  filteredCatFoods[index]['name']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: Icon(
                                    catFoods[index]['isFavorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: () => toggleFavorite(index),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatFoodDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final String videoUrl;
  final String shopeeUrl;
  final String type;
  final String ingredients;
  final String nutrition;
  final String price;
  final String explanation;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CatFoodDetailScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.videoUrl,
    required this.shopeeUrl,
    required this.type,
    required this.ingredients,
    required this.nutrition,
    required this.price,
    required this.explanation,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  _CatFoodDetailScreenState createState() => _CatFoodDetailScreenState();
}

class _CatFoodDetailScreenState extends State<CatFoodDetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchShopeeUrl(String url) async {
    Uri shoeeUrl = Uri.parse(url);

    if (await canLaunchUrl(shoeeUrl)) {
      await launchUrl(shoeeUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: const Color.fromARGB(255, 236, 79, 79),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 146, 197),
              Color.fromARGB(255, 100, 201, 248),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.videoUrl.isNotEmpty)
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              const SizedBox(height: 20),
              const Text(
                'รายละเอียดอาหารแมว',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ประเภท: ${widget.type}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'ส่วนผสม: ${widget.ingredients}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'คุณค่าทางโภชนาการ: ${widget.nutrition}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'คำอธิบาย: ${widget.explanation}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'ราคา: ${widget.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _launchShopeeUrl(widget.shopeeUrl),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.shopping_cart),
                            SizedBox(width: 8),
                            Text('Shopee'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
