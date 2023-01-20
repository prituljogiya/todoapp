
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
                onTap: () {
                  CupertinoAlertDialog(
                    title: doc['note_title'],
                    content: doc['note_content'],
                   actions: [
                     CupertinoDialogAction(child: Text("delete")),

                   ],
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