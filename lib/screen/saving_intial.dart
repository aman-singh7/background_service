import 'package:flutter/material.dart';
import 'package:flutter_background_service/services/storage_service.dart';

class SavingIntial extends StatelessWidget {
  const SavingIntial({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Start Saving..',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: OutlinedButton(
                    onPressed: () {
                      final current = StorageService.savingState ?? false;

                      StorageService.updateSavingState = !current;
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    child: const Text("Start"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
