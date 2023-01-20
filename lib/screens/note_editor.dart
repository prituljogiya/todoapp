import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/style/app_style.dart';
import 'package:intl/intl.dart';

import '../home_screen/home_screen.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);
  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}
class _NoteEditorScreenState extends State<NoteEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  int color_id=Random().nextInt(AppStyle.cardColor.length);
  String date=DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now()).toString();
  final _mainController=TextEditingController();
  final _titleController=TextEditingController();
  bool validate = false;
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey= GlobalKey<ScaffoldState>();

    return Scaffold(
key: scaffoldKey,
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          " Add New Note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (value) => value!.isEmpty ? 'please enter  note title':null,
                controller: _titleController,
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
                  hintText: "Note title",
                ),
                style: AppStyle.mainTitle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                date,
                style: AppStyle.dateTitle,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'please enter  note content':null,
                controller: _mainController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note content",
                ),
                style: AppStyle.mainContent,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primaryColor,
        onPressed:() async {
          if ( _formKey.currentState!.validate()&&_titleController.text.isNotEmpty && _mainController.text.isNotEmpty? validate = true :validate=false) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const HomeScreen()));
          }
          FirebaseFirestore.instance.collection("notes").add({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text,
            "color_id": color_id
          }).then((value){
            print(value.id);
          }).catchError((error) => print("failed to add note due to " + error));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}