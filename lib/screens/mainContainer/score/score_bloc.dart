import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScoreBloc {
  final CollectionReference scores =
      FirebaseFirestore.instance.collection('scores');
  final CollectionReference profilesScore =
      FirebaseFirestore.instance.collection('profilesScores');

  final CollectionReference requestScoreExchange =
      FirebaseFirestore.instance.collection('requestScoreExchange');

  int currentUserScore = 0;

  Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
