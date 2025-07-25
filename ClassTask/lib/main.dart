import 'package:flutter/material.dart';
import 'viewscreen.dart';
import 'addscreen.dart';
import 'updatescreen.dart';
import 'deletescreen.dart';

void main() {
  runApp(ClassTaskApp());
}

class ClassTaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClassTask',
      theme: ThemeData.dark(), // Black background and dark theme
      home: MainMenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuButtons = [
    {
      'label': 'View',
      'color': Colors.deepPurpleAccent,
      'screen': ViewScreen(),
    },
    {
      'label': 'Add',
      'color': Colors.tealAccent,
      'screen': AddScreen(),
    },
    {
      'label': 'Update',
      'color': Colors.orangeAccent,
      'screen': UpdateScreen(),
    },
    {
      'label': 'Delete',
      'color': Colors.pinkAccent,
      'screen': DeleteScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlutterMap Demo')),
      backgroundColor: Colors.black,
      body: Center(
        child: GridView.count(
          shrinkWrap: true, // Makes the GridView take minimal space
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
          padding: EdgeInsets.all(16),
          children: menuButtons.map((item) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item['screen']),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  item['label'],
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
