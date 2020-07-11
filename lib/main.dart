import 'package:flutter/material.dart';
import 'dream.dart';
import 'ui/uihome.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Apps",
    home: new Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("My Note"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: new Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
         
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 13.0,
            offset: Offset(0, 13),
          ),
        ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,10),
            height: 130,
            width: 1000,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10.0, right: 50),
                                        child: Text("I KADEK ALDI BRAGI ", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  new Container(
                                    child: Padding(
                                      padding: EdgeInsets.all(1),
                                      child: Image.network("https://icons.iconarchive.com/icons/custom-icon-design/pretty-office-10/256/Graduate-male-icon.png", height: 60.0, width: 60.0,),                                      
                                    ),                                    
                                  )
                                ],
                              )
                            ],
                          ),
                          ),
                          ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
          padding: EdgeInsets.only(left: 30, top: 20),
          width: 400,
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left:91, top:0),
                          padding: EdgeInsets.only(top:8),
                          width: 116,
                          height: 105,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:BorderRadius.only(
                              topLeft:Radius.circular(10),
                              topRight:Radius.circular(10),
                              bottomLeft:Radius.circular(10),
                              bottomRight:Radius.circular(10),
                            ),
                            border: Border.all(
                              width:5,
                              color: Colors.grey,
                            )
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.network("https://icons.iconarchive.com/icons/matiasam/ios7-style/256/Notes-icon.png", height: 60.0, width: 60.0,),                     
                    ),
                    GestureDetector(
                      onTap: (){
                        Route route = MaterialPageRoute(builder: (context) => Dream());
                        Navigator.push(context, route);
                      },
                      child: Container(
                        color:Colors.black38,
                        margin: EdgeInsets.only(top:5),
                        width: 115,
                        height: 22,
                        child: Center(
                          child: Text('Your Note',
                          style: TextStyle(
                            color:Colors.white
                          ))
                        ),
                      )
                    ),
                  ]
                ),               
                ),
                Padding(padding: EdgeInsets.all(20)),
              
              ],)
            ]
          ),
          ),
         
          RaisedButton(
            child: Text("Tambah Catatan Mu"),
            textColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
            color: Colors.green,
            onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Home()
                )
              );
            },            
            )
          ],
        ),
      ),
    );
  }
}