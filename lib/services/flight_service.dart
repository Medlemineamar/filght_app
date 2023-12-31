import 'package:cloud_firestore/cloud_firestore.dart';
class Service{


  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getFlights( { required String depart,
  required String destination ,
  required DateTime date,
  int? passangers,
  String? type,
  required String classe}) async {

    var col = FirebaseFirestore.instance.collection("flight")
    .where("depart" , isEqualTo: depart)
    .where("destination" , isEqualTo: destination)
    .where("classe" , isEqualTo: classe)
    .where("date" , isEqualTo: date);

    if(passangers!=null) col = col.where("passangers" , isEqualTo: passangers);
    if(type!=null) col = col.where("type" , isEqualTo: type);

    var data =  await col.get();

    return data.docs;


  }



}