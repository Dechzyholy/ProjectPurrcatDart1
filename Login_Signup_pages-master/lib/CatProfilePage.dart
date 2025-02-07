import 'package:flutter/material.dart';

class CatProfilePage extends StatefulWidget {
  final String catName;
  final String catImageUrl;

  const CatProfilePage({
    Key? key,
    this.catName = 'Default Cat',
    this.catImageUrl = 'assets/catprofile.png',
  }) : super(key: key);

  @override
  _CatProfilePageState createState() => _CatProfilePageState();
}

class _CatProfilePageState extends State<CatProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers to manage input
  final TextEditingController _catNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _favoriteFoodController = TextEditingController();
  final TextEditingController _favoriteToyController = TextEditingController();

  // List of available images (assets or network)
  final List<String> _availableImages = [
    'assets/cat1.png',
    'assets/cat2.png',
    'assets/cat3.png',
    'assets/cat4.png',
  ];

  // Variable to store selected image URL
  late String _selectedImageUrl; // Declare without initialization

  // Gender selection
  String? _selectedGender; // Variable to hold the selected gender
  final List<String> _genders = ['ผู้หญิง', 'ผู้ชาย']; // List of genders

  // Age selection
  String? _selectedAge; // Variable to hold the selected age
  final List<String> _ages = [
    'น้อยกว่า 1 ปี',
    '1-5 ปี',
    '6-7 ปี',
    '10 ปีขึ้นไป'
  ]; // List of ages

  @override
  void initState() {
    super.initState();
    _selectedImageUrl =
        widget.catImageUrl; // Set the default image from widget properties
    _catNameController.text =
        widget.catName; // Set the default name from widget properties
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _catNameController.dispose();
    _weightController.dispose();
    _favoriteFoodController.dispose();
    _favoriteToyController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Process the form data
      print('Name: ${_catNameController.text}');
      print('Gender: $_selectedGender'); // Print selected gender
      print('Age: $_selectedAge'); // Print selected age
      print('Weight: ${_weightController.text}');
      print('Favorite Food: ${_favoriteFoodController.text}');
      print('Favorite Toy: ${_favoriteToyController.text}');
      print('Selected Image: $_selectedImageUrl');
      // Here you can save the data to a database, backend, or display it elsewhere
    }
  }

  void _selectImage(String imageUrl) {
    setState(() {
      _selectedImageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลน้องแมว'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Selected Profile Image
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(_selectedImageUrl),
                ),
              ),
              const SizedBox(height: 16.0),

              // Image Selection Section
              const Text('เลือกรูปน้องแมวกัน'),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _availableImages.length,
                  itemBuilder: (context, index) {
                    final imageUrl = _availableImages[index];
                    return GestureDetector(
                      onTap: () => _selectImage(imageUrl),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(imageUrl),
                          child: _selectedImageUrl == imageUrl
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green, size: 30)
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24.0),

              // Name Input
              TextFormField(
                controller: _catNameController,
                decoration: const InputDecoration(
                  labelText: 'กรุณาใส่ชื่อสัตว์เลี้ยงของคุณ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the cat\'s name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              // Gender Selection Dropdown
              DropdownButtonFormField<String>(
                value: _selectedGender,
                hint: const Text('เลือกเพศสัตว์เลี้ยงของคุณ'),
                items: _genders.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value; // Update selected gender
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select the gender';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16.0),

              // Age Selection Dropdown
              DropdownButtonFormField<String>(
                value: _selectedAge,
                hint: const Text('เลือกอายุสัตว์เลี้ยงของคุณ'),
                items: _ages.map((age) {
                  return DropdownMenuItem(
                    value: age,
                    child: Text(age),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAge = value; // Update selected age
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select the age';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16.0),

              // Weight Input
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'กรุณาใส่น้ำหนักสัตว์เลี้ยงของคุณ(kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the weight';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              // Favorite Food Input
              TextFormField(
                controller: _favoriteFoodController,
                decoration: const InputDecoration(
                  labelText: 'อาหารที่สัตว์เลี้ยงคุณชอบ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the favorite food';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              // Favorite Toy Input
              TextFormField(
                controller: _favoriteToyController,
                decoration: const InputDecoration(
                  labelText: 'ของเล่นที่สัตว์เลี้ยงคุณชอบ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the favorite toy';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

              // Save Button
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('บันทึกข้อมูล'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to get cat data
  Map<String, String> getCatData() {
    return {
      'name': _catNameController.text,
      'image': _selectedImageUrl,
    };
  }
}
