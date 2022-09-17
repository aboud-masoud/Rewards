import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBloc {
  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');
  ValueNotifier<XFile?> image = ValueNotifier<XFile?>(null);
  final ImagePicker picker = ImagePicker();
}
