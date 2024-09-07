import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {



  String name,lat,lng,iso2,iso3;
  String ?people;
  String ?currency;
  String ?language;
  String  img;


  CountryDetails({
    required this.img,
    required this.name, required this.lat,
    required this.lng, required this.iso2,
    required this.iso3,
    this.people,
    this.currency,
    this.language,
  }
  );

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: ListTile(
                title: Text(widget.name,  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),),
                leading: CircleAvatar(
               backgroundImage: NetworkImage(
                 widget.img
               ),

                  ),
                ),
              ),
            SizedBox(height: 10),
            Expanded(

                child: Container(
                  width: double.infinity,
              height: double.infinity,
              color: Colors.white,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Name: ${widget.name}',
                      style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                    ),
                    ),
                    Text('iso2: ${widget.iso2}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    Text('iso3: ${widget.iso3}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    Text('Lat: ${widget.lat}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    Text('Lng: ${widget.lng}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    Text('People: ${widget.people}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    Text('Language: ${widget.language}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    Text('Currency: ${widget.currency}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                  ],
                  ),
                ),
              ),
            )
            )


          ],
        ),
      ),
    );
  }
}
