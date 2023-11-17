import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CallApi extends StatelessWidget {
  CallApi({Key? key}) : super(key: key);

  OpenseaController openseaController = Get.put(OpenseaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('opensea Api')),
        body: Obx(() =>
              OpenseaController().isLoading.value ? const Center(child: CircularProgressIndicator(),
          )
              : ListTile(
                        title: Text(openseaController.openseaModel.value.data!.high.toString()),
                        subtitle:  Text(openseaController.openseaModel.value.data!.ask.toString()),
                        leading:  const Icon(Icons.image),
              ),),
        );
  }
}
