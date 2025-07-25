import 'package:flutter/material.dart';
import 'global_data.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  void updateItem(String key, String newValue) {
    setState(() {
      globalDataMap[key] = newValue;
    });
  }

  void showUpdateDialog(String key, String currentValue) {
    TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update "$key"'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'New Value'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              updateItem(key, controller.text);
              Navigator.of(context).pop();
            },
            child: Text('Update'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Entries')),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12), // Add outer padding
        child: globalDataMap.isEmpty
            ? Center(
          child: Text(
            'No data available',
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
                    onPressed: () => showUpdateDialog(key, value),
                    child: Text('Edit'),
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
