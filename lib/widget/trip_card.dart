import 'package:flight_app/models/flight.dart';
import 'package:flight_app/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripCard extends StatelessWidget {
  final Flight flight;
  const TripCard({super.key , required this.flight});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        color: Colors.grey[350],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
    
        
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${flight.depart_time} - ${flight.arrival_time} " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
    
                      Text(DateFormat('d MMMM yyyy').format(flight.date) ,style: TextStyle(fontSize: 17 ,),),
                    ],
                  ),
    
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: flight.isBestPrice ? Colors.red: Colors.grey[700]),
                      children: [
                        TextSpan(text: flight.price.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
                        TextSpan(text: " MRU"),
                      ]
                    ),
                  ),
    
                  // SizedBox(height: 20,),
                  // Text(flight.airplane),
                  // Text(flight.classe),
        
                ],
              ),
    
              SizedBox(height: 20,),
        
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
        
                children: [
                  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
    
                    children: [
                          Text(flight.airplane ,  style: TextStyle(fontSize: 16 )),
                  Text("1 ${flight.classe}" ,  style: TextStyle(fontSize: 16 )),
                    ],
                  ),
    
                  MyButton(title: "Choose" , width: 120,height: 30,  onPressed: (){},)
        
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}