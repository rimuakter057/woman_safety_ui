import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import '../common/widget/custom_appbar.dart';
import '../common/widget/drawer_widget.dart';
import 'Widget/floating_widget.dart';
import 'Widget/header_image.dart';
import 'Widget/note_text.dart';
import 'data/service_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String name = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      floatingActionButton: FloatingWidget(),
    appBar: AppBar(
      backgroundColor: AppColors.primaryColor,
      title:Text('আমাদের সেবা সমূহ',style: TextStyle(color: AppColors.white),),
      centerTitle: true,
      automaticallyImplyLeading: false,
    ),
    //  appBar: const CustomAppBar(title: 'আমাদের সেবা সমূহ'),
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
            style: TextStyle(
                color: AppColors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * .015),


          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(serviceList.length, (index) {
                    return GestureDetector(
                      onTap:  serviceList[index]['onTap'],
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        height: 160,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFD32F2F),
                              Color(0xFFF8BBD0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: serviceList[index]['icon'],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              maxLines: 2,
                              serviceList[index]['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
