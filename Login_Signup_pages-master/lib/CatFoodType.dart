// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:untitled3/ContactUsPage.dart';
import 'package:untitled3/WelcomeScreen.dart';
import 'CatFoodScreen.dart';
import 'FavoritesPage.dart';
import 'CatProfilePage.dart';

class CatFoodType extends StatelessWidget {
  final String catName; // Add cat name parameter
  final String catImageUrl; // Add cat image URL parameter

  const CatFoodType({
    Key? key,
    required this.catName,
    required this.catImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Purr Cat',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(255, 236, 79, 79),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(
                    catFoods: const [],
                    onToggleFavorite: (int) {},
                  ),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 74, 74),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage(catImageUrl), // Use passed image URL
                  ),
                  const SizedBox(height: 10),
                  Text(
                    catName, // Use passed cat name
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('ข้อมูล'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CatProfilePage(
                        catName: catName, catImageUrl: catImageUrl),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('หน้าหลัก'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatFoodType(
                        catName: 'Default Cat',
                        catImageUrl:
                            'assets/catprofile.png'), // Change this to your actual parameters
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('ติดต่อเรา'),
              onTap: () {
                // ContactUsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactUsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('ออกจากระบบ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 146, 197),
            Color.fromARGB(255, 100, 201, 248),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: FoodCategoryTile(
                        title: 'อาหารแมวแบบแห้ง',
                        imageUrl: 'assets/PETFOOD.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CatFoodScreen(foodType: 'อาหารแห้ง'),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FoodCategoryTile(
                        title: 'อาหารแมวแบบเปียก',
                        imageUrl: 'assets/WETCATFOOD.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CatFoodScreen(foodType: 'อาหารเปียก'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: FoodCategoryTile(
                        title: 'ขนมแมว',
                        imageUrl: 'assets/CATSANCK.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CatFoodScreen(foodType: 'ขนมแมว'),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FoodCategoryTile(
                        title: 'ของเล่นแมว',
                        imageUrl: 'assets/CATTOY.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CatFoodScreen(foodType: 'ของเล่นแมว'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl; // New field for image
  final VoidCallback onTap;

  const FoodCategoryTile({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imageUrl, // Load the image from assets
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5), // Space between image and text
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
