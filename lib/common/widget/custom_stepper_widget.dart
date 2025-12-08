import 'package:flutter/material.dart';

class TopStepperWidget extends StatelessWidget {
  final List<String> steps;
  final int currentStep;
  final Function(int) onStepTapped;
  final ScrollController? controller;

  const TopStepperWidget({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.onStepTapped,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(steps.length, (index) {
          final isCompleted = index < currentStep;
          final isActive = index == currentStep;
          final isLast = index == steps.length - 1;

          return GestureDetector(
            onTap: () {
              onStepTapped(index);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (isActive || isCompleted)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).disabledColor,
                  ),
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: isCompleted
                          ? Icon(
                              Icons.check,
                              size: 16,
                              color: Theme.of(context).colorScheme.onSecondary,
                            )
                          : Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: (isActive || isCompleted)
                                    ? Theme.of(context).colorScheme.onSecondary
                                    : Theme.of(context).hintColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),

                ),
                SizedBox(width: 8),
                Text(
                  steps[index],
                  style: TextStyle(
                    color: (isActive || isCompleted)
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).hintColor,
                    fontWeight: (isActive || isCompleted)
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                if (!isLast)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
