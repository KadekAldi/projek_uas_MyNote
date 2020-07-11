import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: new Text("Dream"),
        centerTitle: true,     
      ),
      body: new Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Container(
                  width: 100.0,
                       height: 100.0,
                       color: Colors.white,
                  child: Image.network("https://icons.iconarchive.com/icons/martz90/circle/256/calendar-icon.png", height: 60.0, width: 60.0,),
                )  , 
                Expanded(child: Container(
                padding: EdgeInsets.only(top:25),
                         height: 100.0,
                         color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Event", style: TextStyle(color: Colors.black, fontSize: 20.0),),
                    ],
                ),
              ))
              ],)
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Container(
                  width: 100.0,
                       height: 100.0,
                       color: Colors.white,
                  child: Image.network("https://icons.iconarchive.com/icons/google/noto-emoji-food-drink/256/32421-birthday-cake-icon.png", height: 60.0, width: 60.0,),
                )  , 
                Expanded(child: Container(
                padding: EdgeInsets.only(top:25),
                         height: 100.0,
                         color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Birthday", style: TextStyle(color: Colors.black, fontSize: 20.0),),
                    ],
                ),
              ))
              ],)
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Container(
                  width: 100.0,
                       height: 100.0,
                       color: Colors.white,
                  child: Image.network("https://icons.iconarchive.com/icons/designbolts/free-valentine-heart/256/Hearts-icon.png", height: 60.0, width: 60.0,),
                )  , 
                Expanded(child: Container(
                padding: EdgeInsets.only(top:25),
                         height: 100.0,
                         color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Aniversary", style: TextStyle(color: Colors.black, fontSize: 20.0),),
                    ],
                ),
              ))
              ],)
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Container(
                  width: 100.0,
                       height: 100.0,
                       color: Colors.white,
                  child: Image.network("https://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/256/Actions-rating-icon.png", height: 60.0, width: 60.0,),
                )  , 
                Expanded(child: Container(
                padding: EdgeInsets.only(top:25),
                         height: 100.0,
                         color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Countdown", style: TextStyle(color: Colors.black, fontSize: 20.0),),
                    ],
                ),
              ))
              ],)
            ),
          ]
        ),
      )
      );
  }
}