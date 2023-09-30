import 'package:dio/dio.dart';
import 'package:efradera_fmradio/features/fm_radios/data/data_sources/remote/FmApiService.dart';
import 'package:efradera_fmradio/features/fm_radios/data/repository/fm_radio_repo_impl.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/repository/fmRadioRepository.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/usecases/GetFmListUseCase.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmBloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //DIO
  sl.registerSingleton<Dio>(Dio());
  //Dependencies
  sl.registerSingleton<FMApiService>(FMApiService(sl()));
  sl.registerSingleton<FMRadioRepository>(FmRadioReposImpl(sl()));
  //UseCases
  sl.registerSingleton<GetFmListUseCase>(GetFmListUseCase(sl()));

  //Blocs
  sl.registerFactory(() => RemoteFMBloc(sl()));
}
