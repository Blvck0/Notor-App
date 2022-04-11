// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'dart:io';
import 'package:notor_/app/data/models/note_model.dart';

const String apiKEY = "newNote";
const String baseURL = "https://nba-notes.herokuapp.com/api/v1/";

Future<Tuple2<CreateNote?, String?>> getNote() async { 
  final url = Uri.parse(baseURL + apiKEY);

  try {
    var response = await http.get(url);
     if (response.statusCode == 200) {
        CreateNote data = CreateNote.fromJson(json.decode(response.body));
        return Tuple2(data, null);
      } else {
        return Tuple2(null, "unable to create note");
      }
  } catch (e) {
     if (e is SocketException) {
        return Tuple2(null, "No Internet Connection");
      }
      return Tuple2(null, "unable to create note");
  }
}
