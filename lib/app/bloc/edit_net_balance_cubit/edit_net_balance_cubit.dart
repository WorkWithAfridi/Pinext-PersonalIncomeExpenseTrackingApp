import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../services/firebase_services.dart';
import '../../services/handlers/user_handler.dart';

part 'edit_net_balance_state.dart';

class EditNetBalanceCubit extends Cubit<EditNetBalanceState> {
  EditNetBalanceCubit() : super(EditNetBalanceDefaultState());
  updateNetBalance({required String newNetBalance}) async {
    emit(EditNetBalanceLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    String response = "Error";
    try {
      FirebaseServices().firebaseFirestore.collection("pinext_users").doc(UserHandler().currentUser.userId).update({
        "netBalance": newNetBalance,
      });
      response = "Success";
    } on FirebaseException catch (err) {
      response = err.message.toString();
    } catch (err) {
      response = err.toString();
    }
    if (response == "Success") {
      emit(EditNetBalanceSuccessState());
    } else {
      emit(EditNetBalanceErrorState(errorMessage: response));
    }
  }

  resetState() {
    emit(EditNetBalanceDefaultState());
  }
}
