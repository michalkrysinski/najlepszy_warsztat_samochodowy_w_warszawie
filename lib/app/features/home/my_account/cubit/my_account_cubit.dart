import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit() : super(MyAccountInitial());
}
