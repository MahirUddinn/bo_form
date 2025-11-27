part of 'stepper_cubit.dart';

class StepperState{
  final int currentStep;
  StepperState({required this.currentStep});

  StepperState copyWith({int? currentStep}){
    return StepperState(currentStep: currentStep ?? this.currentStep);
  }
}

