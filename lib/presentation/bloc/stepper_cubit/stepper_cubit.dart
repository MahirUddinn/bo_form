import 'package:flutter_bloc/flutter_bloc.dart';
part 'stepper_state.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperState(currentStep: 0));
  void onStepForward(){
    emit(state.copyWith(currentStep: state.currentStep+1));
  }
  void onStepBackwards(){
    emit(state.copyWith(currentStep: state.currentStep-1));
  }
  void onStepTapped(index){
    emit(state.copyWith(currentStep: index));
  }

}
