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
            ),
          ],
        ),
      ),
    );
  }
}
