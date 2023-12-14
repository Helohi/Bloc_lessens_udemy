import 'package:bloc_test/model/user.dart';
import 'package:bloc_test/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        var loadedUserList = await userRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: loadedUserList));
      } catch (_) {
        emit(UserErrorState());
      }
    });

    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });
  }
}
