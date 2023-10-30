import 'package:baiust_transport/api_manager.dart';
import 'package:baiust_transport/models/schedule_model.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Future<Welcome> _newsModel;

  @override
  void initState() {
    _newsModel = APIManager().getSchedule();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFAED581),
        appBar: AppBar(
          title: Center(child: Text("BAIUST Transport")),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: width * .4,
                    width: width * .4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      //image: DecorationImage(image: AssetImage('assets/bus.png')),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: width * .05),
                        Image(image: AssetImage("assets/bus.png")),
                        Text(
                          "Find Buses",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          //SizedBox(width: Width*.,),
                          Container(
                            height: width * .41,
                            width: width * .41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFF33691E),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: width * .05),
                                Image(image: AssetImage("assets/schedule.png")),
                                Text("Maintain Schedule",
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * .035,
                          ),

                          Container(
                            height: width * .41,
                            width: width * .41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFF33691E),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: width * .05),
                                Image(image: AssetImage("assets/students.png")),
                                Text("Maintain Students",
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    dialog();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 15.0, right: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            //SizedBox(width: Width*.,),
                            Container(
                              height: width * .41,
                              width: width * .41,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xFF33691E),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: width * .05),
                                  Image(image: AssetImage("assets/views.png")),
                                  Text("View Schedule",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.white))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * .035,
                            ),

                            Container(
                              height: width * .41,
                              width: width * .41,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xFF33691E),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: width * .05),
                                  Image(
                                      image: AssetImage("assets/message.png")),
                                  Text("Messages",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.white))
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FutureBuilder<Welcome>(
            future: _newsModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.schedule.length,
                    itemBuilder: (context, index) {
                      var user = snapshot.data?.schedule[index];
                      return Container(
                        height: 100.0,
                        color: Colors.blue,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Text("Time: ${user?.time}"),
                              Text("From: ${user?.from}"),
                              Text("To: ${user?.to}"),
                              Text("Bus No: ${user?.bus}"),
                            ],
                          ),
                        ),
                      );
                    });
              } else
                return Center(child: CircularProgressIndicator());
            },
          );
        });
  }
}
