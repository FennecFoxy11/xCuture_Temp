import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xculturetestapi/arguments.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xculturetestapi/navbar.dart';


class EditCommentPage extends StatefulWidget {
  const EditCommentPage({ Key? key }) : super(key: key);

  @override
  _EditCommentPageState createState() => _EditCommentPageState();
}

class _EditCommentPageState extends State<EditCommentPage> {
  final TextEditingController _content = TextEditingController();
  final TextEditingController _author = TextEditingController();
  bool? _incognito;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EditCommentArguments;
    _author.text = args.comment.author;
    _content.text = args.comment.content;
    (_incognito == null) ? _incognito = args.comment.incognito : _incognito ;


   return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Comment",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        )
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, args.forumID);
          return false;
        },
        
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  maxLines: 3,
                  controller: _content,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: "Content",
                    hintText: "Comment here",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter comment";
                    }
                    else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: const Text("Incognito"),
                  subtitle: const Text("If incognito is on this post will hide author/owner username."),
                  value: _incognito!, 
                  onChanged: (value) {
                    setState(() {
                      _incognito = value;
                    });
                  }
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      updateCommentDetail(args.forumID, args.comment.id, _content.text, _incognito);
                      Fluttertoast.showToast(msg: "Your comment has been updated.");
                      Navigator.pop(context, args.forumID);
                    }
                  }, 
                  child: const Text('Edit Comment'),
                ),
              ],
            )
          ),
        ),
      ),
      bottomNavigationBar: Navbar.navbar(context, 2),
    );
  }

  updateCommentDetail(forumID, commentID, content, incognito) async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:3000/forums/$forumID/comments/$commentID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'content': content,
        'incognito': incognito,
      }),
    );

    if (response.statusCode == 200) {

    }
    else {
      throw Exception(response.statusCode);
    }
  }
}


