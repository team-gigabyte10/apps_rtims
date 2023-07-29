import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';

class MultiChoiceDialogController extends GetxController {
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'].obs;
  final selectedItems = <String>[].obs;

  void toggleSelectedItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  void clearSelectedItems() {
    selectedItems.clear();
  }

  void submitSelectedItems() {
    // Do something with selectedItems
    print('Selected items: $selectedItems');
    Get.back(); // Close dialog
  }
}

class MultiChoiceDialog extends StatelessWidget {
  final controller = Get.put(MultiChoiceDialogController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select items'),
      content: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: controller.items
                .map((item) => CheckboxListTile(
                      title: Text(item),
                      checkColor: Colors.white,
                      activeColor: Colors.indigo,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      value: controller.selectedItems.contains(item),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        controller.toggleSelectedItem(item);
                      },
                    ))
                .toList(),
          )),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: Text('Clear'),
              onPressed: () {
                controller.clearSelectedItems();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Get.back(); // Close dialog
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                controller.submitSelectedItems();
              },
            ),
          ],
        ),
      ],
    );
  }

  void voiceRecordDialog(String title, double width) {
    String villageNameBangla = "";
    Get.generalDialog(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Container(
              height: 400,
              width: width,
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "Record Audio",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ).flexible(),
                  SizedBox(height: 20),
                  Text('Please record a clear voice with minimum 20 sec')
                      .flexible(),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.mic, size: 20),
                        label: Text(
                          "Start Record",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        onPressed: () {},
                      ).widthAndHeight(height: 50, width: 130),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Stop Record',
                          style: TextStyle(fontSize: 12),
                        ),
                      ).widthAndHeight(height: 50, width: 130),
                    ],
                  ).flexible(),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Audio.mp3",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                    ),
                  ).paddingAll(Dimensions.paddingSizeSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: null,
                        child: Text('OK'),
                      ).widthAndHeight(height: 40, width: 100),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: null,
                        child: Text('CANCEL'),
                      ).widthAndHeight(height: 40, width: 100),
                    ],
                  ).flexible(),
                ],
              ),
            ),
          ),
        );
      },
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
}
