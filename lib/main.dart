import 'package:flutter/material.dart';

// Fonksiyon tanımlamak
void main() {
  // Fonksiyon çağırmak

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Image.asset(
                'varliklar/notification.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                'varliklar/bag.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Search Anything...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Color(0xFFD1D5DB),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                        letterSpacing: 0.07,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View All ->',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

          Image.asset('varliklar/categoriescontainer.png'),
                  ],
                ),
              ),
             SizedBox(height: 25, width: 100,),

             Row(crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,

               children: [
               Image.asset('varliklar/banner.png'),



               ],
             ),
              SizedBox(height: 25, width: 100,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset('varliklar/viewpages.png'),



                ],
              ),
              SizedBox(height: 25, width: 100,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Deal of the day',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                        letterSpacing: 0.07,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View All ->',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25, width: 100,),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Image.asset('varliklar/timer.png'),



                  ],
                ),
              ),
              SizedBox(height: 25, width: 100,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset('varliklar/products.png',
                   ),




                ],
              ),
              SizedBox(height: 25, width: 100,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset('varliklar/hotsellingfootwear.png'),




                ],
              ),

              SizedBox(height: 25, width: 100,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset('varliklar/recommendedforyou.png'),




                ],
              ),
              SizedBox(height: 25, width: 100,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset('varliklar/buttomnav.png'),




                ],
              ),


            ],
          ),
        ),
        drawer: const Drawer(),
      ),
    );
  }
}
