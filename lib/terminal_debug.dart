library terminal_debug;
import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class TerminalDataSender{
  String iPLocalAddress;
  String dataForSend;

  TerminalDataSender({
   @required this.dataForSend,
   @required this.iPLocalAddress
});

  String path = 'file.txt';
  Map jsonData;

  Future sendData()async{
    jsonData = {
      'time': new DateTime.now().toString(),
      'body': dataForSend,
    };
    try{
      HttpClientRequest request = await HttpClient().post(iPLocalAddress, 4040,path)
        ..headers.contentType = ContentType.json
        ..write(jsonEncode(jsonData));
      HttpClientResponse response = await request.close();
      await utf8.decoder.bind(response).forEach(print);
    }catch(error){
      print(error);
    }
  }

}
