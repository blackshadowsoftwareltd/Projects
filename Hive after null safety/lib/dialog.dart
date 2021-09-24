import 'package:flutter/material.dart';
import 'package:hivez/model/product.dart';

class AddUpdateDialog extends StatefulWidget {
  final ProductModel? productModel;
  final Function(String productName, double price) onClicked;

  const AddUpdateDialog({
    this.productModel,
    required this.onClicked,
  });

  @override
  _AddUpdateDialogState createState() => _AddUpdateDialogState();
}

class _AddUpdateDialogState extends State<AddUpdateDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.productModel != null) {
      final products = widget.productModel;

      nameController.text = products!.productName;
      amountController.text = products.price.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.productModel != null;
    final title = isEditing ? 'Edit Product' : 'Add Product';

    return AlertDialog(
        title: Text(title),
        content: Form(
            key: formKey,
            child: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              SizedBox(height: 8),
              buildName(),
              SizedBox(height: 8),
              buildAmount(),
            ]))),
        actions: <Widget>[
          buildCancelButton(context),
          buildAddButton(context, isEditing: isEditing)
        ]);
  }

  Widget buildName() => TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter Product Name',
      ),
      validator: (name) =>
          name != null && name.isEmpty ? 'Enter a name' : null);

  Widget buildAmount() => TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: 'Enter Price'),
      keyboardType: TextInputType.number,
      validator: (amount) => amount != null && double.tryParse(amount) == null
          ? 'Enter a valid number'
          : null,
      controller: amountController);

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
        child: Text(text),
        onPressed: () async {
          final isValid = formKey.currentState!.validate();

          if (isValid) {
            final name = nameController.text;
            final amount = double.tryParse(amountController.text) ?? 0;

            widget.onClicked(name, amount);

            Navigator.of(context).pop();
          }
        });
  }
}
