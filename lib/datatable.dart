import 'package:flutter/material.dart';

class DataManager extends StatefulWidget {
  const DataManager({super.key});

  @override
  State<DataManager> createState() => _DataManagerState();
}

class _DataManagerState extends State<DataManager> {
  List<Map<String, String>> accounts = [
    {"name": "Boby Sharma", "email": "bobyxxxx@gmail.com", "phone": "9876543210"},
    {"name": "Ravi sahu", "email": "ravi sahu@gmail.com", "phone": "9123456789"},
    {"name": "Samiksha kushwah", "email": "sami1234@gmail.com", "phone": "9988776655"},
  ];

  void showConfirmationSheet(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade200,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Confirm account deletion?',
              style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      accounts.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAccountTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: DataTable(
          dividerThickness: 1,
          decoration: BoxDecoration(
            border: Border(
              left: Divider.createBorderSide(context, width: 1),
              right: Divider.createBorderSide(context, width: 1),
            ),
          ),
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Email")),
            DataColumn(label: Text("Phone")),
            DataColumn(label: Text("Remove")),
            DataColumn(label: Text("Edit")),
          ],
          rows: List.generate(
            accounts.length,
                (index) => DataRow(
              cells: [
                DataCell(Text(accounts[index]['name']!)),
                DataCell(Text(accounts[index]['email']!)),
                DataCell(Text(accounts[index]['phone']!)),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => showConfirmationSheet(index),
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.green),
                    onPressed: () {
                      // Future update logic
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: buildAccountTable(),
        ),
      ),
    );
  }
}