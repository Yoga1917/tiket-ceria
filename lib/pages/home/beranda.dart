import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  static final List<String> imgList = [
    'assets/iklan1.png',
    'assets/iklan2.png',
    'assets/iklan3.png',
    'assets/iklan4.png',
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      height: 200,
      viewportFraction: 1.0,
    ),
    items: imgList.map((fileImage) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          child: Image.asset(
            '${fileImage}',
            width: 360,
            height: 200,
            fit: BoxFit.cover,
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
            onPressed: () {},
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
