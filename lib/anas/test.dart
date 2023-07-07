import 'package:flutter/material.dart';

class SelectedChoicesBox extends StatelessWidget {
  final List<String> selectedChoices;

  SelectedChoicesBox({required this.selectedChoices});
  bool _pickCitiesIsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 3,
                children: selectedChoices.map((choice) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        choice,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    Icon(_pickCitiesIsExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),

          ],
        ),
      ),
    );
  }
}
