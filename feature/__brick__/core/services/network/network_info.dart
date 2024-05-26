import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/constants.dart';
import 'dart:io';


part 'network_info.g.dart';


@Riverpod(keepAlive: true)
INetworkInfo networkInfo(NetworkInfoRef ref) {
  return const NetworkInfo();
}

abstract class INetworkInfo {

  Future<bool> get hasConnection;

}

class NetworkInfo implements INetworkInfo {
  const NetworkInfo();


  @override
  Future<bool> get hasConnection => lookup();

  Future<bool> lookup() async {
    bool hasConnection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (e) {
      hasConnection = false;
      logger.e('not connected, $e');
    }
    logger.i('hasConnection: $hasConnection');
    return hasConnection;
  }
}
