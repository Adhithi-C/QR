import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void profile() async{
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/profile/rollno');
    var response = await http.get(uri,
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Column(
        children: [
          SizedBox(height: 80,),
          CircleAvatar(
            backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqwv5A4tJOjuasrfjRAS5Y8sNztacmllwBaA&usqp=CAU'),
            radius: 75,
          ),
          Text('Elena Gilbirt',style:TextStyle(color: Colors.white )),
          Text('UI/UX Designer'),
          SizedBox(height: 40,),
          Container(
              padding:EdgeInsets.all(10) ,
              margin: EdgeInsets.symmetric(horizontal: 120),
              decoration: BoxDecoration(color: Colors.white),
              child:Row(
                children: [
                  Icon(Icons.phone,color: Colors.teal,),
                  SizedBox(width: 20,),
                  Text('+918075024734'),
                ],
              )

          ),
          SizedBox(height: 40,),
          Container(
              padding:EdgeInsets.all(10) ,
              margin: EdgeInsets.symmetric(horizontal: 120),
              decoration: BoxDecoration(color: Colors.white),
              child:Row(
                children: [
                  Icon(Icons.email,color: Colors.teal,),
                  SizedBox(width: 20,),
                  Text('fadhfpin@gmail.com'),
                ],
              )

          ),
        ],
      ),
    );
  }
}
