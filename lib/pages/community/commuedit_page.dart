import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xculturetestapi/data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:xculturetestapi/navbar.dart';

class EditCommuPage extends StatefulWidget {
  const EditCommuPage({ Key? key }) : super(key: key);

  @override
  _EditCommuPageState createState() => _EditCommuPageState();
}

class _EditCommuPageState extends State<EditCommuPage>{

  List<String> items = ["1","2","3","4","5","6","7","8","9","10"];
  bool isPrivate = false;
  String valueChoose = "1";
  int j = 1;
  
  final TextEditingController _topic = TextEditingController();
  final TextEditingController _catagory = TextEditingController();
  final TextEditingController _thumbnail = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  bool? incognito;

  // List<Tag> arr = [];
  // Future<List<Tag>>? tags;

  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   tags = getTags();
  // }

  @override
  Widget build(BuildContext context) {
    final forumDetail = ModalRoute.of(context)!.settings.arguments as Forum;

    // if(incognito == null) {
    //   _title.text = forumDetail.title;
    //   _subtitle.text = forumDetail.subtitle;
    //   _thumbnail.text = forumDetail.thumbnail;
    //   _content.text = forumDetail.content;
    //   incognito = forumDetail.incognito;
    //   arr = forumDetail.tags;
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Community",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, forumDetail.id);
          return false;
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  TextFormField(
                    controller: _topic,
                    decoration: const InputDecoration(
                      labelText: "Topic",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter community's thumbnail url";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _catagory,
                    decoration: const InputDecoration(
                      labelText: "Catagory",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter community's thumbnail url";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _thumbnail,
                    decoration: const InputDecoration(
                      labelText: "Upload Thumbnail URL",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter community's thumbnail url";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  // const SizedBox(height: 20),
                  // FutureBuilder<List<Tag>>(
                  //   future: tags,
                  //   builder: (BuildContext context, AsyncSnapshot<List<Tag>> snapshot) {
                  //     if(snapshot.hasData) {
                  //       return Row(
                  //         children: [
                  //           const Text("Add Tags"),
                  //           const SizedBox(width: 20),
                  //           FindDropdown<Tag>(
                  //             items: snapshot.data,
                  //             onChanged: (item) {
                  //               setState(() {
                  //                 if(!arr.contains(item)){
                  //                   arr.add(item!);
                  //                 }
                  //               });
                  //             },
                  //             // ignore: deprecated_member_use
                  //             searchHint: "Search here",
                  //             backgroundColor: Colors.white,
                  //           ),
                  //         ],
                  //       );
                  //     }
                  //     else {
                  //       return const CircularProgressIndicator();
                  //     }
                  //   }
                  // ),
                  // const SizedBox(height: 20),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Wrap(
                  //     children: arr.map((e) => Padding(
                  //       padding: const EdgeInsets.only(right: 10),
                  //       child: Chip(
                  //         label: Text(e.name),
                  //         deleteIcon: const Icon(Icons.clear),
                  //         onDeleted: () {
                  //           setState(() {
                  //             arr.remove(e);
                  //           });
                  //         },
                  //       ),
                  //     )).toList(),
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  TextFormField(
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    controller: _desc,
                    decoration: const InputDecoration(
                      hintText: "Description",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's description";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  // const SizedBox(height: 20),
                  // SwitchListTile(
                  //   title: const Text("Incognito"),
                  //   activeColor: Theme.of(context).primaryColor,
                  //   subtitle: const Text("If incognito is on this post will hide author/owner username."),
                  //   value: incognito!, 
                  //   onChanged: (selected){
                  //     setState(() {
                  //       incognito = !incognito!;
                  //     });
                  //   }
                  // ),
                  SwitchListTile(
                    title: const Text("Private"),
                    activeColor: Theme.of(context).primaryColor,
                    subtitle: const Text("If private is on, anyone who want to join this community must have to answer the questions from you first."),
                    value: isPrivate, 
                    onChanged: (selected){
                      setState(() {
                        isPrivate = !isPrivate;
                      });
                    }
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: isPrivate,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("Question amount",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20),
                            DropdownButton(
                              //hint: const Text("Select Items : "),
                              value: valueChoose,
                              items: items.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(), 
                              onChanged: (value) {
                                setState(() {
                                  valueChoose = value.toString();
                                  j = int.parse(valueChoose);
                                });
                              }
                            )
                          ],
                        ),
                        Column(
                          children: [
                            for(int i = 1; i <= j; i++)
                              Text("Add Question $i"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 50),
                    ),
                    onPressed: (){
                      // if(_formKey.currentState!.validate()) {
                      //   updateForumDetail(forumDetail.id, _title.text, _subtitle.text, _thumbnail.text, _content.text, incognito!, arr);
                      //   Fluttertoast.showToast(msg: "Your post has been updated.");
                      //   Navigator.pop(context, forumDetail.id);
                      // }
                    }, 
                    child: const Text("Edit Community")
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            )
          )
        )
      ),
      bottomNavigationBar: Navbar.navbar(context, 3),
    );
  }

  updateForumDetail(int forumID, String title, String subtitle, String thumbnailUrl, String content, bool incognito, List<Tag> tags) async {
    List<int> tagsID = [];
    for (var tag in tags) {
      tagsID.add(tag.id);
    }

    final response = await http.put(
      Uri.parse('http://10.0.2.2:3000/forums/$forumID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'subtitle': subtitle,
        'thumbnail': thumbnailUrl,
        'content': content,
        'incognito': incognito,
        'tags': tagsID,
      }),
    );
    
    if (response.statusCode == 200) {

    }
    else {
      throw Exception("Error");
    }
  }

  Future<List<Tag>> getTags() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/tags'));
    final List<Tag> tagList = [];
    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => tagList.add(Tag.fromJson(obj)));
      return tagList;
    }
    else {
      throw Exception(response.statusCode);
    }

  }
}