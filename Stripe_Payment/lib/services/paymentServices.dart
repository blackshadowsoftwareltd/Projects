import 'package:flutter/services.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StripeTransactionResponse {
  String message;
  bool success;

  StripeTransactionResponse({this.message, this.success});
}

class StripeService {
  ///
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret =
      'sk_test_51IhKhZSCLPgGV16SNu4fsm7p0z1M2PGuParfuFAbcrkJFv0zrqOolQBZfILcWXGutsfoA12qVhavwIN4Gz3SqJyK00rzEV086W';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  ///
  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51IhKhZSCLPgGV16S1l2USVQMKSJPO6LmYru6tp1LYCW2F0NmUYuO89hCWNjzGjXm1CXk084KzqEKohLBqhWE35Gx003jOy7aFc",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  ///
  static Future<StripeTransactionResponse> payViaExistingCard(
      {String amount, String currency, CreditCard card}) async {
    try {
      ///
      var paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card));
      // print(jsonEncode(paymentMethod));
      ///
      var paymentIntent =
          await StripeService.createPaymentIntent(amount, currency, card);

      ///
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id));
      if (response.status == 'succeeded') {
        ///
        return new StripeTransactionResponse(
            message: 'Transaction successful', success: true);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed', success: false);
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction Failed : ${err.toString()}', success: false);
    }
  }

  ///
  static Future<StripeTransactionResponse> payViaNewCard(
      {String amount, String currency, card}) async {
    try {
      ///
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      // print(jsonEncode(paymentMethod));
      ///
      var paymentIntent =
          await StripeService.createPaymentIntent(amount, currency, card);

      ///
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id));
      if (response.status == 'succeeded') {
        ///
        return new StripeTransactionResponse(
            message: 'Transaction successful', success: true);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed', success: false);
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction Failed : ${err.toString()}', success: false);
    }
  }

  ///
  static getPlatformExceptionResult(err) {
    String message = 'Somthing went wrong';
    if (err.code == 'cancelled') message = 'Transaction cancelled';
    return StripeTransactionResponse(message: message, success: false);
  }

  ///
  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency, card) async {
    Map<String, dynamic> body = {
      'amount': amount,
      'currency': currency,
      'payment_method_types[]': 'card'
    };

    ///
    try {
      var response = await http.post(Uri.parse(StripeService.paymentApiUrl),
          body: body, headers: StripeService.headers);
      return jsonDecode(response.body);

      ///
    } catch (err) {
      print('error :${err.toString()}');
    }
  }
}
