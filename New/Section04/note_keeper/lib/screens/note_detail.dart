import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_keeper/models/note.dart';
import 'package:note_keeper/utils/database_helper.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class NoteDetail extends StatefulWidget {
  final String appbarTitle;
  final Note note;

  NoteDetail(this.note, this.appbarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.note, this.appbarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  static var _priorities = ["High", "Low"];
  Note note;
  String appbarTitle;

  NoteDetailState(this.note, this.appbarTitle);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    titleController.text = note.title;
    descriptionController.text = note.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return WillPopScope(
      onWillPop: () {
        gotoBackScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.appbarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              gotoBackScreen();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: DropdownButton(
                  items: _priorities.map((String listItemPriority) {
                    return DropdownMenuItem<String>(
                      value: listItemPriority,
                      child: Text(listItemPriority),
                    );
                  }).toList(),
                  style: textStyle,
                  value: getPriorityAsString(note.priority),
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      updatePriorityAsInt(valueSelectedByUser);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    updateTitle();
                  },
                  decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (value) {
                    updateDescription();
                  },
                  decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Save",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            _save();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Delete",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            _delete();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void gotoBackScreen() {
    Navigator.pop(context,true);
  }

  void updatePriorityAsInt(String value){
    switch(value){
      case 'High':
        note.priority=1;
        break;
      case 'Low':
        note.priority=2;
        break;
    }
  }

  String getPriorityAsString(int value){
    String priority;
    switch(value){
      case 1:
        priority=_priorities[0];
        break;
      case 2:
        priority=_priorities[1];
        break;
    }
    return priority;
  }

  void updateTitle(){
    note.title=titleController.text;
  }

  void updateDescription(){
    note.description=descriptionController.text;
  }

  void _save() async{

    int result;
    gotoBackScreen();
    note.date=DateFormat.yMMMd().format(DateTime.now());
    if(note!=null){
      //update database
      result=await databaseHelper.updateNote(note);
    }else{
      result=await databaseHelper.insertNote(note);
    }

    if(result!=0){
      _showAlertDialogBox('Status','Note saved successful');
    }else{
      _showAlertDialogBox('Status','Error occured');
    }
  }

  void _delete() async{
    gotoBackScreen();
    if(note!=null){
      _showAlertDialogBox('Status', 'Nothing to Delete');
      return;
    }

    //if there are note to delete
    int result=await databaseHelper.deleteNote(note.id);
    if(result!=0){
      _showAlertDialogBox('Status', 'Note deleted');
    }else{
      _showAlertDialogBox('Status', 'Delete not success');
    }
  }

  void _showAlertDialogBox(String title, String message){
    AlertDialog alertDialog=AlertDialog(
      title: Text(
          title
      ),
      content: Text(
          message
      ),
    );
    showDialog(
        context: context,
      builder: (_)=>alertDialog
    );
  }
}
