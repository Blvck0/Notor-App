// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notor_/app/data/models/note.dart';
import 'package:notor_/app/data/models/note_store.dart';
import 'package:notor_/app/data/models/notesoperation.dart';
import 'package:notor_/app/data/services/note_services.dart';
import 'package:notor_/app/presentation/screens/add_screen.dart';
import 'package:notor_/app/presentation/screens/edit_screen.dart';
import 'package:notor_/core/utils/color.dart';
import 'package:notor_/core/utils/widgets/notecard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void dispose() {
    Hive.box('notes').close();
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Note> _notes = NotesStore.getNotes();

  @override
  void initState() {
    super.initState();
    var allnote = NoteService().getNote();
    print(allnote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: Icon(
          Icons.note_add,
          size: 30,
          color: kWhiteColor,
        ),
        backgroundColor: kDarkVioletColor,
      ),
      backgroundColor: kFushiaColor,
      appBar: AppBar(
        title: Text(
          'NOTOR',
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kDarkVioletColor,
      ),
      body: Consumer<NotesOperation>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.getNotes.length,
            itemBuilder: (context, index) {
              return NotesCard(
                note: value.getNotes[index],
                onTap: () async {
                  Note? note = await showDialog(
                    context: context,
                    builder: (context) {
                      return NotesDialog(
                        note: value.getNotes[index],
                        isEditing: true,
                      );
                    },
                  );
                  setState(() {
                    if (note != null) {
                      value.getNotes.removeAt(index);
                      value.getNotes.insert(index, note);
                    }
                  });
                },
                onDeletePressed: () {
                  setState(() {
                    
                    NoteService().delNote();
                  
                    value.getNotes.removeAt(index);
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
