import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _imageFile;

  // pick image
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  // upload image
  Future uploadImage() async {
    if (_imageFile == null) return;

    final fileName = DateTime.now().microsecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';

    await Supabase.instance.client.storage
        .from('images')
        .upload(path, _imageFile!)
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Image upload Success"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imageFile != null
                  ? Image.file(_imageFile!)
                  : Text("No image selected.."),
              ElevatedButton(onPressed: pickImage, child: Text("Pick Image")),
              ElevatedButton(onPressed: uploadImage, child: Text("Upload")),
              SizedBox(
                height: 55,
              )
            ],
          ),
        ),
      ),
    );
  }
}
