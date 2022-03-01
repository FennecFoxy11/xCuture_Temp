import 'package:flutter/material.dart';
import 'package:xculturetestapi/navbar.dart';
import 'package:xculturetestapi/pages/community/commupost_page.dart';

class CommuPage extends StatefulWidget {
  const CommuPage({ Key? key }) : super(key: key);

  @override
  _CommuPageState createState() => _CommuPageState();
}

class _CommuPageState extends State<CommuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Community",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        )
      ),
      body: Container(
        child: const Center(
          child: Text("Community Page"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommuPostPage(),
            )
          );
        },
        child: const Icon(Icons.group_add_outlined)
      ),
      bottomNavigationBar: Navbar.navbar(context, 3),
    );
  }
}