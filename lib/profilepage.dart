import 'package:flutter/material.dart';

class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage({super.key});

  @override
  State<EmployeeProfilePage> createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget profileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.teal),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJnA9dXHbKrIlOVRwBCV6b7hZgw4Q9orFMjA&s'),
                ),
                SizedBox(height: 10),
                Text("Bobby Sharma", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("bobyxxxx@gmail.com", style: TextStyle(color: Colors.white70)),
                Text("App developer intern", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.teal,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.teal,
              tabs: const [
                Tab(icon: Icon(Icons.person), text: "Profile"),
                Tab(icon: Icon(Icons.group), text: "Team"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              profileField("Employee Code", "BY1232"),
                              profileField("Full Name", "Bobby Sharma"),
                              profileField("Date of Joining", "1-Dec-2025"),
                              profileField("Division", "Creative"),
                              profileField("Location", "Pune"),
                              profileField("Department", "Design"),
                              profileField("Designation", "App developer Intern"),
                              profileField("Shift", "Evening"),
                              profileField("Attendance Mode", "Fingerprint"),
                              profileField("Shift Timings", "01:00 - 010:00"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Contact Info", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              profileField("Phone", "9174236688"),
                              profileField("Email", "bobyxxxx@gmail.com"),
                              profileField("Country", "India"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(child: Text("")),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
