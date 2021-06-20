import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:strip_payment/pages/existingCardPage.dart';
import 'package:strip_payment/services/paymentServices.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;
              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle);
                  text = Text('Pay via New Card');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card);
                  text = Text('Pay via Existing Card');
                  break;
              }
              return ListTile(
                title: text,
                leading: icon,
                onTap: () => onItemPressed(context, index),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: themeData.primaryColor,
                  thickness: 1,
                ),
            itemCount: 2),
      ),
    );
  }

  onItemPressed(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExistingCardsPage()));
        break;
    }
  }

  void payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(message: 'Please wait...');

    await dialog.show();
    var response =
        await StripeService.payViaNewCard(amount: '15000', currency: 'USD');

    ///
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(response.message), duration: Duration(seconds: 5)));
    await dialog.hide();
  }
}
