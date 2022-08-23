import 'dart:async';
import 'dart:io';

class NetworkInfoService {
  Future<bool> isConnected() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  }
}
