import 'package:flutter/material.dart';
import 'note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              gotoBackScreen();
            },
          ),
        ),
        body: getListOfNotes(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToDetail("Add Item");
          },
          tooltip: "Add Note",
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  ListView getListOfNotes() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(
                "Dummy Tile",
              ),
              subtitle: Text("Dummy date"),
              trailing: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                navigateToDetail("Edit Detail");
              },
            ),
          );
        });
  }

  void navigateToDetail(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title);
    }));
  }

  void gotoBackScreen() {
    Navigator.pop(context);
  }
}
