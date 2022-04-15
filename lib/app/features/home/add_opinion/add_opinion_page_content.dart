import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var workshopsName = '';
  var warsztatName = '';
  var rating = 5.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 210,
            ),
            TextField(
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 68, 127, 255), width: 5.0),
                ),
                hintText: 'Podaj nazwę warsztatu',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
              ),
              onChanged: (newValue) {
                setState(() {
                  workshopsName = newValue;
                });
              },
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 68, 127, 255), width: 5.0),
                ),
                hintText: 'Podaj nazwę ulicy',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
              ),
              onChanged: (newValue) {
                setState(
                  () {
                    warsztatName = newValue;
                  },
                );
              },
            ),
            const SizedBox(
              height: 150,
            ),
            Slider(
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
              value: rating,
              min: 1.0,
              max: 6.0,
              divisions: 10,
              label: rating.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: workshopsName.isEmpty || warsztatName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('workshops').add({
                        'name': workshopsName,
                        'warsztat': warsztatName,
                        'raiting': rating,
                      });
                      widget.onSave();
                    },
              child: const Text('Dodaj'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 113, 158, 255),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
