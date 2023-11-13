import 'package:flutter/material.dart';

class TiketPage extends StatefulWidget {
  @override
  _TiketPageState createState() => _TiketPageState();
}

class _TiketPageState extends State<TiketPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Tiket',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Cari tiket",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                    ),
                    onPressed: () {
                      // Tambahkan logika pencarian di sini
                      setState(() {
                        _searchResult = _searchController.text;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  // Menampilkan hasil pencarian di paling atas
                  _searchResult.isNotEmpty
                      ? ListTile(
                          title: Text(
                            'Hasil Pencarian: $_searchResult',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                  // Tambahan elemen lainnya di halaman TiketPage
                  ListTile(
                    title: Text(
                      'Hasilnya nanti dibagian paling atas',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  // ...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
