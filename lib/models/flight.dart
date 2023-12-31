class Flight{
  String depart;
  String destination ;
  DateTime date;
  int passangers;
  String type;
  String classe;

  int price;
  String airplane;

  Flight({required this.depart,
          required this.airplane, required this.price,
          required this.destination,required this.date,
          required this.passangers,required this.type,
          required this.classe});


  factory Flight.fromJson(Map<String , dynamic> json){
    return Flight(depart: json["depart"] ,
     airplane: json["airplane"], price: json["price"],
      destination: json["destination"], date: DateTime.parse(json["date"]), 
      passangers: json["passangers"], type: json["type"], 
      classe: json["classe"]);
  }

  
  
}