import 'package:flutter/material.dart';
import 'package:projek_uas/ui/uientryform.dart';
import 'package:projek_uas/models/mactivity.dart';
import 'package:projek_uas/helpers/hdatabases.dart';

import 'package:sqflite/sqflite.dart';
import 'dart:async';


class Home extends StatefulWidget {
  static const String routeName = "/Homestate";
  @override
  HomeState createState() => HomeState();


}

class HomeState extends State<Home> {

  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Activity> activityList;   

  @override
  Widget build(BuildContext context) {
    if (activityList == null) {
      activityList = List<Activity>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Note'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var activity = await navigateToEntryForm(context, null);
          if (activity != null) addActivity(activity);
        },
      ),
    );
  }

  Future<Activity> navigateToEntryForm(BuildContext context, Activity activity) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EntryForm(activity);
        }
      ) 
    );
    return result;
  }

  Container createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return Container(   
      color: Colors.white,
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.white,             
              elevation: 2.0,
              child: ListTile(
                title: Text(this.activityList[index].durasi), 
               leading: Text(this.activityList[index].name, style: textStyle,),
                trailing: GestureDetector(
                  child: Icon(Icons.delete, color: Colors.red),
                  onTap: () {
                    deleteActivity(activityList[index]);
                  },                     
                ),
                onTap: () async {
                  var activity = await navigateToEntryForm(context, this.activityList[index]);
                  if (activity != null) editActivity(activity);
                },
              ),
          );
        }
      )
    );
  }

  void addActivity(Activity object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editActivity(Activity object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteActivity(Activity object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Activity>> activityListFuture = dbHelper.getActivityList();
      activityListFuture.then((activityList) {
        setState(() {
          this.activityList = activityList;
          this.count = activityList.length;
        });
      });
    });
  }

}