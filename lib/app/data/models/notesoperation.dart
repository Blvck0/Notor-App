// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:notor_/app/data/models/note.dart';
import 'package:flutter/material.dart';
import 'package:notor_/app/data/services/note_services.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation() {
    addNewNote("title", "description");
  }

  void addNewNote(String title, String description) {
    Note note = Note(title, description);
    _notes.add(note);
    NoteService().createNote();
    notifyListeners();
    
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    NoteService().delNote();
    notifyListeners();
    
  }

  // List<Note> _notes = [];

  // UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  // int get noteCount => _notes.length;

  // void addNewNote(String title, String description) {
  //   _notes.add(Note(title, description));
  //   notifyListeners();
  // }

  // void deleteNote(Note note) {
  //   _notes.remove(note);
  //   notifyListeners();
  // }
}
