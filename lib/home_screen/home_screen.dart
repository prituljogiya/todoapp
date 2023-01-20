import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/login_screen/login_screen.dart';
import 'package:todoapp/screens/note_editor.dart';
import 'package:todoapp/screens/reuseable/sidebar.dart';
import 'package:todoapp/signup_screen/signup_screen.dart';
import 'package:todoapp/style/app_style.dart';
import 'package:todoapp/widgets/note_card.dart';

import '../reuseable/sidebar.dart';
import '../screens/note_reader.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search,color: Colors.white,),
            ),
          )
        ],
/*leading: Icon(Icons.person,color: Colors.white,),*/
       /* elevation: 0.0,*/
        title: Text("Notes"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'your notes',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20.0),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("notes").snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  //checking the connection state if we still load the data we can display in progress
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map<Widget>((note) => noteCard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NoteReaderScreen(note),
                                    ));
                              }, note))
                          .toList(),

                    );
                  }
                  return Text(
                    " there are no notes yet",
                    style: GoogleFonts.nunito(color: Colors.white),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteEditorScreen(),
              ));
        },
      label:Text("Add note"),
        icon: Icon(Icons.add),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title) {
    return PopupMenuItem(
      child:  Text(title),
    );
  }
}

