import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {

    print(data.isEmpty);
    parameters = ModalRoute.of(context)!.settings.arguments;
    if(data.isEmpty){
      data = jsonDecode(jsonEncode(parameters));
    }
    print(data);

    //set background
    String bgImage = 'https://images.unsplash.com/photo-1553355699-d0bd72e13feb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80';

    if(data['isDay']){
    bgImage='https://images.unsplash.com/photo-1499462817897-fe42dfba9131?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80';
    }
    
    else{
      bgImage='https://images.unsplash.com/photo-1531819177115-428566ccfb50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80';
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(bgImage),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,120,0,0),
                child: TextButton.icon(

                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDay': result['isDay'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,
                    size: 30,
                    color: Colors.white,
                  ),
                  label: Text('Edit Location', style: TextStyle(
                    color: Colors.white,
                  ),
                  ) ,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width:50, height: 50,child: Image.network(data['flag'])),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 70,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
