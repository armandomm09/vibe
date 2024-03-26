import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/auths/firebase_post.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/styles/app_colors.dart';

class UpdateForm extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String clientId;

  const UpdateForm({
    Key? key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.clientId,
  }) : super(key: key);

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name;
    emailController.text = widget.email;
    phoneNumberController.text = widget.phoneNumber;

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void _showMessage(PostState state) {
    if (mounted) {
      final messenger = ScaffoldMessenger.of(context);
      final message = state == PostState.successful
          ? 'Data updated successfully!'
          : 'Failed to update data. Please try again.';
      final snackBar = SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: state == PostState.successful ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
      );
      messenger.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hint: "Name",
          controller: nameController,
        ),
        AppTextField(
          hint: "Email",
          controller: emailController,
        ),
        AppTextField(
          hint: "Phone Number",
          controller: phoneNumberController,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            var collection = FirebaseFirestore.instance.collection("formData2");
            try {
              await collection.doc(widget.clientId).update({
                "Name": nameController.text,
                "email": emailController.text,
                "phonenumber": phoneNumberController.text
              });
              _showMessage(PostState.successful);
              Navigator.pop(context);
            } catch (e) {
              _showMessage(PostState.serverError);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.extraTone,
            foregroundColor: Colors.black,
          ),
          child: const Text("Update info"),
        ),
       
      ],
    );
  }
}
