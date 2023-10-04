import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

Future<dynamic> fetchBlogs() async {
  const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  const String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-hasura-admin-secret': adminSecret,
      },
    );

    if (response.statusCode != 200) {
      Toast.show(
        "Unknown Error Occured",
        duration: Toast.lengthLong,
        gravity: Toast.top,
        backgroundColor: Colors.red,
        textStyle: const TextStyle(color: Colors.white),
      );
    }
    final blogs = jsonDecode(response.body)['blogs'];
    var random = Random();

    if (blogs.length > 30) {
      var randomBlogs =
          List.generate(30, (index) => blogs[random.nextInt(blogs.length)]);
      return randomBlogs;
    }
  } catch (e) {
    Toast.show(
      "Unknown Error Occured",
      duration: Toast.lengthLong,
      gravity: Toast.top,
      backgroundColor: Colors.red,
      textStyle: const TextStyle(color: Colors.white),
    );
    return e;
  }
}
