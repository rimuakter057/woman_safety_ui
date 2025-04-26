import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:woman_safety_ui/app/utils/color.dart';
import 'package:woman_safety_ui/app/utils/sizes/size.dart';
import 'package:woman_safety_ui/app/utils/text_style.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../common/widget/custom_appbar.dart';
import 'Widget/floating_widget.dart';
import 'Widget/header_image.dart';
import 'Widget/note_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: AppColors.black,
        floatingActionButton: FloatingWidget(),
        appBar:const CustomAppBar(title: 'আমাদের সেবা সমূহ',),
          body: Column(
          children: [

            HeaderImage(),

            /// marque text
            const NoteText(),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              "কল দিয়ে যোগাযোগ করুন",
              style: MyTextStyle.buttonTextStyle,
            ),
            SizedBox(
              height: size.height * .015,
            ),
            Expanded(
              child: SizedBox(
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(AppSizes.defaultPadding(context)),
                        child: Column(
                          children: [
                            Container(
                              height: size.height * .15,
                              width: size.width * .18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.safety_check,
                                color: AppColors.blue,
                                size: size.height * .08,
                              )),
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Text(
                              "abc",
                              style: MyTextStyle.commonTextStyle,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}









