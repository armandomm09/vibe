import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum PostState {
  successful,
  serverError
}

class FirebasePoster {
  
  static Future<PostState> doPostUserInfo(String name, String email, String phoneNumber) async {
    try {
      CollectionReference reference = FirebaseFirestore.instance.collection("formData2");
      await reference.add({
        'Name': name,
        'email': email,
        'phonenumber': phoneNumber
      });
      print("sent");
      return PostState.successful;
    } catch (e) {
      print(e.toString());
      return PostState.serverError;
    }
  }

   static StreamBuilder<QuerySnapshot> getUserCollectionStream() {
    CollectionReference reference = FirebaseFirestore.instance.collection("formData2");
    
    return StreamBuilder<QuerySnapshot>(
      stream: reference.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final clients = snapshot.data?.docs.toList();
          return Expanded(
            child: ListView.builder(
              itemCount: clients!.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(client['Name']),
                    Text(client['email']),
                    Text(client['phonenumber']),
                  ],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return CircularProgressIndicator(); // Muestra un indicador de carga mientras se carga la lista
        }
      },
    );
  }

 }
