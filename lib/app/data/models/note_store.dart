import 'package:hive_flutter/adapters.dart';
import 'package:notor_/app/data/models/note.dart';

class NotesStore {
  static final notes = Hive.box<Note>('notes');

  static void addNote(Note note) {
    notes.add(note);
  }

  static List<Note> getNotes() {
    return notes.values.toList();
  }
}
