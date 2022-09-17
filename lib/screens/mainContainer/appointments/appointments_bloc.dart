import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentsBloc {
  final CollectionReference appointments = FirebaseFirestore.instance.collection('Appointments');
}
