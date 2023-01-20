import 'package:flutter/material.dart';
import 'package:todoapp/login_screen/login_screen.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
   backgroundColor: Colors.transparent,
      child:ListView(
        children: [
          UserAccountsDrawerHeader(
          decoration: BoxDecoration(
          color: Colors.transparent,
          ),
      accountName:Text("Pritul"),
      accountEmail: Text("Pritulj@zignuts.com"),
         currentAccountPicture:CircleAvatar(
           child:ClipOval(child:Image.asset("assets/profile.jpeg",
           width: 100,
           height: 100,
           fit: BoxFit.cover,
           )
         ))),
         InkWell(
           onTap: (){

           },
           child: ListTile(
              title: Text("Profile",style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.person,color: Colors.white,),
            ),
         ),
          ListTile(
            title: Text("Favorites",
            style: TextStyle(color: Colors.white),),
            trailing: Icon(Icons.favorite,color: Colors.white,),
          ),
          ListTile(
            title: Text("Feedback",
              style: TextStyle(color: Colors.white),),
            trailing: Icon(Icons.feedback,color: Colors.white,),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInscreen()));
            },
            child: ListTile(
              title: Text("Logut",
              style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.logout,color: Colors.white,),
            ),
          )
        ],
    )




    );

  }
}
