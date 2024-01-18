import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:session_app/services/single_data_service.dart';

part 'single_data_state.dart';

class SingleDataCubit extends Cubit<SingleDataState> {
  SingleDataCubit() : super(SingleDataInitial());

  void getSingleData() async {
    try {
      emit(SingleDataLoading());

      String data = await SingleDataService().getSingleData();

      emit(SingleDataSuccess(data));
    } catch (e) {
      emit(SingleDataFailed(e.toString()));
    }
  }
}
