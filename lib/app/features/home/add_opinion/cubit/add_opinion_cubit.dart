import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_opinion_state.dart';

class AddOpinionCubit extends Cubit<AddOpinionState> {
  AddOpinionCubit() : super(AddOpinionInitial());
}
