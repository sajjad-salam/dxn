import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final int id, price;
  final double point;
  final String name, image;

  Product({
    required this.id,
    required this.point,
    required this.price,
    required this.name,
    required this.image,
  });
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class systr extends StatefulWidget {
  const systr({super.key});

  @override
  State<systr> createState() => _systrState();
}

class _systrState extends State<systr> {
  String prod = "list.first";
  _systrState({
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: prod,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        try {
          setState(() {
            prod = value!;
          });
        } catch (e) {
          print(e);
        }
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// list of products System turkey
List<Product> products = [
  Product(
    point: 51.5,
    id: 1,
    price: 180,
    name: "الفطر الريشي RG 90",
    image: "",
  ),
  Product(
    id: 2,
    point: 36.5,
    price: 160,
    name: "الفطر الريشي GL 90",
    image: "",
  ),
  Product(
    id: 3,
    price: 600,
    point: 195,
    name: "الفطر الريشي RG 360",
    image: "",
  ),
  Product(
      id: 4, point: 140, price: 510, name: "الفطر الريشي GL 360", image: ""),
  Product(
      id: 5, point: 92, price: 360, name: "ريشيليوم بودر 70 غرام", image: ""),
  Product(
      id: 5,
      point: 446,
      price: 1490,
      name: "ميكوفيتا 30 كيس * 12 غم",
      image: ""),
  Product(id: 6, point: 14.8, price: 55, name: "ميكوفيتا كيس 12 غم", image: ""),
  Product(
      id: 7,
      point: 810,
      price: 2630,
      name: "ميكوفيتا 30 كيس * 24 غم",
      image: ""),
  Product(id: 8, point: 27, price: 95, name: "ميكوفيتا كيس 24 غم", image: ""),
  Product(id: 9, point: 85, price: 350, name: "كورديسيبس 120 قرص", image: ""),
  Product(id: 10, point: 33, price: 155, name: "عرف الأسد 120 قرص", image: ""),
  Product(id: 11, point: 20, price: 95, name: "سبايرولينا 120 قرص", image: ""),
  Product(id: 12, point: 75, price: 320, name: "سبايرولينا 500 قرص", image: ""),
  Product(
      id: 13,
      point: 210,
      price: 855,
      name: "سبايرولينا 300 قرص (عرض 4+1 مجاناً)",
      image: ""),
  Product(id: 14, point: 31, price: 145, name: "مورنزي 90 كبسول", image: ""),
  Product(id: 15, point: 21, price: 120, name: "لقاح النحل 120", image: ""),
  Product(
      id: 16,
      point: 53,
      price: 220,
      name: "ميكوفيجي 200 غرام كرتون",
      image: ""),
  Product(
      id: 17, point: 95, price: 390, name: "ميكوفيجي علبة 400 غرام", image: ""),
  Product(id: 18, point: 13.5, price: 75, name: "شراب الكحة", image: ""),
  Product(id: 19, point: 1.7, price: 15, name: "حلوى النعناع ظرف", image: ""),
  Product(id: 20, point: 70, price: 300, name: "بوتنزي 90 كبسول", image: ""),
  Product(id: 21, point: 26.5, price: 115, name: "هونغ تي 90", image: ""),
  Product(id: 22, point: 28, price: 155, name: "اندروجي 90", image: ""),
  Product(id: 23, point: 9, price: 105, name: "كوكوزي", image: ""),
  Product(id: 24, point: 11, price: 80, name: "قهوة سوداء بدون سكر", image: ""),
  Product(id: 25, point: 7, price: 90, name: "ليمونزي", image: ""),
  Product(id: 26, point: 12.5, price: 85, name: "قهوة عرف الأسد", image: ""),
  Product(
      id: 27, point: 10.5, price: 80, name: "قهوة الكورديسبس 3*1", image: ""),
  Product(
      id: 28, point: 12, price: 65, name: "شامبوا جانوزي 250 مل", image: ''),
  Product(
      id: 29,
      point: 6.3,
      price: 55,
      name: "معجون اسنان جانوزي كبير",
      image: ""),
  Product(
      id: 30,
      point: 7.1,
      price: 65,
      name: "معجون اسنان جانوزي كبير بلص",
      image: ""),
  Product(id: 31, point: 4, price: 35, name: "معجون اسنان صغير", image: ""),
  Product(id: 32, point: 3.5, price: 30, name: "صابون جانوزي", image: ''),
  Product(id: 33, point: 10.5, price: 60, name: "زيت الجانوا", image: ''),
  Product(id: 34, point: 5.1, price: 55, name: "كريمة شجرة الشاي", image: ""),
  Product(
      id: 35,
      point: 17,
      price: 125,
      name: "زيت جوزالهند بالجانودرما",
      image: ""),
  Product(id: 36, point: 4.5, price: 60, name: "بودرة التالكوم", image: ""),
  Product(id: 37, point: 3.8, price: 40, name: "زي ميكو مرهم", image: ""),
  Product(
      id: 38, point: 26, price: 115, name: "بودرة اللؤلؤ 30 غرام", image: ""),
  Product(id: 39, point: 26, price: 145, name: "مجموعة جانوزي", image: ""),
  Product(id: 40, point: 11, price: 65, name: "الوفيرا مرطب نهاري", image: ""),
  Product(id: 41, point: 7.1, price: 59, name: "الوفيرا كريم ليلي", image: ""),
  Product(
      id: 42, point: 5.7, price: 45, name: "الوفيرا مقشر للبشرة", image: ''),
  Product(
      id: 43, point: 5.2, price: 50, name: "الوفيرا تونر (مرطب)", image: ""),
  Product(
      id: 44, point: 4.2, price: 50, name: 'الوفيرا هلام التطهير', image: ""),
  Product(id: 45, point: 3.8, price: 65, name: "الوفيرا لوشن", image: ""),
  Product(id: 46, point: 7.4, price: 55, name: "الوفيرا قناع", image: ""),
  Product(id: 47, point: 11.2, price: 70, name: "احمر الشفاه", image: ""),
  Product(
      id: 48, point: 18, price: 190, name: "نيوتريزي (حليب الصويا)", image: ""),
  Product(id: 49, point: 23.5, price: 145, name: "عطر رجالي فريش", image: ""),
  Product(id: 50, point: 23.5, price: 145, name: "عطر نسائي فريش", image: ""),
];
