import 'dart:math' as math;

import 'package:firebase_database/firebase_database.dart';

class DataMangement{

  Future addPackage(String companyName, String address) async {

    var generatedCode = "";

    var randomInstance = new math.Random();
    var next = randomInstance.nextInt(9);
    for (int i = 0; i <= 5; i++) {
      generatedCode = generatedCode + next.toString();
      next = randomInstance.nextInt(9);
    }

    DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("Jobs").child(companyName).child("Active Deliveries").child(generatedCode);

    databaseReference.child("Delivery ID").set(generatedCode);

    print("SOME");
    
    databaseReference.child("Status").set("Pending");

    databaseReference.child("Address").set(address);



  }
}