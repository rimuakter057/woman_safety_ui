import 'package:fluttertoast/fluttertoast.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';

class Utils{
   void toastMessage(String message) {
     Fluttertoast.showToast(
         msg: message,

         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: AppColors.red,
         textColor: AppColors.white,
         fontSize: 16.0
     );
   }
}