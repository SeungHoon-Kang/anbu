import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  File? selectedImage; // 선택된 이미지 파일
  final picker = ImagePicker();

  void _handleCreatePost() {
    // 여기에서 게시글 생성 로직을 구현하세요.
    String title = titleController.text;
    String content = contentController.text;
    File? image = selectedImage; // 선택된 이미지 파일

    // 게시글을 생성하고 저장하는 로직을 수행합니다.
    // title, content 및 image를 사용하여 게시글을 저장합니다.
  }

  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '게시글 작성',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: '게시글 제목',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: contentController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: '게시글 내용',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('사진 업로드'),
            ),
            SizedBox(height: 16.0),
            selectedImage != null
                ? Image.file(
                    selectedImage!,
                    width: 100.0,
                    height: 100.0,
                  )
                : Container(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleCreatePost,
              child: Text('게시'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
