part of 'workshops_cubit.dart';

@immutable
class WorkshopsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  final bool isLoading;
  final String errorMessage;

  const WorkshopsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
