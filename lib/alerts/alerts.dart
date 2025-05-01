// import 'package:flutter/material.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

// class Alerts extends StatelessWidget {
//    String alertMessage;
//    ContentType alertType;
//    Alerts({super.key, required this.alertMessage, required this.alertType});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//               child: const Text('Show Awesome SnackBar'),
//               onPressed: () {
//                 final snackBar = SnackBar(
//                   /// need to set following properties for best effect of awesome_snackbar_content
//                   elevation: 0,
//                   behavior: SnackBarBehavior.floating,
//                   backgroundColor: Colors.transparent,
//                   content: AwesomeSnackbarContent(
//                     title: '',
//                     message:alertMessage,
//                     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
//                     contentType: alertType,
//                   ),
//                 );

//                 ScaffoldMessenger.of(context)
//                   ..hideCurrentSnackBar()
//                   ..showSnackBar(snackBar);
//               },
//             );
//   }
// }

// import 'package:flutter/material.dart';

// class Alerts extends StatelessWidget {
//      String alertMessage;
//      Alerts({super.key, required this.alertMessage});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Snackbar Example"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             final snackBar = SnackBar(
//               content: Text(alertMessage),
//               duration: Duration(seconds: 3), // Duration for which snackbar will be visible
//               action: SnackBarAction(
//                 label: 'Close',
//                 onPressed: () {
//                   // Some action to perform when "Close" is pressed
//                 },
//               ),
//             );

//             // Show the Snackbar
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           },
//           child: Text('Show Snackbar'),
//         ),
//       ),
//     );
//   }
// }


// class AlertMsg {
//   show(String alertMessage,ContentType alertType){
//   Alerts(alertMessage: alertMessage, alertType: alertType);
//   }




// class AlertMsg {
//   show(String alertMessage){
//   Alerts(alertMessage: alertMessage);
//   }
// }

import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
class Alerts {
  static show(BuildContext context, String alertMessage, ContentType alertType) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      duration: Duration(seconds: 1),
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: '',
        message: alertMessage,
        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: alertType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}


class AlertPopUpMessage{
   static Future<String?> logoutAlrt(BuildContext context, String alertMessage) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(alertMessage),
          // content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'no');
              } ,
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'yes');
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
  }
}
