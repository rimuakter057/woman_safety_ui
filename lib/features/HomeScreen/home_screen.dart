import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/app/utils/text_style.dart';
import 'package:woman_safety_ui/app/utils/sizes/size.dart';

import '../../../../app/asset_path.dart';

import '../common/widget/custom_appbar.dart';
import '../common/widget/drawer_widget.dart';
import 'Widget/floating_widget.dart';
import 'Widget/header_image.dart';
import 'Widget/note_text.dart';
import 'Widget/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const String name= '/home-screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      drawer: DrawerWidget(userName: 'Rimu', userEmail: 'email33@gmail.com',),
      floatingActionButton: FloatingWidget(),
      appBar: const CustomAppBar(title: 'আমাদের সেবা সমূহ'),
      body: SingleChildScrollView(  // Ensures content doesn't overflow
        child: Column(
          children: [
            HeaderImage(),
            const NoteText(),

            SizedBox(height: size.height * .02),

            Text(
              "কল দিয়ে যোগাযোগ করুন",
              style: MyTextStyle.buttonTextStyle.copyWith(color: AppColors.black),
            ),

            SizedBox(height: size.height * .015),

            // Service cards section
            Padding(
              padding: EdgeInsets.all(AppSizes.defaultPadding(context)),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),  // Disable scrolling for GridView inside Column
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,  // 2 columns
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 5,
                ),
                itemCount: 6,  // Number of services
                itemBuilder: (context, index) {
                  return Column(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                            elevation: 5,
                            shadowColor: AppColors.white,
                            child: Padding(
                              padding:  EdgeInsets.all(10),
                              child: Image.asset(AssetImages.dua),
                            ))),
                    Text("service",style: Theme.of(context).textTheme.bodyMedium,)
                    
                  ],);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

