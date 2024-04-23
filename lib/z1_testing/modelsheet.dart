import 'package:flutter/material.dart';
import 'package:mango/z2_testing/button_class.dart';

class ModalBottomSheet extends StatelessWidget {
  final Color? bgcolor;
  final IconButton? iconButton;
  final VoidCallback? callBack;

  const ModalBottomSheet({
    this.bgcolor,
    this.callBack,
    this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      buttonName: 'bottom sheet',
      callBack: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            return Container(
              height: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 25),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera,
                            size: 70,
                          ),
                        ),
                        const Text('Camera'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Container(
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.folder,
                                color: Colors.lightBlue,
                                size: 70,
                              )),
                          const Text('Files'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
