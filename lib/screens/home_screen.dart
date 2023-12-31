

import 'package:flight_app/app_constants.dart';
import 'package:flight_app/config.dart';
import 'package:flight_app/controllers/main_controller.dart';
import 'package:flight_app/screens/trips_screen.dart';
import 'package:flight_app/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final MainController controller = Get.put(MainController());
  


  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}



class HomeScreenState extends State<HomeScreen> {
  List<String> types =["one way", "Two ways"];
  List<String> classes =["economy", "Busines"];

  String? selectedType;
  String?  selectedClasse;
   TextEditingController dateController = TextEditingController();
    TextEditingController  fromController = TextEditingController();
   TextEditingController toController = TextEditingController();
  TextEditingController passangersController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
      child:Scaffold(
        body: Column(
          children: [
            Container(
              height: 200,
              color: AppConstants.primaryColor,
              child: Center(child: Text('Chose Your Trib',style: TextStyle(
                color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500
              ),),),
            ),
            SizedBox(height: fullHeight(context) * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:40.0),
              child: TabBar(labelColor:Colors.black ,tabs: [
                Row(
                  children: [
                    Tab(icon: Icon(Icons.flight)),
                    SizedBox(width: 5,),
                    Tab(text: 'Flight',),
                  ],
                ),
                Row(
                  children: [
                    Tab(icon: Icon(Icons.home_work_outlined)),
                    SizedBox(width: 5,),
                    Tab(text: 'Hotel',),
                  ],
                ),
            
              ]),
              
            ),
            
            Expanded(child: TabBarView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40.0),
                    child: SingleChildScrollView(
                      child: Column(
                                    
                        children: [
                          Container(
                            
                            height: 350,
                            decoration: BoxDecoration(
                              color: AppConstants.primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  children: [
                                     Align(
                                      alignment: AlignmentDirectional.topStart,
                                       child: Row(
                                         children: [
                                           Container(
                                            width: 100,
                                          
                                             child: TextFormField(
                                              controller: fromController,
                                              decoration: InputDecoration(labelText: 'From',labelStyle: TextStyle(
                                                color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600
                                              )),style: TextStyle(color: Colors.white),),
                                           ),
                                           SizedBox(width: 70,),
                                           Container(
                                            width: 100,
                                             child: TextFormField(
                                              controller:  toController,
                                              decoration: InputDecoration(labelText: 'To',labelStyle: TextStyle(
                                                color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600
                                              )),cursorWidth: 12,style: TextStyle(color: Colors.white),),
                                           ),
                                         ],
                                       ),
                                    ),
                                    SizedBox(height: fullHeight(context) * 0.04),
                                    Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Row(
                                         children: [
                                           Container(
                                            width: 100,
                                             child: TextFormField(
                                              controller:dateController ,
                                              
                                              decoration: InputDecoration(labelText: 'Date',labelStyle: TextStyle(
                                                color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600
                                              )),
                                              
                                              onTap: ()async{
                                                var pickedDate = await showDatePicker(context: context, 
                                                initialDate: DateTime.now(), 
                                                firstDate: DateTime(2022),
                                                 lastDate: DateTime(2024),
                                                 );
                                                
                                                 
                                                  if(pickedDate !=null) dateController.text=  DateFormat('yyyy-MM-dd').format(pickedDate);
                                              }, readOnly: true,
                                               style: TextStyle(color: Colors.white),
                                              ),
                                           ),
                                           SizedBox(width: 60,),
                                           Container(
                                            width: 110,
                                             child: DropdownButtonFormField<String?>(
                                              dropdownColor: AppConstants.primaryColor,
                                              decoration: InputDecoration(labelText: 'Type',labelStyle: TextStyle(
                                                color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600
                                              )),
                                              style: TextStyle(color: Colors.white),
                                             
                                              items:types.map((e) => DropdownMenuItem<String?>(child:Text(e),value: e,)).toList() ,
                                             value: selectedType,
                                              onChanged: (val){
                                                setState(() {
                                                  selectedType=val;
                                                });
                                              }),
                                           ),
                                         ],
                                       ),
                                    ),
                                    SizedBox(height: fullHeight(context) * 0.04),
                                    Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: Row(
                                         children: [
                                           Container(
                                            width: 100,
                                             child: TextFormField(decoration: InputDecoration(labelText: 'Passangers',labelStyle: TextStyle(
                                                color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600
                                              )), style: TextStyle(color: Colors.white),),
                                           ),
                                           SizedBox(width: 70,),
                                           Container(
                                            width: 100,
                                             child:DropdownButtonFormField<String?>(
                                              dropdownColor: AppConstants.primaryColor,
                                              decoration: InputDecoration(labelText: 'Classes',labelStyle: TextStyle(
                                                color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600
                                              )),
                                              style: TextStyle(color: Colors.white, ),
                                             
                                              items:classes.map((e) => DropdownMenuItem<String?>(child:Text(e),value: e,)).toList() ,
                                             value: selectedClasse,
                                              onChanged: (val){
                                                setState(() {
                                                  selectedClasse=val;
                                                });
                                              }),
                                           ),
                                         ],
                                       ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: fullHeight(context) * 0.04),
                          MyButton(title: "Search",onPressed: (){
                              int? passangers = passangersController.text==""?null:  int.parse(passangersController.text);

                            Get.to(TripsScrren(type: selectedType, 
                            classe: selectedClasse!, date: dateController.text,
                             from: fromController.text, passangers:passangers ,
                              to: toController.text));
                          },)
                           
                        ],
                      ),
                    ),
                  ),
                ),
                Center(child: Text('Listes of Hotels')),
              ]
              ))
          ],
        ),
      )
      );
      
    
  }
}