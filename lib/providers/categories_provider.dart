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
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print('Error al cargar categoria');
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};

    try {
      await CafeApi.put('/categorias/$id', data);

      categories = categories.map((c) {
        if (c.id != id) {
          return c;
        }
        c.nombre = name;
        return c;
      }).toList();

      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print('Error al cargar categoria');
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.delete('/categorias/$id', {});
      categories.removeWhere((c) => c.id == id);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print('Error al cargar categoria');
    }
  }
}
