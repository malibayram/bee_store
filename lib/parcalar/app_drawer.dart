import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
        ListTile(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Scaffold.of(context).closeDrawer();
          },
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
        ),
      ]),
    );
  }
}
