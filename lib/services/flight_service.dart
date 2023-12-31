import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_app/models/flight.dart';
class FlightService{


  Future<List<Flight>> getFlights( { required String depart,
  required String destination ,
  required String date,
  int? passangers,
  String? type,
  required String classe}) async {
    log(classe);
    var col = FirebaseFirestore.instance.collection("flight")
    .where("depart" , isEqualTo: depart.toLowerCase())
    .where("destination" , isEqualTo: destination.toLowerCase())
    .where("classe" , isEqualTo: classe.toLowerCase())
    .where("date" , isEqualTo: date);

    if(passangers!=null) col = col.where("passangers" , isEqualTo: passangers);
    if(type!=null) col = col.where("type" , isEqualTo: type.toLowerCase());

    var data =  await col.get();

    return data.docs.map((doc) => Flight.fromJson(doc.data())).toList();


  }



}