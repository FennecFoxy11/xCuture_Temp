import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xculturetestapi/pages/community/commuedit_page.dart';

class CommuDetailPage extends StatefulWidget {
  const CommuDetailPage({ Key? key }) : super(key: key);

  @override
  _CommuDetailPageState createState() => _CommuDetailPageState();
}

class _CommuDetailPageState extends State<CommuDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Thumbnail Image
              Container(
                margin: const EdgeInsets.only(right: 0, left: 0),
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/yukinon.jpeg"),
                      fit: BoxFit.cover, 
                    ),
                  ),
                ),
              ),
              // Iconbutton back
              Container(
                margin: const EdgeInsets.only(top: 40, left: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),   
              ),
               // Iconbutton menu
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 40, right: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.more_vert),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditCommuPage(),
                          // settings: RouteSettings(
                          //   arguments: snapshot.data,
                          // ),
                        )
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 280, left: 0, right: 0, bottom: 0),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Desc Header
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("Bacon",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.red)
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("Cultural & Theory",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("Created by: Alice in Wonderland",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("December 3, 2021",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      // Division line
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                            height: 1.0,
                            width: 400,
                            color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("Description",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Desc Content
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book?"),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: (){
                          //join
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const Commu,
                          //   )
                          // );
                        }, 
                        child: const SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text("Join")
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ), 
            ],
          ),
        ), 
      ),
    );
  }
}