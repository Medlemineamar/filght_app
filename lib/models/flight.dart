class Flight{
  String id;
  String depart;
  String destination ;
  DateTime date;
  int passangers;
  String type;
  String classe;

  double price;
  String airplane;

  Flight({required  this.id,required this.depart,
          required this.airplane, required this.price,
          required this.destination,required this.date,
          required this.passangers,required this.type,
          required this.classe});


  
}