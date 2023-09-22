import 'package:flutter/material.dart';


class LocationSearchScreen extends StatefulWidget {
  @override
  _LocationSearchScreenState createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  String? selectedLocation;
  List<String> locationResults = []; // this would be updated based on the results from the API
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    print(_searchController.text);
    // TODO: Call your location search function here
    // This should update your locationResults list
    // For the purpose of this example, let's just use some mock data
    setState(() {
      locationResults = ["Location 1", "Location 2", "Location 3"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black), // This will make the icon color black
          onPressed: () => Navigator.of(context)
              .pop(), // This will navigate to the previous screen
        ),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Search by google...",
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: locationResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(locationResults[index]),
            onTap: () {
              Navigator.pop(context, locationResults[index]);
            },
          );
        },
      ),
    );
  }
}
