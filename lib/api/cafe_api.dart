import 'package:dio/dio.dart';

import 'package:admin_dashboard/services/local_storage.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base del url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw ('Error en el GET');
    }
  }
}
