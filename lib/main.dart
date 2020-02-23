import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle_wave_progress/circle_wave_progress.dart';
import 'package:deliverdeck_web/datamanagement.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var dataManagementInstance = DataMangement();



  final List<String> user = <String>['John Dow', 'John Doe', 'John Doe'];
  final List<String> deliveriesatmpt = <String>['18', '21', '14'];
  final List<String> delivercomp = <String>['6', '11', '9'];

  //Controllers
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  void _showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.redAccent,
                  height: 300,
                  width: MediaQuery.of(context).size.width - 40,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10)),
                  height: 55,
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.8,
          );
        });
  }

  void _showerrorbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Unable to Deliver',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 170,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blueAccent[400]),
                          ),
                          labelText: 'Give Context',
                          labelStyle: TextStyle(color: Colors.grey[300]),
                          hintText: 'I am unable to deliver because...',
                          hintStyle: TextStyle(color: Colors.grey[200]),
                          focusColor: Colors.grey[400],
                        ),
                      )),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10)),
                  height: 55,
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.4,
          );
        });
  }

  final List<String> entries = <String>['35', '36', '37'];

  void _showlistbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Package List',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height * 0.8 - 300,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 50,
                              color: Colors.grey[900],
                              child: Center(
                                  child: Text(
                                    'Package #${entries[index]}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.8,
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 70,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Google',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 30)
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.setaswall.com/wp-content/uploads/2017/03/Artistic-Landscape-4K-Wallpaper-3840x2160.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 50),
                        Text(
                          'Active Deliveries',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 40),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 80),
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 80),
                                Text(
                                  'Deliveries attempted',
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 80),
                                Text(
                                  'Deliveries completed',
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 80),
                                Text(
                                  'PayCheck',
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 40),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 180,
                            child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: user.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      height: 50,
                                      color: Colors.transparent,
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              '${user[index]}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(width: 0),
                                            Text(
                                              '${deliveriesatmpt[index]}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(width: 130),
                                            Text(
                                              '${delivercomp[index]}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(width: 80),
                                            Text(
                                              '${delivercomp[index]}' + '0',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(width: 50),
                                          ]),
                                    ),
                                  );
                                }),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Text(
                            'Active Deliveries',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 30),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[300]),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent[400]),
                                  ),
                                  labelText: 'Address',
                                  labelStyle:
                                  TextStyle(color: Colors.grey[300]),
                                  hintText: 'ex. 714 North Riata Dr',
                                  hintStyle: TextStyle(color: Colors.grey[300]),
                                  focusColor: Colors.grey[400],
                                ),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[300]),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent[400]),
                                  ),
                                  labelText: 'City',
                                  labelStyle:
                                  TextStyle(color: Colors.grey[300]),
                                  hintText: 'ex. San Fransisco',
                                  hintStyle: TextStyle(color: Colors.grey[300]),
                                  focusColor: Colors.grey[400],
                                ),
                              )),
                          SizedBox(height: 20),
                          RaisedButton(
                            onPressed: () async{

                              print("WORKS");

                              await dataManagementInstance.addPackage("Amazon", addressController.text);


                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child:FlatButton(onPressed: null, child: Text(
                                  'Add Package',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),)),
                          )
                        ],
                      ),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    SizedBox(width: 50),
                    Text(
                      'Active Deliveries',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SizedBox(width: 40),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 80),
                            Text(
                              'Name',
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 130),
                            Text(
                              'Rating',
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 100),
                            Text(
                              'More',
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SizedBox(width: 40),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 180,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: user.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  height: 50,
                                  color: Colors.transparent,
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(width: 50),
                                        Text(
                                          '${user[index]}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(width: 150),
                                        Text(
                                          '${deliveriesatmpt[index]}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(width: 110),
                                        Icon(Icons.check),
                                        SizedBox(width: 20),
                                        Icon(Icons.not_interested),
                                      ]),
                                ),
                              );
                            }),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
