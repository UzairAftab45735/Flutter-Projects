import 'package:flutter/material.dart';
import 'global_data.dart';

class DeleteScreen extends StatefulWidget {
  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  void deleteItem(String key) {
    setState(() {
      globalDataMap.remove(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delete Entries')),
      backgroundColor: Colors.black, // Match app theme
      body: Padding(
        padding: const EdgeInsets.all(12), // Outer padding for list
        child: globalDataMap.isEmpty
            ? Center(
          child: Text(
            'No data to delete',
            style: TextStyle(color: Colors.white54),
          ),
        )
            : ListView.separated(
          itemCount: globalDataMap.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            String key = globalDataMap.keys.elementAt(index);
            String value = globalDataMap.values.elementAt(index);

            return Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: rowColors[index % rowColors.length],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '$key: $value',
                      style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => deleteItem(key),
                    child: Text('Delete'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
