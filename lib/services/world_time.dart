import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time = '';
  String flag;
  String url;
  bool isDayTime = false;

  WorldTime({
   required this.location,
   required this.flag,
   required this.url,
  });

  Future<void> getTime() async {
    try {
      Uri uri = Uri.http('worldtimeapi.org', 'api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      time = DateFormat.jm().format(now);
      print('HOUR ${now.hour}');
      isDayTime = now.hour > 6 && now.hour <= 20 ? true : false;
    } catch (e) {
      time = 'Error data';
    }
  }
}