import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);

    categories = [...categoriesResponse.categorias];

    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final json = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromMap(json);
      categories.add(newCategory);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al cargar categoria');
    }
  }
}
