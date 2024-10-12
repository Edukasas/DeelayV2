import 'package:flutter/services.dart';

class AppService {
  static const platform = MethodChannel('app_retriever');

  Future<List<Map<String, dynamic>>> getInstalledApps() async {
    try {
      final List<dynamic> apps = await platform.invokeMethod('getAllApps');
      return apps.map((app) {
        return Map<String, dynamic>.from(app);
      }).toList();
    } on PlatformException catch (e) {
      print("Failed to get apps: '${e.message}'.");
      return [];
    }
  }
}
