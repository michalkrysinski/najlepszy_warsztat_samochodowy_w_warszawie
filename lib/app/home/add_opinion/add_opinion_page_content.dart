import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var workshopsName = '';
  var warsztatName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration:
                const InputDecoration(hintText: 'Podaj nazwę warsztatu'),
            onChanged: (newValue) {
              setState(() {
                workshopsName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę ulicy'),
            onChanged: (newValue) {
              setState(() {
                warsztatName = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('workshops').add({
                'name': workshopsName,
                'warsztat': warsztatName,
                'raiting': 5.5,
              });
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
