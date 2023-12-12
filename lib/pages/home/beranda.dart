import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tiket_ceria/pages/beranda/cari.dart';
import 'package:tiket_ceria/pages/event/esport.dart';
import 'package:tiket_ceria/pages/event/festival.dart';
import 'package:tiket_ceria/pages/event/musik.dart';
import 'package:tiket_ceria/pages/event/seminar.dart';
import 'package:tiket_ceria/pages/event/senirupa.dart';
import 'package:tiket_ceria/pages/event/sport.dart';
import 'package:tiket_ceria/pages/event/standup.dart';
import 'package:tiket_ceria/pages/event/teater.dart';
import 'package:url_launcher/url_launcher.dart';

class BerandaPage extends StatelessWidget {
  static final List<String> imgList = [
    'assets/iklan1.png',
    'assets/iklan2.png',
    'assets/iklan3.png',
    'assets/iklan4.png',
  ];
  void _launchInstagram() async {
    const url = 'https://www.instagram.com/mdimasprayoga19/';
    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  CarouselSlider get autoPlayImage => CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: 200,
          viewportFraction: 1.0,
        ),
        items: imgList.asMap().entries.map((entry) {
          final index = entry.key;
          final fileImage = entry.value;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              child: InkWell(
                onTap: index == 3 ? _launchInstagram : null,
                child: Image.asset(
                  fileImage,
                  width: 360,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo2.png',
          width: 120,
          height: 30,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return CariBeranda();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              autoPlayImage,
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kategori Event",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    CustomCategoryContainer(
                      imageAsset: 'assets/musik.png',
                      text: 'Musik',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Musik()),
                        );
                      },
                    ),
                    CustomCategoryContainer(
                      imageAsset: 'assets/teater.png',
                      text: 'Teater',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Teater()),
                        );
                      },
                    ),
                    CustomCategoryContainer(
                      imageAsset: 'assets/senirupa.png',
                      text: 'Seni Rupa',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Seni_Rupa()),
                        );
                      },
                    ),
                    CustomCategoryContainer(
                      imageAsset: 'assets/festival.png',
                      text: 'Festival',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Festival()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    CustomCategoryContainer(
                      imageAsset: 'assets/sport.png',
                      text: 'Sport',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sport()),
                        );
                      },
                    ),
                    CustomCategoryContainer(
                      imageAsset: 'assets/esport.png',
                      text: 'E-Sport',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => E_Sport()),
                        );
                      },
                    ),
                    CustomCategoryContainer(
                      imageAsset: 'assets/seminar.png',
                      text: 'Seminar',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Seminar()),
                        );
                      },
                    ),
                    CustomCategoryContainer(
                      imageAsset: 'assets/standup.png',
                      text: 'Stand UP',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Stand_UP()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Event Populer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Temukan acara favorit anda, dan mari kita bersenang-senang",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                              width: 300,
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
                                  fontSize: 16, fontWeight: FontWeight.normal),
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
              Padding(
                padding: EdgeInsets.all(16.0),
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
                              width: 300,
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
                                  fontSize: 16, fontWeight: FontWeight.normal),
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
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCategoryContainer extends StatelessWidget {
  final String imageAsset;
  final String text;
  final VoidCallback onTap;

  const CustomCategoryContainer({
    Key? key,
    required this.imageAsset,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                imageAsset,
                width: 68,
                height: 68,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
