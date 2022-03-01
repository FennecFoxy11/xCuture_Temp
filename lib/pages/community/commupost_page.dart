import 'package:flutter/material.dart';
import 'package:xculturetestapi/pages/community/commudetail_page.dart';
import 'package:xculturetestapi/widgets/textform_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommuPostPage extends StatefulWidget {
  const CommuPostPage({ Key? key }) : super(key: key);

  @override
  _CommuPostPageState createState() => _CommuPostPageState();
}

class _CommuPostPageState extends State<CommuPostPage> {

  List<String> items = ["1","2","3","4","5","6","7","8","9","10"];
  bool isPrivate = false;
  String valueChoose = "1";
  int j = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading: const Icon(Icons.arrow_back),
          title: const Text("Create Community",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextForm(label: "Topic"),
                TextForm(label: "Catagory"),
                // Row(
                //   children: [
                //     const Text("Upload Thumbnail", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                //     IconButton(onPressed: (){}, icon: const Icon(Icons.upload_file)),
                //   ],
                // ),
                TextForm(label: "Upload Thumbnail URL"),
                TextForm(label: "Description", isMultiText: true),
                const SizedBox(height: 20),
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
                            TextForm(label: "Add Question $i"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommuDetailPage(),
                      )
                    );
                    // Fluttertoast.showToast(msg: "Your community have been created.");
                  }, 
                  child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text("Post Now")
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}