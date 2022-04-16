import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/features/home/add_opinion/add_opinion_page_content.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/features/home/my_account/my_account_page_content.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/features/home/workshops/workshops_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'Najlepszy warsztat w Warszawie',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 106, 213, 49),
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const WorkshopsPageContent();
          }
          if (currentIndex == 1) {
            return AddOpinionPageContent(
              onSave: () {
                setState(
                  () {
                    currentIndex = 0;
                  },
                );
              },
            );
          }
          return MyAccountPageContent(email: widget.user.email);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 106, 213, 49),
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(
            () {
              currentIndex = newIndex;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Opinie',
            backgroundColor: Color.fromARGB(255, 106, 213, 49),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dodaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
