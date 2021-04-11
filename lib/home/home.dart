import 'package:flutter/material.dart';
import 'package:unsplash_api/home/home_model.dart';
import 'package:unsplash_api/home/view_home_model.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _li;
  HomeModel home;
  // Future<Home> _li;
  // List<HomeModel> li = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getphoto();
    _li = getphoto();
    // print(_li);
    print(_li);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnSpalsh Photo'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.red,
        child: FutureBuilder(
          future: _li,
          builder: (context, snapshot) {
            home = snapshot.data;
            print('insdie if statement');
            print(home);
            print(home);

            if(snapshot.hasData) {
              return Container(
                child: Column(
                  children: [
                    Text(
                        '${home.altDescription}'
                    ),
                  ],
                ),
              );
              // List<HomeModel> home = new List<HomeModel>();
              // home = snapshot.data;
              // home = parsedJson.map((i)=>Home.fromJson(i)).toList();
              // return ListView.builder(
              //     itemCount: home.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       var article = home[index];
              //       return Card(
              //         child: Container(
              //           child: Text(
              //             '${article}'
              //           ),
              //         ),
              //       );
              //     }
              // );
            }else {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            //
          },
        ),
        ),
    );
  }
}