import 'package:flutter/material.dart';
import '../services/app_service.dart';
import '../utils/helpers.dart';

class AppListScreen extends StatefulWidget {
  const AppListScreen({super.key});

  @override
  _AppListScreenState createState() => _AppListScreenState();
}

class _AppListScreenState extends State<AppListScreen> {
  final AppService _appService = AppService();
  List<Map<String, dynamic>> _installedApps = [];

  @override
  void initState() {
    super.initState();
    _getInstalledApps();
  }

  Future<void> _getInstalledApps() async {
    final apps = await _appService.getInstalledApps();
    setState(() {
      _installedApps = apps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Installed Apps'),
      ),
      body: ListView.builder(
        itemCount: _installedApps.length,
        itemBuilder: (context, index) {
          final app = _installedApps[index];
          final iconData = app['icon'] != null && app['icon'].isNotEmpty
              ? Base64Helper.decodeBase64Icon(app['icon'])
              : null;

          return ListTile(
            title: Text(app['name']),
            subtitle: Text(app['packageName']),
            leading: iconData != null
                ? Image.memory(iconData, width: 40, height: 40)
                : const Icon(Icons.error),
          );
        },
      ),
    );
  }
}
