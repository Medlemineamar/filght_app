import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_app/app_constants.dart';
import 'package:flight_app/models/flight.dart';
import 'package:flight_app/services/flight_service.dart';
import 'package:flight_app/widget/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripsScrren extends StatefulWidget {
  final String? type;
  final String from;
  final String to;
  final String date;
  final int? passangers;
  final String classe;
  const TripsScrren({super.key,required this.type, required this.classe,required this.date,required this.from, required this.passangers, required this.to});

  @override
  State<TripsScrren> createState() => _TripsScrrenState();
}

class _TripsScrrenState extends State<TripsScrren> {

  List<Flight> ?flights;

  getFlights()async{
    DateTime dateTime =DateTime.parse(widget.date);
    Timestamp timestamp = Timestamp.fromDate(dateTime);
    log(timestamp.toString());
    log(dateTime.toString());
    print(dateTime);
    flights = await FlightService().getFlights(depart: widget.from, destination: widget.to, 
    date: widget.date, classe: widget.classe , passangers: widget.passangers, type: widget.type);
    setState(() {});
    log(flights.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFlights();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160,
              color: AppConstants.primaryColor,
              child: Center(child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){//go to the previous screen
                        Get.back();
                  }, icon: Icon(Icons.arrow_back , color: Colors.white,)),
                  Text('Search results',style: TextStyle(
                    color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500
                  ),),
                ],
              ),),

            ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.from , style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.w700),),
                  SizedBox(width: 30,),
                 RotationTransition(
                      turns:  AlwaysStoppedAnimation(90 / 360),
                      child: Icon(Icons.flight , size: 40,color: AppConstants.primaryColor,),
                      ) ,

                  SizedBox(width: 30,),

                  Text(widget.to , style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.w700),)
                ],
              ),

            SizedBox(height: 40,),
            TripsBody(flights: flights)


          ],
        ),
      ),
    );
    
  }
}



class TripsBody extends StatelessWidget {
  final List<Flight>? flights;
  const TripsBody({super.key , required this.flights});

  @override
  Widget build(BuildContext context) {
    if(flights==null) return Text("Loading...");
    if( flights!.isEmpty) return  Column(children: [
      SizedBox(height: 100,),
    Icon(Icons.warning , color: Colors.red, size: 50,),
    SizedBox(height: 10,),
    Text("No flights availeble!" , style: TextStyle(fontSize: 25 , color: Colors.red),)
   ],);
    return  Column(
      children: flights!.map((e) => TripCard(flight: e,)).toList(),
    );
  }
}


