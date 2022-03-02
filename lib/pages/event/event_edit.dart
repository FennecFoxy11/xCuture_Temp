import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xculturetestapi/data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:xculturetestapi/navbar.dart';

class EditEventPage extends StatefulWidget {
  const EditEventPage({ Key? key }) : super(key: key);

  @override
  _EditEventPageState createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage>{
  final TextEditingController _locationname = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _district = TextEditingController();
  final TextEditingController _subdistrict = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _zipcode = TextEditingController();
  final TextEditingController _thumbnail = TextEditingController();
  final TextEditingController _topic = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _date = TextEditingController();
  bool? incognito;

  // List<Tag> arr = [];
  // Future<List<Tag>>? tags;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // tags = getTags();
  }

  @override
  Widget build(BuildContext context) {
    final forumDetail = ModalRoute.of(context)!.settings.arguments as Forum;

    // if(incognito == null) {
    //   _locationname.text = forumDetail.locationname;
    //   _address1.text = forumDetail.address1;
    //   _thumbnail.text = forumDetail.thumbnail;
    //   _content.text = forumDetail.content;
    //   incognito = forumDetail.incognito;
    //   arr = forumDetail.tags;
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Event",
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
                    controller: _locationname,
                    decoration: const InputDecoration(
                      labelText: "Location Name",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's location name";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _address1,
                    decoration: const InputDecoration(
                      labelText: "Address 1",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's address 1";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _address2,
                    decoration: const InputDecoration(
                      labelText: "Address 2",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's address 2";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _subdistrict,
                    decoration: const InputDecoration(
                      labelText: "Sub-District",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's sub-district";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _district,
                    decoration: const InputDecoration(
                      labelText: "District",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's district";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _province,
                    decoration: const InputDecoration(
                      labelText: "Province",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's province";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _zipcode,
                    decoration: const InputDecoration(
                      labelText: "ZIP Code",
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event's zip code";
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
                        return "Please enter event's thumbnail url";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                const SizedBox(height: 20),
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
                      return "Please enter event's thumbnail url";
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      TextFormField(
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        controller: _date,
                        decoration: const InputDecoration(
                          hintText: "Start Date DD/MM/YY",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter event's date";
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.event)),
                      const SizedBox(width: 100),
                    ],
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
                    child: const Text("Edit Event")
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            )
          )
        )
      ),
      bottomNavigationBar: Navbar.navbar(context, 0),
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