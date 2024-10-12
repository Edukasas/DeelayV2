import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveCombinedDataToStorage(
      List<Map<String, dynamic>> data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final combinedDataJson = jsonEncode(data);
      await prefs.setString('combinedAppUsageData', combinedDataJson);
      print("Data saved to storage: $combinedDataJson");
    } catch (e) {
      print("Error saving data to storage: $e");
    }
  }

  Future<List<Map<String, dynamic>>> loadCombinedDataFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final combinedDataJson = prefs.getString('combinedAppUsageData');

      if (combinedDataJson != null) {
        List<dynamic> combinedData = jsonDecode(combinedDataJson);
        return List<Map<String, dynamic>>.from(combinedData);
      } else {
        print("No data found in storage.");
        return [];
      }
    } catch (e) {
      print("Error loading data from storage: $e");
      return [];
    }
  }

  Future<void> clearStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('combinedAppUsageData');
    } catch (e) {
      print("Error clearing data from storage: $e");
    }
  }
}
