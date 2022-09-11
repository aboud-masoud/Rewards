import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class HomeBannerView extends StatelessWidget {
  const HomeBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BannerCarousel(
        activeColor: const Color(0xff419aff),
        customizedBanners: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Image.network(
              "https://89d3418c991f5e2860bd-15672119d9b4bc1844e40e82092f0e71.ssl.cf3.rackcdn.com/1570091171_house_to_rent.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfV5kTDTbz_6GqRkKJW9YtX2heavQO08urvQ&usqp=CAU",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Image.network(
              "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj06gOdZXaJgwO5hnWi2wmpaPcXqojKCN-YGg-Sp2Ks-I-uYw9DxeUgKwr_iTsDyxFaceILbqsIh3KHrk7NzbBGK_wXAgXf0UONjRzA87mOZYAcTNYedkYIimL3i0RgC6i5_j7inTZmW2klXh-IfTIRJIAkljlsAvY3p0rI2jnZUEHaF5qcQbOSN8zi/s640/Genshin%20Impact%202.7%20banners%20characters.webp",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Image.network(
              "https://thumbs.dreamstime.com/b/spring-nature-blossom-web-banner-header-24752960.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
