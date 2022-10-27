import 'dart:developer';
import 'package:calculator_converter/Cores/services/navigation/service.dart';
import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history_data.dart';
import 'package:calculator_converter/Features/conversion_history/domain/use_cases/conversions_history_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conversion_history_state.dart';

class ConversionHistoryCubit extends Cubit<ConversionHistoryState> {
  ConversionHistoryCubit(this.conversionsHistoryUseCase)
      : super(ConversionHistoryInitial());

  ///Variables
  ConversionsHistoryUseCase conversionsHistoryUseCase;
  final conversionsHistoryValues = <ConversionHistoryData>[];
  ConverterCubit converterCubit = ConverterCubit.get(
      NavigationService.navigationKey.currentContext);
  ///Methods
  static ConversionHistoryCubit get(context) {
    return BlocProvider.of(context);
  }



  Future<void> getConversionsHistory() async {
    emit(ConversionHistoryLoading());
    final result = await conversionsHistoryUseCase(
       ConversionData(converterCubit.fromConversionValue.currencyId, converterCubit.toConversionValue.currencyId),
    );

    conversionsHistoryValues.clear();

    result.fold(
      (failure) {
        emit(ConversionHistoryError());
        log('getConversionsHistory failure: ${failure.errorMessage}');
      },
      (conversionHistory) async {
        conversionsHistoryValues.addAll(List<ConversionHistoryData>.from(
            conversionHistory.conversionsHistoryData));
        emit(ConversionHistoryLoaded(conversionsHistoryValues.first));

        log('getConversionsHistory conversionsDates: ${conversionsHistoryValues.first.conversionsDates}');
        log('getConversionsHistory conversionsValues: ${conversionsHistoryValues.first.conversionsValues}');
      },
    );
  }
}
