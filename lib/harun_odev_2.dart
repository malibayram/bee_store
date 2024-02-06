import 'package:bee_store/parcalar/anasayfa_urun_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'parcalar/category_widget.dart';

class HarunOdev2 extends StatefulWidget {
  const HarunOdev2({Key? key}) : super(key: key);

  @override
  State createState() => _HarunOdev2State();
}

class _HarunOdev2State extends State<HarunOdev2> {
  //Kalan süre değişkeni
  late Duration _timeUntilTarget;
  //pageView conterller değişkeni
  final PageController controller = PageController(initialPage: 0);
  //pageView in bulunduğu sayfayı kontol için değişken
  int currentPage = 0;
  //slider noktaları
  late Color dot1 = const Color.fromRGBO(29, 78, 216, 1);
  late Color dot2 = Colors.grey;
  late Color dot3 = Colors.grey;
  late Color dot4 = Colors.grey;
  late Color dot5 = Colors.grey;
  //Slider otomatik kayması için sayaç
  int sayac = 0;

  @override
  void initState() {
    super.initState();

    //Hedef an
    DateTime targetDate = DateTime(2024, 1, 30, 11);

    /* //Tekrar dedin sayaç(zamana bağlı işlemler için)
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int nextPage = (controller.page?.round() ?? 0) + 1;
        if (nextPage > 4) {
          nextPage = 0;
        }
        if (sayac == 8) {
          controller.animateToPage(nextPage,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
          sayac = 0;
        }
        sayac++;
        _timeUntilTarget = targetDate.difference(DateTime.now());
      });
    }); */

    //Hedef ana kalan sürenin hesaplandığı yer
    _timeUntilTarget = targetDate.difference(DateTime.now());

    // Sayfa değiştiği andaki işlemler
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
        switch (currentPage) {
          case 0:
            dot1 = const Color.fromRGBO(29, 78, 216, 1);
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 1:
            dot1 = Colors.grey;
            dot2 = const Color.fromRGBO(29, 78, 216, 1);
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 2:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = const Color.fromRGBO(29, 78, 216, 1);
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 3:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = const Color.fromRGBO(29, 78, 216, 1);
            dot5 = Colors.grey;
          case 4:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = const Color.fromRGBO(29, 78, 216, 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: const Color.fromARGB(50, 25, 155, 120),
            centerTitle: false,
            actions: [
              IconButton(
                icon: Image.asset(
                  "varliklar/resimler/notification.png",
                  width: 24.5,
                  height: 24.5,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  "varliklar/resimler/bag.png",
                  width: 24.5,
                  height: 24.5,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                //Arama Butonu
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Search Anything...",
                      prefixIcon: Image.asset(
                        "varliklar/resimler/search-normal.png",
                        height: 10,
                        width: 10,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: Color(0xFFD1D5DB), width: 1),
                      ),
                    ),
                  ),
                ),
                //Katagoriler
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          height: 0.11,
                          letterSpacing: 0.07,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All ->",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                //Katagori Resimler (Kaydırma)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('categories')
                        .get(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        final categoryList =
                            snapshot.data!.docs.map((e) => e.data()).toList();
                        return Row(
                          children: [
                            const SizedBox(width: 6),
                            for (final data in categoryList)
                              CategoryWidget(
                                title: data['name'],
                                imageUrl: data['imageUrl'],
                              ),
                            const SizedBox(width: 16),
                          ],
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                //Slider
                SizedBox(
                  width: 360,
                  height: 154,
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                      Center(
                        child: Image.asset("varliklar/resimler/Slider1.png"),
                      ),
                      Center(
                        child: Image.asset("varliklar/resimler/Slider2.jpg"),
                      ),
                      Center(
                        child: Image.asset("varliklar/resimler/Slider3.jpg"),
                      ),
                      Center(
                        child: Image.asset("varliklar/resimler/Slider4.jpg"),
                      ),
                      Center(
                        child: Image.asset("varliklar/resimler/Slider5.jpg"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: dot1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: dot2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: dot3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: dot4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: dot5,
                        ),
                      ),
                    ],
                  ),
                ),
                //Deal of the day + Sayaç + Özel indirimler
                Container(
                  color: const Color.fromRGBO(246, 246, 246, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: Row(
                            children: [
                              Text(
                                "Deal of the day",
                                style: TextStyle(
                                  color: Color(0xFF1F2937),
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.07,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "View All ->",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 2),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromARGB(255, 239, 68, 68),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${_timeUntilTarget.inDays} DAY ${_timeUntilTarget.inHours % 24} HRS ${_timeUntilTarget.inMinutes % 60} MIN ${_timeUntilTarget.inSeconds % 60} SEC",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                                "varliklar/resimler/Running.png"),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Running Shoes"),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 239, 68, 68),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  "Upto 40% OFF",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1)),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Image.asset(
                                                "varliklar/resimler/Sneakers.png"),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Sneakers"),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 239, 68, 68),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  "40-60% OFF",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1)),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                  "varliklar/resimler/Wrist.png"),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text("Wrist Watches"),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: const Color.fromARGB(
                                                      255, 239, 68, 68),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "Upto 40% OFF",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1)),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Image.asset(
                                                  "varliklar/resimler/Speaker.png"),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                    Text("Bluetooth Speakers"),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: const Color.fromARGB(
                                                      255, 239, 68, 68),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "40-60% OFF",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1)),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Hot Selling Footwear
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Hot Selling Footwear",
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          height: 0.11,
                          letterSpacing: 0.07,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All ->",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    for (int i = 0; i < 5; i++)
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AnasayfaUrunWidget(
                          resimAdresi: "varliklar/resimler/Adidas1.png",
                          baslik: "Adidas wihite sneakers for men",
                          usdFiyat: 66.5,
                          indirimOrani: 50,
                        ),
                      ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/resimler/Nike1.png",
                        baslik: "Nike wihite sneakers for men",
                        usdFiyat: 86.5,
                        indirimOrani: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "varliklar/resimler/NikeSky2.png",
                        width: 150,
                      ),
                    )
                  ]),
                ),
                const SizedBox(height: 20),
                // Recommended for you
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Recommended for you",
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          height: 0.11,
                          letterSpacing: 0.07,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All ->",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Image.asset(
                        "varliklar/resimler/Allen.png",
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "varliklar/resimler/Calvin.png",
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Image.asset(
                        "varliklar/resimler/H&M.png",
                        width: 150,
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "varliklar/resimler/ProfilPhoto1.jpg")),
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            "David Guatta",
                          ),
                          Text("    +91-999999999")
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.category),
                title: Text("Shop by Categories"),
              ),
              const ListTile(
                leading: Icon(Icons.access_time),
                title: Text("My Order"),
              ),
              const ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text("Favourites"),
              ),
              const ListTile(
                leading: Icon(Icons.live_help_outlined),
                title: Text("FAQs"),
              ),
              const ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text("Addresses"),
              ),
              const ListTile(
                leading: Icon(Icons.credit_card_rounded),
                title: Text("Saved Cards"),
              ),
              const ListTile(
                leading: Icon(Icons.insert_drive_file_outlined),
                title: Text("Terms & Conditions"),
              ),
              const ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy Policy"),
              ),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: "Orders",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: "Profile",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
            ],
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}
