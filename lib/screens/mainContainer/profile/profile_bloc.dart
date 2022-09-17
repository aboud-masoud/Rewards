import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBloc {
  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');
  DocumentReference profilesgRef = FirebaseFirestore.instance.collection('profiles').doc();
  ValueNotifier<XFile?> imageValue = ValueNotifier<XFile?>(null);
  final ImagePicker picker = ImagePicker();

  Future<void> saveImages(File _images, DocumentReference ref) async {
    // String imageURL = await uploadFile(_images);
    // ref.update({
    //   "images": FieldValue.arrayUnion([imageURL])
    // });
  }

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
