import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'https://countryflagsapi.com/png/England'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'https://countryflagsapi.com/png/Greece'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://countryflagsapi.com/png/Egypt'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://countryflagsapi.com/png/Kenya'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'https://countryflagsapi.com/png/USA'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'https://countryflagsapi.com/png/USA'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://countryflagsapi.com/png/KR'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'https://countryflagsapi.com/png/India'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://countryflagsapi.com/png/Indonesia'),
  ];


  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,});
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState ran');
  }

  @override
  Widget build(BuildContext context) {
    print('build func ran');
    return Scaffold(
      body: ListView.builder(
        itemCount: locations.length ,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.fromLTRB(8.0,4,8,4),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(locations[index].flag),
                ),
                ),
              ),
          );
        }
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a location'
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );

  }
}
