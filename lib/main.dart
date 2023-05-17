import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // debug , run
  // root
  runApp(
      GetMaterialApp(
    home: Mystateless(),
  ));
}

// static , Immutable

// statemanagment =>  design > coding

// getx >

class Mystateless extends StatelessWidget {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  int c = 0;

  Mygetx mm = Get.put(Mygetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t2,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  mm.Addtwovalue(t1.text, t2.text);

                  // c = int.parse(t1.text) + int.parse(t2.text);
                },
                child: Text("Add")),
            Obx(() => Text("Sum = ${mm.sum.value}"))
          ],
        ),
      ),
    );
  }
}

class Mygetx extends GetxController {
  RxString sum = "".obs;
  double a = 0;
  double b = 0;

  void Addtwovalue(String t1, String t2) {
    if (t1.isNotEmpty) {
      a = double.parse(t1);
    } else {
      a = 0;
    }
    if (t2.isNotEmpty) {
      b = double.parse(t2);
    } else {
      b = 0;
    }

    double c = a+b;

    sum.value = c.toString();
  }
}

// dynamic , mutable
