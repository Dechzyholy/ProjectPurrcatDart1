import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Map<String, dynamic>> catFoods;

  const FavoritePage(
      {Key? key,
      required this.catFoods,
      required Null Function(dynamic int) onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter the list to only include favorites
    final favoriteCatFoods =
        catFoods.where((catFood) => catFood['isFavorite']).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('อาหารแมวที่ชอบ'),
        backgroundColor:
            const Color.fromARGB(255, 236, 79, 79), // สีเหมือนใน CatFoodType
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 146, 197), // สี gradient แบบเดียวกัน
            Color.fromARGB(255, 100, 201, 248),
          ]),
        ),
        padding: const EdgeInsets.all(16.0),
        child: favoriteCatFoods.isEmpty
            ? const Center(
                child: Text(
                  'ไม่มีอาหารแมวที่ชอบ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // สีของข้อความ
                  ),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: favoriteCatFoods.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white, // เพิ่มสีพื้นหลังของการ์ด
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            favoriteCatFoods[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                favoriteCatFoods[index]['name']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // สีของชื่ออาหาร
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'ราคา: ${favoriteCatFoods[index]['price']}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54, // สีของราคาที่เบากว่า
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
