import 'dart:async';
import 'dart:developer';
import 'package:calculator_converter/Cores/services/hive_service.dart';
import 'package:calculator_converter/Cores/services/navigation/service.dart';
import 'package:calculator_converter/Cores/services/services_locator.dart';
import 'package:calculator_converter/Features/conversion_history/domain/use_cases/conversions_history_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conversion_history_state.dart';

class ConversionHistoryCubit extends Cubit<ConversionHistoryState> {
  ConversionHistoryCubit(this.conversionsHistoryUseCase,)
      : super(ConversionHistoryInitial());


  ///Variables
  ConversionsHistoryUseCase conversionsHistoryUseCase;
  final conversionsHistoryValues = <num>[];
  final conversionsHistoryDate = <String>[];

  ///Methods
  static ConversionHistoryCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> onInit() async {
    emit(ConversionHistoryLoading());
    conversionsHistoryValues.clear();
    conversionsHistoryDate.clear();
    try {
      await checkIsConversionHistoryCached();
      _checkEmittingState(
          conversionsHistoryDate, conversionsHistoryValues, emit);
    } on Exception catch (e) {
      emit(ConversionHistoryError());
      log('Exception during fetching conversion history details 😥 $e');
    }
  }

  Future<void> getConversionsHistory(ConverterCubit converterCubit) async {
    final result = await conversionsHistoryUseCase(
      ConversionData(converterCubit.fromConversionValue.currencyId,
          converterCubit.toConversionValue.currencyId),
    );

    result.fold(
      (failure) {
        log('getConversionsHistory failure: ${failure.errorMessage}');
      },
      (conversionHistory) async {
        conversionsHistoryDate.addAll(
            conversionHistory.conversionsHistoryData.first.conversionsDates);
        conversionsHistoryValues.addAll(
            conversionHistory.conversionsHistoryData.first.conversionsValues);
        String key =
            '${converterCubit.fromConversionValue.currencyId}_${converterCubit.toConversionValue.currencyId}';
        locator<HiveService>()
            .primitiveBox
            .put('${key}_dates', List.of(conversionsHistoryDate));
        locator<HiveService>()
            .primitiveBox
            .put('${key}_values', List.of(conversionsHistoryValues));
      },
    );
  }

  Future<void> checkIsConversionHistoryCached() async {
    ConverterCubit converterCubit =
        ConverterCubit.get(NavigationService.navigationKey.currentContext);
    String key =
        '${converterCubit.fromConversionValue.currencyId}_${converterCubit.toConversionValue.currencyId}';
    if (locator<HiveService>().checkHistoryIsNotEmpty('${key}_values')) {
      log('History Cached');

      final conversionValues = await locator<HiveService>()
          .fetchCurrenciesHistoryWithKey('${key}_values').toList().cast<num>();
      final conversionDates = await locator<HiveService>()
          .fetchCurrenciesHistoryWithKey('${key}_dates').toList().cast<String>();
      conversionsHistoryValues.addAll(conversionValues);
      conversionsHistoryDate.addAll(conversionDates);
      log('History Values Cached: $conversionsHistoryValues');
      log('History Dates Cached: $conversionsHistoryDate');
    } else {
      log('History Online');
      await getConversionsHistory(converterCubit);
    }
  }

  void _checkEmittingState(
      List<String> historyDate, List<num> historyValues, emit) {
    if (historyDate.isEmpty || historyValues.isEmpty) {
      emit(ConversionHistoryError());
      log('Cannot fetch conversion history 😥');
      return;
    }
    log('Conversion history has been fetched successfully 💱');
    emit(ConversionHistoryLoaded(
      historyValues,
      historyDate,
    ));
  }
}
