import 'package:flutter/material.dart';
import 'produk_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({super.key});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
        backgroundColor: Color.fromARGB(255, 193, 232, 218),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _tbKodeProduk(),
          _tbNamaProduk(),
          _tbHarga(),
          _btnSimpan()
        ]),
      ),
    );
  }

  _tbKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukTextboxController,
    );
  }

  _tbNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextboxController,
    );
  }

  _tbHarga() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaProdukTextboxController,
    );
  }

  _btnSimpan() {
    return ElevatedButton(
        onPressed: () {
          String kodeProduk = _kodeProdukTextboxController.text;
          String namaProduk = _namaProdukTextboxController.text;
          int harga = int.parse(
              _hargaProdukTextboxController.text); //parsing dari string ke int
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProdukDetail(
                    kodeProduk: kodeProduk,
                    namaProduk: namaProduk,
                    harga: harga,
                  )));
        },
        child: const Text('SImpan'));
  }
}
