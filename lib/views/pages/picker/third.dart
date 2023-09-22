import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import './googlelocationsearch.dart';

class ImageTransferPage extends StatefulWidget {
  final Uint8List image;

  ImageTransferPage(this.image);

  @override
  _ImageTransferPageState createState() => _ImageTransferPageState();
}

class _ImageTransferPageState extends State<ImageTransferPage> {
  bool _isCommentingTurnedOn = false;
  bool _isLikingTurnedOn = false;
  bool _isTwitterTurnedOn = false;

  DateTime _selectedDate = DateTime.now();
  String? _selectedLocation;

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New Post",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => {},
            child: Text(
              'Next',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE9E8E8),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
              label: "Home", icon: Image.asset('assets/img/home.png')),
          BottomNavigationBarItem(
              label: "Multi-User", icon: Image.asset('assets/img/user.png')),
          BottomNavigationBarItem(
              label: "Plus", icon: Image.asset('assets/img/plus.png')),
          BottomNavigationBarItem(
              label: "Alram", icon: Image.asset('assets/img/alram.png')),
          BottomNavigationBarItem(
              label: "User", icon: Image.asset('assets/img/multi_user.png'))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.memory(widget.image,
                    height: 80, width: 120), // image here
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        hintText: "Share the story...",
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          ListTile(
            // leading: Text("Date"),
            title: Text(DateFormat('dd MMMM yyyy').format(_selectedDate)),
            trailing: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                );
                if (picked != null && picked != _selectedDate)
                  setState(() {
                    _selectedDate = picked;
                  });
              },
            ),
          ),
          SwitchListTile(
            title: Text(_isCommentingTurnedOn
                ? "Turn off Commenting"
                : "Turn on Commenting"),
            value: _isCommentingTurnedOn,
            onChanged: (bool value) {
              setState(() {
                _isCommentingTurnedOn = value;
              });
            },
          ),
          SwitchListTile(
            title:
                Text(_isLikingTurnedOn ? "Turn off Liking" : "Turn on Liking"),
            value: _isLikingTurnedOn,
            onChanged: (bool value) {
              setState(() {
                _isLikingTurnedOn = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(
                _isTwitterTurnedOn ? "Turn off Twitter" : "Turn on Twitter"),
            value: _isTwitterTurnedOn,
            onChanged: (bool value) {
              setState(() {
                _isTwitterTurnedOn = value;
              });
            },
          ),
          ListTile(
            leading: Text(
              "Location",
              style: TextStyle(fontSize: 17),
            ),
            title: InkWell(
              onTap: () async {
                _selectedLocation = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationSearchScreen()));
                setState(() {});
              },
              child: _selectedLocation == null
                  ? Text(
                      'Select a location',
                      style: TextStyle(color: Colors.grey),
                    )
                  : Text(_selectedLocation!),
            ),
          ),
        ],
      ),
    );
  }
}
