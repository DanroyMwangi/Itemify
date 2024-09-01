import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:itemify/application/redux/add_item_action.dart';
import 'package:itemify/domain/constants/app_colors.dart';
import 'package:itemify/domain/constants/app_strings.dart';
import 'package:itemify/domain/models/item.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? itemTitle;
    String? itemDescription;

    return Scaffold(
      backgroundColor: AppColors.whiteShade,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.chevron_left_rounded,
            size: 40,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          addItemString,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.itemTileBorderColor,
                  width: 1.5,
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Required field indicator
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: requiredFieldIndicatorText,
                          style: TextStyle(
                              color: Colors.black, fontStyle: FontStyle.italic),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 16),

                    // Item title input field
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: itemTitleText,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: enterTitleHint,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.buttonColor,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      validator: (value) {
                        // Validator for the item title field
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        itemTitle = value; // Save value to the variable
                      },
                    ),
                    const SizedBox(height: 16),

                    // Description input field
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: descriptionText,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: addDescriptionHint,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.buttonColor,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      minLines: 8,
                      maxLines: 10,
                      validator: (value) {
                        // Validator for the description field
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        itemDescription = value; // Save value to the variable
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Action buttons (Cancel and Add Item)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel button
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.buttonColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        cancelButtonText,
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Add Item button
                  InkWell(
                    onTap: () {
                      // Validate form and dispatch AddItemAction
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save(); // Save the form data
                        final newItem = Item(
                            title: itemTitle!, description: itemDescription!);
                        context.dispatch(AddItemAction(item: newItem));
                        Navigator.of(context).pop(); // Navigate back
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        addItemString,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
