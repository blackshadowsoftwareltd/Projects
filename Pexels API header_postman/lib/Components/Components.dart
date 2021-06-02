// import 'package:flutter/material.dart';
// import 'package:pex/Helper/ReUsableHelper.dart';
// import 'package:pex/Model/ReUsableModel.dart';
//
// import 'DemoView.dart';
//
// class Component extends StatefulWidget {
//   @override
//   _ComponentState createState() => _ComponentState();
// }
//
// class _ComponentState extends State<Component> {
//   Future<ReUsableModel> reUsableModel;
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   reUsableModel = ReUsableHelper().getImage(context, '');
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     /// In The Column, Expanded is the best solution for RenderFlex overflow.
//
//     return Expanded(
//         child: FutureBuilder<ReUsableModel>(
//       future: reUsableModel,
//       builder: (context, snapshot) {
//         if (snapshot.hasError)
//           print('error');
//         else if (snapshot.hasData) {
//           return Scrollbar(
//             showTrackOnHover: true,
//             thickness: 7,
//             hoverThickness: 7,
//             isAlwaysShown: true,
//             radius: Radius.circular(20),
//             child: GridView.builder(
//                 padding: EdgeInsets.all(3),
//                 shrinkWrap: true,
//                 itemCount: snapshot.data.photos.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, childAspectRatio: 2 / 2.9),
//                 itemBuilder: (context, index) {
//                   var url = snapshot.data.photos[index].src.portrait;
//                   var original = snapshot.data.photos[index].src.original;
//                   var author = snapshot.data.photos[index].photographer;
//                   return DemoView(
//                     url: url,
//                     author: author,
//                     originalImage: original,
//                   );
//                 }),
//           );
//         } else
//           return Center(child: CircularProgressIndicator());
//
//         return Center(child: CircularProgressIndicator());
//         // return Center(child: CircularProgressIndicator());
//       },
//     ));
//   }
// }
