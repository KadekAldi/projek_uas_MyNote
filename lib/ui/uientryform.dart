import 'package:flutter/material.dart';
import 'package:projek_uas/models/mactivity.dart';

class EntryForm extends StatefulWidget {
  final Activity activity;

  EntryForm(this.activity);

  @override
  EntryFormState createState() => EntryFormState(this.activity);
}

class EntryFormState extends State<EntryForm> {
  Activity activity;

  EntryFormState(this.activity);

  TextEditingController nameController = TextEditingController();
  TextEditingController durasiController = TextEditingController();  

  @override
  Widget build(BuildContext context) {

    if (activity != null) {
      nameController.text = activity.name;
      durasiController.text = activity.durasi;
    }

    return Scaffold(
      appBar: AppBar(
        title: activity == null ? 
        Text('Tambah') : Text('Edit'),
        backgroundColor: Colors.blue,
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
        child: ListView(
          children: <Widget> [
           Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Note',             
                  border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {                  
                                                   
                },
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: durasiController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Time',                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {                  

                },
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (activity == null) {
                          activity = Activity(nameController.text, durasiController.text);
                        } else {
                          activity.name = nameController.text;
                          activity.durasi = durasiController.text;
                        }
                        Navigator.pop(context, activity);
                      },
                    ),
                  ),
                  Container(width: 5.0,),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}