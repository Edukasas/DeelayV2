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

class UsageStatsService {
  final MethodChannel platform;

  UsageStatsService(this.platform);

  Future<List<Map<dynamic, dynamic>>> fetchUsageStats(
      DateTime selectedDate) async {
    try {
      final startDate =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day)
              .millisecondsSinceEpoch;

      final endDate = DateTime(selectedDate.year, selectedDate.month,
              selectedDate.day, 23, 59, 59)
          .millisecondsSinceEpoch;

      final List<dynamic> result = await platform.invokeMethod(
        'getAppUsageStats',
        {'startDate': startDate, 'endDate': endDate},
      );

      if (result != null) {
        return List<Map<dynamic, dynamic>>.from(result);
      } else {
        print('No usage stats found.');
        return [];
      }
    } on PlatformException catch (e) {
      print("Failed to get app usage stats: '${e.message}'");
      return [];
    } catch (e) {
      print("Unexpected error: $e");
      return [];
    }
  }
}
