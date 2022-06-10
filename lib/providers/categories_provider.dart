import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';

class CategoriesProvider extends ChangeNotifier {
  List categories = [];

  getCategories() async {
    final res = await CafeApi.httpGet('/categorias');
    print(res);
    notifyListeners();
  }
}
