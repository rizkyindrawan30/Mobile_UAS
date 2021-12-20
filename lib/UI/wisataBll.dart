import 'dart:js';

import 'package:flutter/material.dart';
import 'package:latihan_mvvm/Model/wisata.dart';
import 'package:latihan_mvvm/Service/apiStatic.dart';
import 'package:latihan_mvvm/UI/PPL/inputwisata.dart';
import 'package:latihan_mvvm/UI/detailWisata.dart';
import 'package:latihan_mvvm/UI/widget/buttomBar.dart';

class WisataBll extends StatefulWidget {
  const WisataBll({Key? key}) : super(key: key);

  @override
  _WisataBllState createState() => _WisataBllState();
}

class _WisataBllState extends State<WisataBll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wisata Buleleng"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InputWisata(
                          wisata: Wisata(
                            idWisata: 0,
                            namaWisata: '',
                            lokasiWisata: '',
                            harga: '',
                            deskripsi: '',
                            createdAt: '',
                            updatedAt: '',
                            foto: '',
                          ),
                        )));
          },
        ),
        body: FutureBuilder<List<Wisata>>(
          future: ApiStatic.getWisata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<Wisata> listWisata = snapshot.data!;
              return Container(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => DetailWisata(
                                    wisata: listWisata[index],
                                  )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(top: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: Colors.lightBlueAccent)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                ApiStatic.host + '/' + listWisata[index].foto,
                                width: 125,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(listWisata[index].namaWisata),
                                    Text(
                                      listWisata[index].harga,
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
        // bottomNavigationbar
        bottomNavigationBar: buildButtomBar(1, context));
  }
}
