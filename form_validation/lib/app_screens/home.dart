import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateHomePage();
  }
}
class _StateHomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RaisedButton(
        onPressed: (){
          _optionsDialogBox();
        },
      ),
    );
  }
  Future<void> _optionsDialogBox(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Take a photo'),
                  onTap: openCamera,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: Text('Select From gallery'),
                  onTap: openGallery,
                )
              ],
            ),
          ),
        );
      }
    );
  }
  openCamera() async{
    var picture=await ImagePicker.pickImage(
      source: ImageSource.camera
    );
    //return picture;
  }
  openGallery() async{
    var gallery=await ImagePicker.pickImage(
      source: ImageSource.gallery
    );
  }
}