import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentHelper extends ChangeNotifier {
  TimeOfDay deliveryTime = TimeOfDay.now();
  bool showCheckOutButton = false;

  bool get getShowCheckOutButton => showCheckOutButton;

  Future selectTime(BuildContext context) async {
    final selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectedTime != null && selectedTime != deliveryTime) {
      deliveryTime = selectedTime;
      print(deliveryTime.format(context));
      notifyListeners();
    }
  }

  showCheckButtonMethod() {
    showCheckOutButton = true;
    notifyListeners();
  }

  handlePaymentSuccess(
      BuildContext context, PaymentSuccessResponse paymentSuccessResponse) {
    return showResponse(context, paymentSuccessResponse.paymentId);
  }

  handlePaymentError(
      BuildContext context, PaymentFailureResponse paymentFailureResponse) {
    return showResponse(context, paymentFailureResponse.message);
  }

  handleExternalWallet(
      BuildContext context, ExternalWalletResponse externalWalletResponse) {
    return showResponse(context, externalWalletResponse.walletName);
  }

  showResponse(BuildContext context, String respons) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height - 100,
            color: Colors.deepPurpleAccent,
            child: Text(
              'The respons is $respons',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          );
        });
  }
}
