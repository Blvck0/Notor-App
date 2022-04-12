// ignore_for_file: prefer_const_constructors, avoid_print, dead_code

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'dart:io';
import 'package:notor_/app/data/models/note_model.dart';

const String baseURL = "https://nba-notes.herokuapp.com";
const String postNoteRequest = baseURL + "/api/v1/newNote";
const String getNoteRequest = baseURL + "/api/v1/allNote";
const String delNoteRequest = baseURL + "/api/v1/removeNote";
const String editNoteRequest =
  baseURL + "/api/v1/noteUpdate/62138427dd92fd841280e055";

class NoteService {
  Future<Tuple2<CreateNote?, String?>> createNote() async {
    final url = Uri.parse(postNoteRequest);

    try {
      var response = await http.post(url);
      if (response.statusCode == 201) {
        CreateNote data = CreateNote.fromJson(json.decode(response.body));
        return Tuple2(data, null);
        print(data);
      } else {
        return Tuple2(null, "unable to create note");
        print("unable to create note");
      }
    } catch (e) {
      if (e is SocketException) {
        return Tuple2(null, "No Internet Connection");
      }
      return Tuple2(null, "unable to create note");
    }
  }

  Future delNote() async {
    final url = Uri.parse(delNoteRequest);

    try {
      var response = await http.post(url);
      if (response.statusCode == 201) {
        CreateNote data = CreateNote.fromJson(json.decode(response.body));
        return response.body;
        print(data);
      } else {
        return "unable to delete note";
        print("unable to delete note");
      }
    } catch (e) {
      if (e is SocketException) {
        return "No Internet Connection";
      }
      return "unable to delete note";
    }
  }

  Future editNote() async {
    final url = Uri.parse(editNoteRequest);

    try {
      var response = await http.post(url);
      if (response.statusCode == 201) {
        CreateNote data = CreateNote.fromJson(json.decode(response.body));
        return response.body;
        print(data);
      } else {
        return "unable to edit note";
        print("unable to edit note");
      }
    } catch (e) {
      if (e is SocketException) {
        return "No Internet Connection";
      }
      return "unable to edit note";
    }
  }

  Future getNote() async {
    final url = Uri.parse(getNoteRequest);

    try {
      var response = await http.post(url);
      if (response.statusCode == 201) {
        CreateNote data = CreateNote.fromJson(json.decode(response.body));
        return response.body;
        print(data);
      } else {
        return "unable to edit note";
        print("unable to edit note");
      }
    } catch (e) {
      if (e is SocketException) {
        return "No Internet Connection";
      }
      return "unable to edit note";
    }
  }
}
