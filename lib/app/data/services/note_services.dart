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
  get setState => null;

  // Future<Tuple2<CreateNote?, String?>> createNote(String title, String description) async {
  //   final url = Uri.parse(postNoteRequest);

  //   try {
  //     var response = await http.post(url,
  //     body: title , description );
  //     if (response.statusCode == 201) {
  //       CreateNote data = CreateNote.fromJson(json.decode(response.body));
  //       return Tuple2(data, null);
  //       print(data);
  //     } else {
  //       return Tuple2(null, "unable to create note");
  //       print("unable to create note");
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       return Tuple2(null, "No Internet Connection");
  //     }
  //     return Tuple2(null, "unable to create note");
  //   }
  // }
  Future<String?> addNote(String title, String description) async {
    final url = Uri.parse(postNoteRequest);

    try {
      var response = await http
          .post(url, body: {"title": title, "description": description});
      var data = response.body;
      print(data);

      if (response.statusCode == 201) {
        String responseString = response.body;
        CreateNote.fromJson(json.decode(responseString));
        print(responseString);
      } else {
        return 'unable to create note';
      }
      return null;
    } catch (e) {
      if (e is SocketException) {
        return 'no internet connection';
      }
      return 'unable to add note';
    }
  }

  Future delNote() async {
    final url = Uri.parse(delNoteRequest);

    try {
      var response = await http.post(url);
      if (response.statusCode == 201) {
        CreateNote data = CreateNote.fromJson(json.decode(response.body));
        return response.body;
        print(response.body);
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

  // Future getNote() async {
  //   final url = Uri.parse(getNoteRequest);

  //   try {
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       CreateNote data = CreateNote.fromJson(json.decode(response.body));
  //       return response.body;
  //       print(data);
  //     } else {
  //       return "unable to edit note";
  //       print("unable to edit note");
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       return "No Internet Connection";
  //     }
  //     return "unable to edit note";
  //   }
  // }

  // Future getNote() async {
  //   final url = Uri.parse(getNoteRequest);
  //   try {
  //     var response = await http.get(url);
  //     var jsonData = jsonDecode(response.body) as List;
  //   } catch (e) {
  //     return null;
  //   }
  // }
  static Future<Tuple2<List<CreateNote>?, String?>> getNote() async {
    final url = Uri.parse(getNoteRequest);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        List<CreateNote> userModelList = List<CreateNote>.from(
            result["showAll_Note"].map((model) => CreateNote.fromJson(model)));
        return Tuple2(userModelList, null);
      } else {
        return const Tuple2(null, "unable to get User data");
      }
    } catch (e) {
      if (e is SocketException) {
        return const Tuple2(null, "No Internet Connection");
      }
      return const Tuple2(null, "unable to get User data");
    }
  }
}
