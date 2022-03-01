import 'package:flutter/material.dart';
import 'package:xculturetestapi/navbar.dart';
import 'package:xculturetestapi/pages/event/eventpost_page.dart';

class EventPage extends StatefulWidget {
  const EventPage({ Key? key }) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Event",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        )
      ),
      body: Container(
        child: const Center(
          child: Text("Event Page"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EventPostPage(),
            )
          );
        },
        child: const Icon(Icons.add_location_alt_outlined)
      ),
      bottomNavigationBar: Navbar.navbar(context, 0),
    );
  }
}