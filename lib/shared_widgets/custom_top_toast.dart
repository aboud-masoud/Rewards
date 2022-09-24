import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/firebase_cloud_messaging.dart';

enum ToastEnum { Successful, Failed, Pending }

class CustomTopToast extends StatelessWidget {
  final String topMessage;
  final String? bottomMessage;
  final Function? onDismissAction;

  final ToastEnum? toastType;

  const CustomTopToast(
      {super.key, this.topMessage = "Notification", this.toastType, this.bottomMessage, required this.onDismissAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ), //set desired text scale factor here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 50),
              bottomMessage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Stack(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                  color: const Color(0xff273A47),
                                  boxShadow: [BoxShadow(color: const Color(0xffEBEDEF).withOpacity(0.05))]),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 20,
                                        child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: toastType == ToastEnum.Successful
                                                ? const Color(0xff11A77A)
                                                : toastType == ToastEnum.Failed
                                                    ? const Color(0xffD54140)
                                                    : const Color(0xffF79D38),
                                            child: toastType == ToastEnum.Successful
                                                ? const Icon(
                                                    Icons.check,
                                                    size: 15,
                                                    color: Color(0xffFFFFFF),
                                                  )
                                                : toastType == ToastEnum.Failed
                                                    ? CustomText(
                                                        title: "!",
                                                        style: CustomTextStyle().medium(color: Colors.white, size: 20))
                                                    : const Icon(
                                                        Icons.hourglass_full,
                                                        size: 15,
                                                        color: Colors.white,
                                                      ))),
                                    Expanded(
                                      flex: 90,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                shouldFit: false,
                                                maxLins: 3,
                                                title: topMessage,
                                                textOverflow: TextOverflow.visible,
                                                style: CustomTextStyle().medium(color: Colors.white, size: 14)),
                                            const SizedBox(height: 5),
                                            CustomText(
                                                shouldFit: false,
                                                maxLins: 4,
                                                title: bottomMessage,
                                                style: CustomTextStyle()
                                                    .regular(color: const Color(0xffE0E0E0), size: 12)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.white,
                                      width: .5,
                                    ),
                                    Expanded(
                                      flex: 20,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                            elevation: MaterialStateProperty.all(0),
                                          ),
                                          onPressed: () {
                                            onDismissAction!();
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ])),
                          Container(
                            color: toastType == ToastEnum.Successful
                                ? const Color(0xff11A77A)
                                : toastType == ToastEnum.Failed
                                    ? const Color(0xffD54140)
                                    : const Color(0xffF79D38),
                            width: MediaQuery.of(context).size.width,
                            height: 4,
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
