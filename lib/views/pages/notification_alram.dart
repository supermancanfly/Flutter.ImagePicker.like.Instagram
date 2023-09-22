import 'package:flutter/material.dart';

class NotificationAlram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.00,
        title: const Text(
          "Notification",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Quattrocento",
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Notifocations"),
                SizedBox(
                  width: 50,
                ),
                Text("Inbox")
              ],
            )),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const Row(children: [
                    CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      radius: 20,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('assets/img/small_bg.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text("username",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Quattrocento1",
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 190),
                      child: Icon(Icons.check),
                    )
                  ]),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage('assets/img/small_bg.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("username",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Quattrocento1",
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 190),
                        child: Icon(Icons.check),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage('assets/img/small_bg.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("username",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Quattrocento1",
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage('assets/img/small_bg.png'),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("username",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Quattrocento1")))
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
