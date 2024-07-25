import 'package:internet_connection_checker/internet_connection_checker.dart';

extension InternetConnectionStatusX on InternetConnectionStatus {
  bool get connected {
    return (this == InternetConnectionStatus.connected);
  }
}
