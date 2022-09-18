import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

import 'package:rewards_app/utils/global_value.dart';

class ProfileBloc {
  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');
  // DocumentReference profilesgRef = FirebaseFirestore.instance.collection('profiles').doc();
  ValueNotifier<XFile?> imageValue = ValueNotifier<XFile?>(null);
  final ImagePicker picker = ImagePicker();

  Future<void> uploadFile(
    Uint8List filePath,
  ) async {
    String url;

    try {
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': filePath.toString()},
      );
      Reference _storage = FirebaseStorage.instance.ref(userEmail);
      UploadTask uploadTaskSnapshot = _storage.putData(filePath, metadata);
      // var imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      // url = imageUri.toString();
      // await FirebaseStorage.instance.ref().child(userEmail).putData(filePath);
    } catch (e) {
      print(e);
    }
  }

  // Future<String> getDownloadURL() async {
  //   try {
  //     return await FirebaseStorage.instance.ref().child(userEmail).getDownloadURL();
  //   } catch (e) {
  //     return "";
  //   }
  // }

  // Future<void> deleteFile() async {
  //   try {
  //     await FirebaseStorage.instance.ref().child(userEmail).delete();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<String> uploadFile(File image) async {
  //   // Reference storageReference = FirebaseStorage.instance.ref().child('profile/${image.path}');
  //   // UploadTask uploadTask = storageReference.putFile(image);
  //   // String returnURL = "";
  //   // await uploadTask.whenComplete(() async {
  //   //   print('File Uploaded');
  //   //   await storageReference.getDownloadURL().then((fileURL) {
  //   //     returnURL = fileURL;
  //   //   });
  //   // });

  //   return returnURL;
  // }

  // String downloadURLExample() {
  //   String downloadURL = "";
  //   FirebaseStorage.instance.ref('users/123/avatar.jpg').getDownloadURL().then((value) {
  //     return downloadURL;
  //   });
  //   return downloadURL;
  // }
}
