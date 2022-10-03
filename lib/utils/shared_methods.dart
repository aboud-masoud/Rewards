import 'package:url_launcher/url_launcher.dart';

class SharedMethods {
  bool checkEmailSantax(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  Future<void> openUrl(String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> callNumber(String number) async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: number);

    if (!await launchUrl(phoneLaunchUri)) {
      throw 'Could not launch $phoneLaunchUri';
    }
  }

  Future<void> sendEmail(String email) async {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: email, queryParameters: {'subject': 'Amwaj Center Application'});

    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  Future<void> openMap({required double latitude, required double longitude}) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri(path: googleUrl))) {
      await launchUrl(Uri(path: googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  Map<String, dynamic> handleJsonOfProfile({
    required String email,
    required String fullName,
    required String db,
    required String nationalityAr,
    required String nationalityEn,
    required String genderAr,
    required String genderEn,
    required String address,
    required String mobileNumber1,
    required String mobileNumber2,
    required String firstEvaluationDate,
    required String firstTherapeuticSessionDate,
    required String therapeuticName,
  }) {
    return {
      "email": email,
      "full name": fullName,
      "Date Of Birth": db,
      "NationalityEn": nationalityEn,
      "NationalityAr": nationalityAr,
      "GenderAr": genderAr,
      "GenderEn": genderEn,
      "Address": address,
      "Mobile Number 1": mobileNumber1,
      "Mobile Number 2": mobileNumber2,
      "1 st Evaluation Date": firstEvaluationDate,
      "1 st Therapeutic Session Date": firstTherapeuticSessionDate,
      "Therapeutic Name": therapeuticName,
    };
  }
}
