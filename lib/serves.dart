

import 'package:http/http.dart' as http;



import 'dart:convert';


import 'data.dart';

class RemoteService {

  Future <List<Post>?> getPosts() async {
    var client = http.Client();
    var url = Uri.parse(
        'https://serene-brushlands-26785.herokuapp.com/products');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var josn = response.body;
      print(json);


      return postFromJson(josn);
    }
  }

}