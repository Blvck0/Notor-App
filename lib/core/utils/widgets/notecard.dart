// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:notor_/app/data/models/note.dart';
import 'package:notor_/core/utils/color.dart';
import 'package:notor_/core/utils/constants.dart';

class NotesCard extends StatelessWidget {
  Note note;
  final Function() onTap;
  final Function() onDeletePressed;

  NotesCard ({
    required this.note,
    required this.onDeletePressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: EdgeInsets.all(15),
    //   padding: EdgeInsets.all(15),
    //   height: 100,
    //   decoration: BoxDecoration(
    //     color: kSepiaColor,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   onLongPress: onLongPress,
    //   trailing: IconButton(
    //     onPressed: onDeletePressed, icon: Icon(
    //       Icons.delete,
    //       size: 20,
    //       color: kRedColor,
    //     ),),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         note!.title,
    //         style: kTitleTextStyle,
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text(
    //         note!.description,
    //         style: kDescriptionTextStyle,
    //       )
    //     ],
    //   ),
    // );

    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 100,
      decoration: BoxDecoration(
        color: kSepiaColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          (note.title)!,
          style: kTitleTextStyle,
        ),
        subtitle: Text(
          (note.description)!,
          style: kDescriptionTextStyle,
        ),
        onTap: onTap,
        trailing: IconButton(
          onPressed: onDeletePressed,
          icon: Icon(
            Icons.delete,
            size: 20,
            color: kRedColor,
          ),
        ),
      ),
    );
  }
}
