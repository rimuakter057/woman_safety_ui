import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import '../common/widget/custom_appbar.dart';
import '../common/widget/custom_icon.dart';
import 'data/faq_list.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});
  static const String name = '/faq-center-screen';
  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Faq",leadingWidget: CustomIcon(),),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Icon(Icons.help_outline, size: 28, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                "FAQ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mapping through the faqData
          ...faqData.map((faqItem) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                faqItem["question"]!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                faqItem["answer"]!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 12),
            ],
          )),
        ],
      ),

    );
  }
}





