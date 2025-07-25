import 'package:flutter/material.dart';
import 'global_data.dart';

class ViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Data")),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12), // Add padding around the whole list
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
              child: Text(
                '$key: $value',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
