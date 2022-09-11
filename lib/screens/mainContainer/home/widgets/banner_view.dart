import 'package:banner_carousel/banner_carousel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeBannerView extends StatelessWidget {
  HomeBannerView({Key? key}) : super(key: key);

  final CollectionReference banners = FirebaseFirestore.instance.collection('banners');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: StreamBuilder(
          stream: banners.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData == false) {
              return Container();
            } else {
              return BannerCarousel(
                activeColor: const Color(0xff419aff),
                height: 200,
                customizedBanners: bannerWidgets(streamSnapshot.data!.docs),
              );
            }
          }),
    );
  }

  List<Widget> bannerWidgets(List<QueryDocumentSnapshot<Object?>> docs) {
    List<Widget> list = [];
    int index = 0;

    for (var item in docs) {
      final DocumentSnapshot documentSnapshot = docs[index];
      list.add(
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Image.network(
            documentSnapshot["imageURL"],
            fit: BoxFit.fill,
          ),
        ),
      );
      index = index + 1;
    }

    return list;
  }
}
