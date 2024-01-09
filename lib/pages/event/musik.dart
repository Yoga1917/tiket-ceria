import 'package:flutter/material.dart';
import 'package:tiket_ceria/pages/deskripsi/acara.dart';

class Musik extends StatefulWidget {
  @override
  _MusikState createState() => _MusikState();
}

class _MusikState extends State<Musik> {
  TextEditingController _searchController = TextEditingController();
  String _searchResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Musik',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                      color: Colors.black,
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
            SizedBox(height: 10),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.asset(
                                  'assets/pamflet1.png',
                                  width: 400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "FESTIVAL KESENIAN",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Ukm Kesenian Patriot | STMIK Widya Pratama Pekalongan",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mulai Dari",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Rp50.000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 216, 174, 95),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => acara()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset(
                                    'assets/pamflet2.png',
                                    width: 400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "FESTIVAL OLAHRAGA",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "Ukm Olahraga | STMIK Widya Pratama Pekalongan",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mulai Dari",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "Rp50.000",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 216, 174, 95),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
