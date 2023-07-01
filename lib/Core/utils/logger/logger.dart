import 'dart:developer';

class Logger {
  static printLog(dynamic value) {
    log('----------------------------------------------------------------');
    log(value.toString());
    log('----------------------------------------------------------------');
  }
}
