import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, ParametersClass> {
  Future<Either<GeneralFailureModel, T>> call(ParametersClass parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
