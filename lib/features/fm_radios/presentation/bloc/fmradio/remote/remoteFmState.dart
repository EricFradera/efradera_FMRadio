import 'package:dio/dio.dart';
import 'package:efradera_fmradio/features/fm_radios/domain/entities/FMRadioEntity.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteFmState extends Equatable {
  final List<FMRadioEntity>? radios;
  final DioException? exception;

  const RemoteFmState({this.radios, this.exception});
  @override
  List<Object> get props => [radios!, exception!];
}

class RemoteFMLoading extends RemoteFmState {
  const RemoteFMLoading();
}

class RemoteFMLoaded extends RemoteFmState {
  const RemoteFMLoaded(List<FMRadioEntity> radiosList)
      : super(radios: radiosList);
}

class RemoteFMError extends RemoteFmState {
  const RemoteFMError(DioException exception) : super(exception: exception);
}
