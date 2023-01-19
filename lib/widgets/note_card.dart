



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardColor[doc['color_id']],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              doc['note_title'],
              style: AppStyle.mainTitle,
            ),
            InkWell
              (
                onTap: (){
                  var context;
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                      title:Text("are you deleting this note?"),
                  content: Text("Delete or not"),
                  actions: [
                  TextButton(onPressed: (){
                  print("note delteted");
                  },
                  child: Text("Delete"),),
                  TextButton(onPressed: (){
                  print("cancel pressed");
                  },
                  child: Text("cancle"),),
                  ],
                      )
                  );


              },
                child: Icon(Icons.delete,)),
          ],),
          SizedBox(
            height: 4.0,
          ),
          Text(
            doc['creation_date'],
            style: AppStyle.dateTitle,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            doc['note_content'],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}