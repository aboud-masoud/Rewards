import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileBloc {
  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');
}
