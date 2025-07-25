import 'package:flutter/material.dart';
import 'global_data.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final keyController = TextEditingController();
  final valueController = TextEditingController();

  void handleSubmit() {

    final key = keyController.text.trim();
    final value = valueController.text.trim();

    if (key.isNotEmpty && value.isNotEmpty) {
      setState(() {
        globalDataMap[key]= value;
        keyController.clear();
        valueController.clear();
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data added successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Records')),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: globalDataMap.isEmpty
                  ? Center(
                child: Text(
                  'No data added yet',
                  style: TextStyle(color: Colors.white54),
                ),
              )
                  : ListView.builder(
                itemCount: globalDataMap.length,
                itemBuilder: (context, index) {
                  final key = globalDataMap.keys.elementAt(index);
                  final value = globalDataMap.values.elementAt(index);
                  final color = rowColors[index % rowColors.length];
                  return Card(
                    color: color,
                    child: ListTile(
                      title: Text('$key: $value',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) => Padding(
              //padding: EdgeInsets.all(16),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Pushes up modal with keyboard
                left: 16,
                right: 16,
                top: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: keyController,
                      decoration: InputDecoration(
                        labelText: 'Key',
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: valueController,
                      decoration: InputDecoration(
                        labelText: 'Value',
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        handleSubmit();
                        Navigator.pop(context); // Close the modal
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
