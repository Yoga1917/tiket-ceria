import 'package:flutter/material.dart';
import 'package:tiket_ceria/pages/beli/bayar.dart';

class kategori_tiket extends StatefulWidget {
  @override
  _Kategori_tiketState createState() => _Kategori_tiketState();
}

class _Kategori_tiketState extends State<kategori_tiket> {
  bool isTapped = false;
  int count = 0;
  int ticketPrice = 50000;
  String namaTiket = 'Presale 1';

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
        title: Text(
          'Kategori Tiket',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Bayar',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\Rp ${ticketPrice * count}',
                    style: TextStyle(
                      color: const Color(0xFFD8AC5A),
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (ticketPrice * count > 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bayar(
                          totalBayar: ticketPrice * count,
                          count: count,
                          namaTiket: namaTiket,
                          ticketPrice: ticketPrice,
                        ),
                      ),
                    );
                  } else {
                    print('Total bayar 0, tidak dapat melakukan pembayaran.');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ticketPrice * count > 0
                        ? Color.fromARGB(255, 0x5F, 0x5C, 0xDE)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Bayar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.red,
                    width: 5,
                  ),
                  top: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.red, width: 5),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaTiket,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 0),
                        Text(
                          'Rp$ticketPrice',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  AnimatedContainer(
                    width: 120,
                    height: 40,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: isTapped
                          ? Color.fromARGB(255, 255, 255, 255)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: isTapped
                            ? [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (count > 1) {
                                        count--;
                                      } else if (count == 1) {
                                        count--;
                                        isTapped = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.remove,
                                      color:
                                          Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: 20,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$count',
                                    style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.add,
                                      color:
                                          Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ]
                            : [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      count++;
                                      isTapped = true;
                                    });
                                  },
                                  child: Text(
                                    'Tambah',
                                    style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
