// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notor_/app/data/models/note.dart';
import 'package:notor_/core/utils/color.dart';
import 'package:notor_/core/utils/constants.dart';

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
      backgroundColor: kFushiaColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: kSepiaColor,
          borderRadius: BorderRadius.circular(20),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kSepiaColor,
              
              ),
              onPressed: () {
                var isValid = _formKey.currentState?.validate() ?? true;
                if (isValid) {
                  var note = Note(title!, description!)
                    ..title = title
                    ..description = description;
                  Navigator.pop(context, note);
                }
              },
              child: Text('Save', style: kButtonTextStyle,
              ),
              
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTitleField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter Title',
        hintStyle: kTitleHintStyle,
      ),
      style: kTitleTextStyle,
      initialValue: title,
      onChanged: (newValue) {
        title = newValue;
      },
    );
  }

  TextFormField _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter Description',
        hintStyle: kDescriptionHintStyle,
      ),
      style: kDescriptionTextStyle,
      initialValue: description,
      maxLines: 100,
      onChanged: (newValue) {
        description = newValue;
      },
    );
  }
}
