import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiket_ceria/pages/beli/transfer.dart';

class Bayar extends StatefulWidget {
  final int totalBayar;
  final int count;
  final int ticketPrice;
  final String namaTiket;

  Bayar({
    required this.totalBayar,
    required this.count,
    required this.namaTiket,
    required this.ticketPrice,
  });

  @override
  _BayarState createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  String email = '';
  String name = '';
  String selectedPaymentMethod = '';
  int admin = 5000;

  bool isPaymentMethodSelected = false;
  bool isTransferBankSelected = false;
  bool isEWalletSelected = false;
  bool isBriSelected = false;
  bool isDanaSelected = false;

  void _togglePaymentMethod() {
    setState(() {
      isPaymentMethodSelected = !isPaymentMethodSelected;
    });
  }

  void _toggleTransferBank() {
    setState(() {
      isTransferBankSelected = !isTransferBankSelected;
    });
  }

  void _toggleEWallet() {
    setState(() {
      isEWalletSelected = !isEWalletSelected;
    });
  }

  void _toggleBri() {
    setState(() {
      isBriSelected = !isBriSelected;
      if (isBriSelected) {
        isDanaSelected = false;
        selectedPaymentMethod = 'BRI';
      } else {
        selectedPaymentMethod = '';
      }
    });
  }

  void _toggleDana() {
    setState(() {
      isDanaSelected = !isDanaSelected;
      if (isDanaSelected) {
        isBriSelected = false;
        selectedPaymentMethod = 'DANA';
      } else {
        selectedPaymentMethod = '';
      }
    });
  }

  void initState() {
    super.initState();
    _loadUser();
  }

  _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
      name = prefs.getString('name') ?? '';
    });
  }

  void _showWarningDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perhatian'),
          content:
              Text('Pilihlah metode pembayaran untuk melanjutkan pembayaran.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
          'Pembayaran',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Detail Acara",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset(
                                    'assets/pamflet2.png',
                                    width: 400,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "FESTIVAL OLAHRAGA",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "10 April 2023 | 16:00:00",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Jl. Patriot No.25 | Pekalongan Jawa Tengah",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 15),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Acara ini dihadiri oleh beberapa olahragawan ternama",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Registrasi Data",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Nama",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 350,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(13),
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 350,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(13),
                                    child: Text(
                                      email,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Detail Tiket",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.namaTiket,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rp${widget.ticketPrice.toString()}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "x",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.count.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Rp${widget.totalBayar}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Metode Pembayaran",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          _togglePaymentMethod();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pilih Metode Pembayaran",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (selectedPaymentMethod == 'BRI')
                                  Image.asset(
                                    'assets/bri.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                if (selectedPaymentMethod == 'DANA')
                                  Image.asset(
                                    'assets/dana.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isPaymentMethodSelected ? 400 : 0,
                        child: isPaymentMethodSelected
                            ? Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _toggleTransferBank();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              padding: EdgeInsets.all(16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Transfer Bank"),
                                                  Spacer(),
                                                  if (isBriSelected)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: Icon(
                                                        Icons.check_circle,
                                                        color: Color.fromARGB(
                                                            255,
                                                            0x5F,
                                                            0x5C,
                                                            0xDE),
                                                      ),
                                                    ),
                                                  Icon(Icons.arrow_drop_down),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            height:
                                                isTransferBankSelected ? 90 : 0,
                                            child: isTransferBankSelected
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _toggleBri();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            width: 2,
                                                            color: isBriSelected
                                                                ? Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0x5F,
                                                                        0x5C,
                                                                        0xDE)
                                                                : Colors.grey,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/bri.png'),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 20),
                                                            Text("Bank BRI"),
                                                            Spacer(),
                                                            if (isBriSelected)
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            15),
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0x5F,
                                                                          0x5C,
                                                                          0xDE),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : null),
                                        GestureDetector(
                                          onTap: () {
                                            _toggleEWallet();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              padding: EdgeInsets.all(16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("E-Wallet"),
                                                  Spacer(),
                                                  if (isDanaSelected)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: Icon(
                                                        Icons.check_circle,
                                                        color: Color.fromARGB(
                                                            255,
                                                            0x5F,
                                                            0x5C,
                                                            0xDE),
                                                      ),
                                                    ),
                                                  Icon(Icons.arrow_drop_down),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            height: isEWalletSelected ? 90 : 0,
                                            child: isEWalletSelected
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _toggleDana();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            width: 2,
                                                            color: isDanaSelected
                                                                ? Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0x5F,
                                                                        0x5C,
                                                                        0xDE)
                                                                : Colors.grey,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/dana.png'),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 20),
                                                            Text("Dana"),
                                                            Spacer(),
                                                            if (isDanaSelected)
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            15),
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0x5F,
                                                                          0x5C,
                                                                          0xDE),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : null),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Detail Pembayaran",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Total Tiket",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Rp${widget.totalBayar}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Biaya Admin",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Rp$admin',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Total Pembayaran",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Rp${widget.totalBayar + admin}',
                              style: TextStyle(
                                color: const Color(0xFFD8AC5A),
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: GestureDetector(
                          onTap: () {
                            var asset = '';
                            var pembayaran = '';
                            var nomor = '';
                            var nama = '';
                            var totalPembayaran = '';

                            if (isPaymentMethodSelected == false) {
                              _showWarningDialog();
                            } else {
                              if (isBriSelected == true) {
                                asset = 'assets/bri.png';
                                pembayaran = 'BRI';
                                nomor = '369301035417535';
                                nama = 'Marlinah';
                              } else if (isDanaSelected == true) {
                                asset = 'assets/dana.png';
                                pembayaran = 'Dana';
                                nomor = '081390628224';
                                nama = 'M. Dimas Prayoga';
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Transfer(
                                    asset: asset,
                                    pembayaran: pembayaran,
                                    nomor: nomor,
                                    nama: nama,
                                    totalPembayaran: widget.totalBayar + admin,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Bayar Sekarang",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String imagePath, String optionName) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          optionName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
