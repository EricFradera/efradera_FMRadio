import 'package:efradera_fmradio/core/resources/data_state.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/usecases/GetFmListUseCase.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmEvent.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteFMBloc extends Bloc<RemoteFMEvent, RemoteFmState> {
  final GetFmListUseCase _getFmListUseCase;
  RemoteFMBloc(this._getFmListUseCase) : super(const RemoteFMLoading()) {
    on<GetRadios>(onGetRadios);
  }
  void onGetRadios(GetRadios radios, Emitter<RemoteFmState> state) async {
    final dataState = await _getFmListUseCase();
    if (dataState is DataSucces && dataState.data!.isNotEmpty) {
      emit(RemoteFMLoaded(dataState.data!));
    }
    if (dataState is DataFail) {
      emit(RemoteFMError(dataState.error!));
    }
  }
}
