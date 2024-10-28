import 'package:flutter/material.dart';
import 'package:mobileapps/Ui/produk_detail.dart';
import 'package:mobileapps/Ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);
  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class ItemProduk extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(namaProduk.toString()),
          subtitle: Text(harga.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProdukDetail(
                kodeProduk: kodeProduk,
                namaProduk: namaProduk,
                harga: harga,
              ),
            ));
      },
    );
  }
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        actions: [
          GestureDetector(
            // show icon +
            child: const Icon(Icons.add),
            // interaction pada +
            onTap: () async {
              // berpindah ke halaman ProdukForm
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProdukForm()));
            },
          )
        ],
        backgroundColor: Color.fromARGB(255, 193, 232, 218),
      ),
      body: ListView(
        children: const [
          // list 1
          ItemProduk(
              kodeProduk: "K01SINGLE", namaProduk: "Kulkas", harga: 2500000),
          // list 2
          ItemProduk(
              kodeProduk: "T01LCD", namaProduk: "TV LCD", harga: 5000000),
          // List 3
          ItemProduk(
              kodeProduk: "WM01RND", namaProduk: "Mesin Cuci", harga: 10000000)
        ],
      ),
    );
  }
}
