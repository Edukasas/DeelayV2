import 'dart:convert';
import 'package:flutter/material.dart';
import '../utils/helpers.dart';
import 'header.dart';
import '../services/app_service.dart';
import 'package:myapp/config/constants/colors.dart';
import '../services/storage_service.dart'; // Import your StorageService

class CategoryCreationWidget extends StatefulWidget {
  const CategoryCreationWidget({super.key});

  @override
  _CategoryCreationWidgetState createState() => _CategoryCreationWidgetState();
}

class _CategoryCreationWidgetState extends State<CategoryCreationWidget> {
  final AppService _appService = AppService();
  final StorageService _storageService = StorageService();
  List<Map<String, dynamic>> _installedApps = [];
  List<bool> _isChecked = [];

  @override
  void initState() {
    super.initState();
    _fetchApps();
  }

  Future<void> _fetchApps() async {
    List<Map<String, dynamic>> apps = await _appService.getInstalledApps();
    setState(() {
      _installedApps = apps;
      _isChecked = List.generate(apps.length, (index) => false);
    });
  }

  Future<void> _saveSelectedApps() async {
    List<Map<String, dynamic>> selectedApps = [];
    for (int i = 0; i < _installedApps.length; i++) {
      if (_isChecked[i]) {
        selectedApps.add(_installedApps[i]);
      }
    }

    final categoryName = 'Work';
    final screenTime = 3600;
    final blockTime = 7200;

    // Print the category details
    print('Category Name: $categoryName');
    print('Selected Apps:');
    for (var app in selectedApps) {
      print('- ${app['name']}');
    }
    print('Screen Time: $screenTime seconds');
    print('Block Time: $blockTime seconds');

    // Save the category
    await _storageService.saveCategoryToStorage(
        categoryName, selectedApps, screenTime, blockTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Container(
        color: const Color(0xFF141218),
        child: Column(
          children: [
            Expanded(
              child: _installedApps.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _installedApps.length,
                      itemBuilder: (context, index) {
                        final app = _installedApps[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _isChecked[index] = !_isChecked[index];
                            });
                          },
                          child: ListTile(
                            leading: app['icon'] != null
                                ? Base64Helper.decodeBase64Icon(app['icon']) !=
                                        null
                                    ? Image.memory(
                                        Base64Helper.decodeBase64Icon(
                                            app['icon'])!,
                                        width: 40,
                                        height: 40,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Deelay.primary,
                                        child: Text(
                                          app['name'][0].toUpperCase(),
                                          style: TextStyle(
                                              color: Deelay.primaryLight),
                                        ),
                                      )
                                : CircleAvatar(
                                    backgroundColor: Deelay.primary,
                                    child: Text(
                                      app['name'][0].toUpperCase(),
                                      style:
                                          TextStyle(color: Deelay.primaryLight),
                                    ),
                                  ),
                            title: Text(
                              app['name'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              app['packageName'],
                              style: const TextStyle(color: Colors.grey),
                            ),
                            trailing: Checkbox(
                              value: _isChecked[index],
                              activeColor: Deelay.pink,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked[index] = value!;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E2E2E),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Deelay.pink),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E2E2E),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      onPressed: _saveSelectedApps, // Call the save function
                      child: Text(
                        'Set limit',
                        style: TextStyle(color: Deelay.pink),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
