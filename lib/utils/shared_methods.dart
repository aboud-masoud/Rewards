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
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email, queryParameters: {'subject': 'Amwaj Center Application'});

    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch $emailLaunchUri';
    }
  }
}
