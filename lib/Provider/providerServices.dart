import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:joemama/Model/RandomJokes.dart';

class JokeProviderService extends ChangeNotifier{
  RandomJokes? _jokes; //just like arham taught to create a private variable first so that it cannot be accessed and manipulated outside of provider class
  RandomJokes? get jokes => _jokes;
  Future<void> getData()async{
    var url = "https://api.chucknorris.io/jokes/random";
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        _jokes = RandomJokes.fromJson(data);
        notifyListeners();
      }else{
        print('Something went wrong');
      }
    }catch(e){
      print(e.toString());
    }
  }
}