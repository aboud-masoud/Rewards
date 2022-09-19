import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rewards_app/utils/global_value.dart';

class ProfileBloc {
  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');
  ValueNotifier<XFile?> imageValue = ValueNotifier<XFile?>(null);
  final ImagePicker picker = ImagePicker();

  Future<void> uploadFile(
    File filePath,
  ) async {
    // String url;

    try {
      var snapshot = await FirebaseStorage.instance.ref().child('images/$userEmail').putFile(filePath);
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
