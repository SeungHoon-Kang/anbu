import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _oneLinerController = TextEditingController();
  File? selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _updateProfile() async {
    String nickname = _nicknameController.text;
    String oneLiner = _oneLinerController.text;

    // This is a sample API endpoint, replace with your actual API endpoint.
    String apiEndpoint = 'https://yourapi.com/updateProfile';

    try {
      // If you have a file to upload, use `MultipartRequest` instead.
      final response = await http.post(
        Uri.parse(apiEndpoint),
        body: {
          'nickname': nickname,
          'oneLiner': oneLiner,
          // Add other fields as needed
        },
        headers: {
          'Authorization':
              'Bearer your_token', // if you use token authentication
        },
      );

      if (response.statusCode == 200) {
        // Handle successful update: show a confirmation to the user, navigate away, etc.
      } else {
        // Handle error: show an error message to the user.
      }
    } catch (e) {
      // Handle error: show an error message to the user.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 수정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: selectedImage == null
                  ? AssetImage('assets/image/sample_profile_img.png')
                      as ImageProvider<Object>?
                  : FileImage(selectedImage!) as ImageProvider<Object>?,
            ),
            TextButton(
              onPressed: _pickImage,
              child: Text('프로필 사진 바꾸기'),
            ),
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: '닉네임',
              ),
            ),
            TextField(
              controller: _oneLinerController,
              decoration: InputDecoration(
                labelText: '한줄 소개',
              ),
            ),
            ElevatedButton(
              onPressed: _updateProfile,
              child: Text('프로필 업데이트'),
            ),
          ],
        ),
      ),
    );
  }
}
