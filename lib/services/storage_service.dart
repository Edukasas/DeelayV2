import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveCategoryToStorage(
      String categoryName,
      List<Map<String, dynamic>> selectedApps,
      int screenTime,
      int blockTime) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load the existing categories
      final storedCategoriesJson = prefs.getString('categories');
      List<dynamic> storedCategories =
          storedCategoriesJson != null ? jsonDecode(storedCategoriesJson) : [];

      // Create a new category object
      final newCategory = {
        'categoryName': categoryName,
        'apps': selectedApps,
        'screenTime': screenTime,
        'blockTime': blockTime,
      };

      // Append the new category to the list of categories
      storedCategories.add(newCategory);

      // Save the updated list of categories to storage
      final updatedCategoriesJson = jsonEncode(storedCategories);
      await prefs.setString('categories', updatedCategoriesJson);
      print('Category Name: $categoryName');
      print('Selected Apps:');
      for (var app in selectedApps) {
        print('- ${app['name']}');
      }
      print('Screen Time: $screenTime seconds');
      print('Block Time: $blockTime seconds');
    } catch (e) {
      print("Error saving category to storage: $e");
    }
  }

  Future<List<Map<String, dynamic>>> loadCategoriesFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedCategoriesJson = prefs.getString('categories');

      if (storedCategoriesJson != null) {
        List<dynamic> storedCategories = jsonDecode(storedCategoriesJson);
        return List<Map<String, dynamic>>.from(storedCategories);
      } else {
        print("No categories found in storage.");
        return [];
      }
    } catch (e) {
      print("Error loading categories from storage: $e");
      return [];
    }
  }

  Future<void> clearStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('categories');
      print("All categories removed from storage.");
    } catch (e) {
      print("Error clearing storage: $e");
    }
  }
}
