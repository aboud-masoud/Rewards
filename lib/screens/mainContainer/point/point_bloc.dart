import 'package:cloud_firestore/cloud_firestore.dart';

class PointBloc {
  final CollectionReference points =
      FirebaseFirestore.instance.collection('points');
}
