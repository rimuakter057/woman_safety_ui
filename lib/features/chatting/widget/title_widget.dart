// import 'package:flutter/material.dart';
//
// import '../../../app/utils/color/app_colors.dart';
// import '../screens/AllChatList/MessagePageDetails/message_details.dart';
//
//
// class AppBarTitleWidget extends StatelessWidget {
//   const AppBarTitleWidget({
//     super.key,
//     required this.widget,
//   });
//
//   final MessageDetails widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: CircleAvatar(
//         backgroundColor: Colors.white,
//         radius: 20,
//         child: Image.asset(
//           widget.profile,
//           fit: BoxFit.fill,
//           height: 20,
//           width: 20,
//         ),
//       ),
//       title: Text(
//         widget.name,
//         overflow: TextOverflow.ellipsis,
//         style: Theme.of(context).textTheme.bodyMedium,
//       ),
//       subtitle: Text(
//         "last seen today at 12:04 pm",
//         style: Theme.of(context)
//             .textTheme
//             .bodySmall
//             ?.copyWith(color: AppColors.white),
//       ),
//     );
//   }
// }