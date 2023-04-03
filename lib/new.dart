import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
    String imageUrl = '';
  String ?p1;
  String ?p2;
  String ?sum;
  final databaseReference = FirebaseDatabase.instance.ref();

@override
void initState() {
  super.initState();
  setupDatabaseListeners();
  getImage();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getImage();
        },
        label: const Text('Refresh'),
        icon: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        centerTitle: true, 
        title: Text('Parking Lot'),
      ),
      body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover),
          ),
          child:Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Parking Left: "+
              sum!,
               style: TextStyle(
                fontSize: 30,)
            ),
          ),
        ],
      ),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

                Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "P1",
              style: TextStyle(
                fontSize: 30,
                color: p1 == "1" ? Colors.red : Colors.green,
              ),
            ),
          ),
                    Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "P2",
              style: TextStyle(
                fontSize: 30,
                color: p2 == "1" ? Colors.red : Colors.green,
              ),
            ),
          ),
          ],
      ),
      SizedBox(height: 16.0),
      imageUrl == ''
          ? CircularProgressIndicator()
          : Image.network(imageUrl),
    SizedBox(height: 16.0),
    ],
  ),
),
      )
      );
  }





            
void setupDatabaseListeners() {
  databaseReference.child('SmartParking').child('P1').onValue.listen((event) {
    setState(() {
      p1 = event.snapshot.value.toString();
      print(p1);
    });
  });
  databaseReference.child('SmartParking').child('P2').onValue.listen((event) {
    setState(() {
      p2 = event.snapshot.value.toString();
    });
  });
  databaseReference.child('SmartParking').child('sum').onValue.listen((event) {
    setState(() {
      sum = event.snapshot.value.toString();
    });
  });
}


Future<void> getImage() async {
    final ref = firebase_storage.FirebaseStorage.instance.ref().child('data/photo.jpg');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

}