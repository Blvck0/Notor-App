// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notor_/app/data/models/note.dart';

class NotesDialog extends StatefulWidget {
  final Note? note;
  final bool isEditing;

  NotesDialog({
    this.note,
    this.isEditing = false,
  });

  @override
  State<NotesDialog> createState() => _NotesDialogState();
}

class _NotesDialogState extends State<NotesDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? title;
  String? description;

  @override
  void initState() {
    super.initState();
    title = widget.note?.title;
    description = widget.note?.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        key: _formKey,
        child: Column(
          children: [
            _buildTitleField(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _buildDescriptionField(),
            ),
            TextButton(
              onPressed: () {
                var isValid = _formKey.currentState!.validate();
                if (isValid) {
                  var note = Note(title, description)
                    ..title = title
                    ..description = description;
                  Navigator.pop(context, note);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTitleField() {
    return TextFormField(
      initialValue: title,
      onChanged: (newValue) {
        title = newValue;
      },
    );
  }

  TextFormField _buildDescriptionField() {
    return TextFormField(
      initialValue: description,
      onChanged: (newValue) {
        description = newValue;
      },
    );
  }
}
