class Flight{
  String depart;
  String destination ;
  DateTime date;
  int passangers;
  String type;
  String classe;
  String depart_time;
  String arrival_time;

  int price;
  String airplane;

  bool isBestPrice = false;

  Flight({required this.depart, required this.depart_time, required this.arrival_time,
          required this.airplane, required this.price,
          required this.destination,required this.date,
          required this.passangers,required this.type,
          required this.classe});


  factory Flight.fromJson(Map<String , dynamic> json){
    return Flight(depart: json["depart"] , depart_time: json['depart_time']??"",
     arrival_time: json['arrival_time']??"",
     airplane: json["airplane"], price: json["price"],
      destination: json["destination"], date: DateTime.parse(json["date"]), 
      passangers: json["passangers"], type: json["type"], 
      classe: json["classe"]);
  }

  static void flagBestPrice(List<Flight> flights){

    if(flights.isEmpty) return;

    int min=  flights[0].price;
    int minIndex=  0;



    for (int i =0 ; i<flights.length; i++){
      if(flights[i].price < min){
        min = flights[i].price;
        minIndex = i;
      }
    }
    flights[minIndex].isBestPrice=true;
  }
  
}