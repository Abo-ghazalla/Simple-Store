import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasNetworkConnection() async {
  final res = await Connectivity().checkConnectivity();
  if (res == ConnectivityResult.wifi || res == ConnectivityResult.mobile) {
    return true;
  } else {
    return false;
  }
}
