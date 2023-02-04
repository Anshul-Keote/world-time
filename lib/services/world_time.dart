import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location; //location name for UI
  late String time;// the time in that location
  late String flag ;// url to asset Flag
  late String url;// location url for an endpoint
  bool isDay = true;// to check if day or night to update background img

  WorldTime({required this.location ,required this.flag, required this.url});
  Future<void> getTime() async{

    try{

      //Making a request
      var tempURL = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(tempURL);
      dynamic data =jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String hour_offset = data['utc_offset'].substring(1,3);
      String min_offset = data['utc_offset'].substring(4,6);
      print(hour_offset);
      print(min_offset);

      //create the DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(hour_offset), minutes: int.parse(min_offset)));

      //set the time property
      time = DateFormat.jm().format(now);
      isDay= (now.hour > 6 && now.hour<18 );

    }//try for error

    catch (e){
      print('errorrr!!!!! : $e');
      time = 'Could not get time';
    }//catch
    
  }//getTime()
}

