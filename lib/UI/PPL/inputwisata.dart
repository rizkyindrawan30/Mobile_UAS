import 'package:flutter/material.dart';
import 'package:latihan_mvvm/Model/errMsg.dart';
import 'package:latihan_mvvm/Model/wisata.dart';

class InputWisata extends StatefulWidget {
  // const InputWisata({Key? key}) : super(key: key);
  final Wisata wisata;
  InputWisata({required this.wisata});
  @override
  _InputWisataState createState() => _InputWisataState();
}

class _InputWisataState extends State<InputWisata> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController namaWisata, lokasiWisata, foto, harga, deskripsi;
  late int idWisata = 0;
  bool _isupdate = false;
  bool _validate = false;
  late ErrorMSG response;
  @override
  void initState() {
    // TODO: implement initState
    namaWisata = TextEditingController();
    lokasiWisata = TextEditingController();
    harga = TextEditingController();
    deskripsi = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isupdate ? Text('Ubah Data') : Text('Input Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: namaWisata,
                  validator: (u) => u == "" ? "Wajib Diisi" : null,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Nama Wisata',
                      labelText: 'Nama Wisata'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: lokasiWisata,
                  validator: (u) => u == "" ? "Wajib Diisi" : null,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.map),
                      hintText: 'Lokasi Wisata',
                      labelText: 'Lokasi Wisata'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: harga,
                  validator: (u) => u == "" ? "Wajib Diisi" : null,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Harga Tiket',
                      labelText: 'Harga Tiket'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: deskripsi,
                  validator: (u) => u == "" ? "Wajib Diisi" : null,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.paragliding_sharp),
                      hintText: 'Deskripsi',
                      labelText: 'Deskripsi'),
                ),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'SIMPAN',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //submit();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
