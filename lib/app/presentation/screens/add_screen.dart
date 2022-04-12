// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'dart:math';
import 'dart:ui';
import 'package:notor_/app/data/models/note_model.dart';
import 'package:notor_/app/data/services/note_services.dart';
import 'package:notor_/core/utils/color.dart';
import 'package:notor_/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:notor_/app/data/models/notesoperation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? titleText;
    String? descriptionText;
    return Scaffold(
      backgroundColor: kHotPinkColor,
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Title',
                hintStyle: kTitleHintStyle,
              ),
              style: kTitleTextStyle,
              onChanged: (value) {
                titleText = value;
              },
            ),
            Expanded(
              child: TextField(
                controller: _description,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Description',
                  hintStyle: kDescriptionHintStyle,
                  constraints: BoxConstraints.expand(),
                ),
                style: kDescriptionTextStyle,
                maxLines: 100,
                onChanged: (value) {
                  descriptionText = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<NotesOperation>(context, listen: false)
                    .addNewNote(titleText!, descriptionText!);
                Navigator.pop(context);
              },
              child: Text(
                'Add Note',
                style: kButtonTextStyle,
              ),
              style: ButtonStyle(),
            )
          ],
        ),
      ),
    );
  }
}
