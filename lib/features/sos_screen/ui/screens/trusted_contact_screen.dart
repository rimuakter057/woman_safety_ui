import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/core/utils/toast_message.dart';
import 'package:woman_safety_ui/features/common/widget/custom_appbar.dart';
import 'package:woman_safety_ui/features/sos_screen/data/models/trustedNumberModel.dart';


class TrustedContactScreen extends StatefulWidget {
  const TrustedContactScreen({super.key});
  static const String name = '/trusted-contact';

  @override
  State<TrustedContactScreen> createState() => _TrustedContactScreenState();
}

class _TrustedContactScreenState extends State<TrustedContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  List <TrustedContactModel> trustedContacts = [];
  int? editingIndex;

  void _addOrUpdateContact(){
    String name= nameController.text;
    String number = numberController.text.trim();
    if(name.isNotEmpty && number.isNotEmpty){
      trustedContacts.add(TrustedContactModel(name: name, number: number));
      nameController.clear();
      numberController.clear();
      setState(() {

      });
    }else{
      Utils().toastMessage("Please enter name and number");
    }

  }


  void removeContact(int index) {
    setState(() {
      trustedContacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Trusted Contact",),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'name',
                    border: InputBorder.none
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: TextField(
                  controller: numberController,
                  decoration: const InputDecoration(
                      hintText: 'number',
                      border: InputBorder.none
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              //add and remove button
              Card(child: IconButton(onPressed: (){
                _addOrUpdateContact();
              }, icon: const Icon(Icons.add,size: 20,color: AppColors.primaryColor,))),
           ],
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                itemCount: trustedContacts.length,
                itemBuilder: (context, index){
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(trustedContacts[index].name,style: const TextStyle(
                  fontSize: 18,
                ),),
                subtitle:Text(trustedContacts[index].number,),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   IconButton(onPressed: (){
                     removeContact(index);},
             icon: const Icon(Icons.delete,color: AppColors.primaryColor,),),

                  ],
                ),
              );
            }
            ),
          ),
        ],
        ),
      ),
    );
  }
}
