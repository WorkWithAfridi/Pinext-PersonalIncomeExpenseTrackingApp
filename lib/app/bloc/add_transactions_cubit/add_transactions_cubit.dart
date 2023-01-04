import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinext/app/services/handlers/transaction_handler.dart';

part 'add_transactions_state.dart';

class AddTransactionsCubit extends Cubit<AddTransactionsState> {
  AddTransactionsCubit()
      : super(
          AddTransactionsDefaultState(
            selectedTransactionMode: SelectedTransactionMode.enpense,
            selectedCardNo: "none",
            selectedDescription: "none",
            countAs: false,
          ),
        );

  changeSelectedTransactionMode(SelectedTransactionMode selectedTransactionMode) {
    emit(
      AddTransactionsDefaultState(
        selectedTransactionMode: selectedTransactionMode,
        selectedCardNo: state.selectedCardNo,
        selectedDescription: state.selectedDescription,
        countAs: state.countAs,
      ),
    );
  }

  toggleCountAs(value) {
    emit(
      AddTransactionsDefaultState(
        selectedTransactionMode: state.selectedTransactionMode,
        selectedCardNo: state.selectedCardNo,
        selectedDescription: state.selectedDescription,
        countAs: !state.countAs,
      ),
    );
  }

  addTransaction({
    required String amount,
    required String details,
    required String transctionType,
  }) async {
    emit(AddTransactionsLoadingState(
      selectedTransactionMode: state.selectedTransactionMode,
      selectedCardNo: state.selectedCardNo,
      selectedDescription: state.selectedDescription,
      countAs: state.countAs,
    ));
    await Future.delayed(const Duration(seconds: 2));
    String response = await TransactionHandler().addTransaction(
      amount: amount,
      description: details,
      transactionType: transctionType,
      cardId: state.selectedCardNo,
    );
    if (response == 'Success') {
      emit(AddTransactionsSuccessState(
        selectedTransactionMode: state.selectedTransactionMode,
        selectedCardNo: state.selectedCardNo,
        selectedDescription: state.selectedDescription,
        countAs: state.countAs,
      ));
    } else {
      emit(AddTransactionsErrorState(
        selectedTransactionMode: state.selectedTransactionMode,
        selectedCardNo: state.selectedCardNo,
        errorMessage: response,
        selectedDescription: state.selectedDescription,
        countAs: state.countAs,
      ));
    }
  }

  selectCard(String selectedCardNo) {
    emit(AddTransactionsDefaultState(
      selectedCardNo: selectedCardNo,
      selectedTransactionMode: state.selectedTransactionMode,
      selectedDescription: state.selectedDescription,
      countAs: state.countAs,
    ));
  }

  reset() {
    emit(AddTransactionsDefaultState(
      selectedTransactionMode: state.selectedTransactionMode,
      selectedCardNo: state.selectedCardNo,
      selectedDescription: state.selectedDescription,
      countAs: state.countAs,
    ));
  }

  changeSelectedDescription(String selectedDescription) {
    emit(AddTransactionsDefaultState(
      selectedTransactionMode: state.selectedTransactionMode,
      selectedCardNo: state.selectedCardNo,
      selectedDescription: selectedDescription,
      countAs: state.countAs,
    ));
  }
}
