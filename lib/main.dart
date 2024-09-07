import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_in_list_get_api/API_URL.dart';

import 'Model/CountryApiModel.dart';
import 'package:shimmer/shimmer.dart';

import 'details_country_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: false,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List> countryinfoAPI() async {
    var countryData;
    final response = await http.get(Uri.parse(AppUrl.baseUrl));

    if (response.statusCode == 200) {
      countryData = jsonDecode(response.body);
      return countryData;
    } else {
      throw Exception("error");
    }
  }

  ///============================HERE ALL=====TextEditingController=====================

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search_API'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "Search countries name",
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: countryinfoAPI(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  title: Container(
                                    height: 10,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          String countryName = snapshot.data![index]['country'];

                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CountryDetails(
                                                  img: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                                  name: snapshot.data![index]['country'].toString(),
                                                  lat: snapshot.data![index]['countryInfo']["lat"].toString(),
                                                  lng: snapshot.data![index]['countryInfo']["long"].toString(),
                                                  iso2: snapshot.data![index]['countryInfo']["iso2"].toString(),
                                                  iso3: snapshot.data![index]['countryInfo']["iso3"].toString(),



                                                )
                                        ));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                  ),
                                )
                              ],
                            );
                          } else if (countryName
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CountryDetails(
                                                  img: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                                  name: snapshot.data![index]['country'].toString(),
                                                  lat: snapshot.data![index]['countryInfo']["lat"].toString(),
                                                  lng: snapshot.data![index]['countryInfo']["long"].toString(),
                                                  iso2: snapshot.data![index]['countryInfo']["iso2"].toString(),
                                                  iso3: snapshot.data![index]['countryInfo']["iso3"].toString(),
                                                  people: "25879611",
                                                  currency: "Dollos",
                                                  language: "Bangla",

                                                )));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(
                                          snapshot.data![index]
                                          ['countryInfo']['flag']
                                      ),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                  ),
                                )
                              ],
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
