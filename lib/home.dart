// home.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('PlantPursuit'),
        backgroundColor: Colors.lightGreen[200],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildSearchButton(context),
          SizedBox(height: 10),
          _buildButton(Icons.camera_alt, 'กล้อง', () => _openCamera(context)),
          SizedBox(height: 10),
          _buildButton(Icons.image, 'แกลลอรี่', () => _openGallery(context)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        backgroundColor: Colors.lightGreen[200],
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'ค้นหา',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.lightGreen[100],
        ),
        onSubmitted: (value) {
          // ทำการค้นหาด้วยข้อความที่ได้รับ
          print('ค้นหา: $value');
        },
      ),
    );
  }

  Widget _buildButton(IconData icon, String label, VoidCallback onPressed) {
    return Container(
      width: 300,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen[100],
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  void _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // ทำงานกับรูปภาพที่ถ่ายได้
      print('ถ่ายภาพ: ${image.path}');
    }
  }

  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // ทำงานกับรูปภาพที่เลือก
      print('เลือกภาพ: ${image.path}');
    }
  }
}