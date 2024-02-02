import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_2/bloc/user_event.dart';
import 'package:movies_2/bloc/user_state.dart';
import 'package:movies_2/model/user_model.dart';
import 'package:movies_2/resource/api_repository.dart';

class UserBloc extends Bloc<UserEvent, UserStates> {
  UserBloc() : super(UserInitialState()) {
    final ApiRepository apiRepository = ApiRepository();

    on((event, emit) async {
      try {
        emit(UserLoading());
        final List<UserModel> usersList = await apiRepository.fetchUserList();
        print("fdivjdfpkfpdjgjfgdjofpgojjgpdg");
        print(usersList.length);
        emit(UserLoaded(userList: usersList));
        if (usersList[0].error != null) {
          emit(UserError(error: usersList[0].error));
        }
      } on NetworkError {
        emit(
            const UserError(error: "Error fetching data, are you connected ?"));
      }
    });
  }
}
