import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/app/utils/text_style.dart';
import 'package:woman_safety_ui/app/utils/sizes/size.dart';

import '../../../../app/asset_path.dart';

import '../common/widget/custom_appbar.dart';
import '../common/widget/custom_divider.dart';
import '../common/widget/drawer_widget.dart';
import '../number/emergency_number_screen.dart';
import 'Widget/floating_widget.dart';
import 'Widget/header_image.dart';
import 'Widget/note_text.dart';
import 'Widget/service_card.dart';
import 'data/service_list.dart';

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
      body: Column(
        children: [
          const HeaderImage(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: NoteText(),
          ),
          SizedBox(height: size.height * .02),
          const Text(
            "Our Services",
            style: TextStyle(color: AppColors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * .015),
          // Service cards section
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: serviceList.length,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.primaryColor,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: serviceList[index]['onTap'],
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 80, // Increased height
                  child: Center(
                    child: ListTile(
                      leading:
                        serviceList[index]['icon'],
                      title:  Text(
                        serviceList[index]['title'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),




      ],
      ),
    );
  }
}

