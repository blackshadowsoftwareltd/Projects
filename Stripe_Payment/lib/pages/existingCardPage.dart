import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:strip_payment/services/paymentServices.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ExistingCardsPage extends StatefulWidget {
  @override
  _ExistingCardsPageState createState() => _ExistingCardsPageState();
}

class _ExistingCardsPageState extends State<ExistingCardsPage> {
  List cards = [
    {
      'cardNumber': 4242424242424242,
      'expiryDate': '04/24',
      'cardHolderName': 'First Holder Name',
      'cvvCode': '424',
      'showBackView': false,
    },
    {
      'cardNumber': 5555555555554444,
      'expiryDate': '06/16',
      'cardHolderName': 'Second Holder Name',
      'cvvCode': '542',
      'showBackView': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Existing Card Page')),
        body: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              var card = cards[index];
              return InkWell(
                  onTap: () => payViaExistingCard(context, card),
                  child: CreditCardWidget(
                      cardNumber: card['cardNumber'].toString(),
                      expiryDate: card['expiryDate'],
                      cardHolderName: card['cardHolderName'],
                      cvvCode: card['cvvCode'],
                      showBackView: false

                      ///true when we want to show cvv(back) view
                      ));
            }));
  }

  payViaExistingCard(BuildContext context, card) async {
    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(message: 'Please wait...');

    await dialog.show();

    ///
    var expiryArr = card['expiryDate'].split('/');

    ///
    CreditCard stripeCard = CreditCard(
        number: card['cardNumber'],
        expMonth: int.parse(expiryArr[0]),
        expYear: int.parse(expiryArr[1]));

    ///
    var response = await StripeService.payViaExistingCard(
        amount: '12000', currency: 'USD', card: stripeCard);

   await dialog.hide();

    ///
    if (response.success == true) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(
              content: Text(response.message), duration: Duration(seconds: 2)))
          .closed
          .then((value) => Navigator.pop(context));
    }
  }
}
