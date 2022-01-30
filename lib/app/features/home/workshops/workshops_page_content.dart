import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/features/home/workshops/cubit/workshops_cubit.dart';

class WorkshopsPageContent extends StatelessWidget {
  const WorkshopsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkshopsCubit()..start(),
      child: BlocBuilder<WorkshopsCubit, WorkshopsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
                child: Text('Something went wrong: ${state.errorMessage}'));
          }

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(document['name']),
                          Text(document['warsztat']),
                        ],
                      ),
                      Text(document['raiting'].toString()),
                    ],
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
