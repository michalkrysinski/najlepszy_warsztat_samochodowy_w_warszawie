import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'workshops_state.dart';

class WorkshopsCubit extends Cubit<WorkshopsState> {
  WorkshopsCubit()
      : super(
          const WorkshopsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const WorkshopsState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('workshops')
        .orderBy('raiting', descending: true)
        .snapshots()
        .listen((data) {
      emit(WorkshopsState(
        documents: data.docs,
        isLoading: false,
        errorMessage: '',
      ));
    })
      ..onError((error) {
        emit(WorkshopsState(
          documents: const [],
          isLoading: false,
          errorMessage: error.toString(),
        ));
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
