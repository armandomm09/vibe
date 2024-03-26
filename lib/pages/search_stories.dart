import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/auths/firebase_post.dart';
import 'package:flutter_application_5/components/app_messenger.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/pages/modify_story.dart';
import 'package:flutter_application_5/pages/update_form.dart';
import 'package:flutter_application_5/styles/text_styles.dart';



class SearchStories extends StatefulWidget {
  const SearchStories({super.key});

  @override
  _SearchStoriesState createState() => _SearchStoriesState();
}

class _SearchStoriesState extends State<SearchStories> {

  TextEditingController searchController = TextEditingController();
  List allResults = [];
  List resultsList = [];

  searchResultList() {
    var shownResults = [];

    if(searchController.text != ""){
      for(var clientSnapShot in allResults){
        var name = clientSnapShot['Name'].toString().toLowerCase();
        
        if(name.contains(searchController.text)){
          shownResults.add(clientSnapShot);
        }
      }
    } else {
      shownResults = List.from(allResults);
    }

    setState(() {
      resultsList = shownResults;
    });
  }

  getClientStream() async {
      var data = await FirebaseFirestore.instance.collection("formData2").orderBy("Name").get();

      setState(() {
        allResults = data.docs;

      });
      searchResultList();

    }

  @override
  void initState() {
    searchController.addListener(searchOnChange);
    getClientStream();
    super.initState();
  }

  searchOnChange() {
    searchResultList();
  }

  

  @override
  void dispose() {
    searchController.removeListener(searchOnChange);
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: Toolbar(titleWidget: 
      CupertinoSearchTextField(
        controller: searchController,
      )),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(resultsList[index]["Name"]),

            subtitle: Text(resultsList[index]["phonenumber"]),
            trailing: IconButton(
            onPressed: () async {
              var collection = FirebaseFirestore.instance.collection("formData2");
            try {
              await collection.doc(resultsList[index].id).delete();
              setState(() {
              AppMessenger.showMessage(PostState.successful, context);
              });
            } catch (e) {
              AppMessenger.showMessage(PostState.serverError, context);
            }
            }, 
            icon: Icon(Icons.delete_outlined,)),

            leading: IconButton(
              padding: EdgeInsets.all(8.0),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return ModifyStory(clientId: resultsList[index].id);
                })
              ); 
            }, 
            icon: Icon(Icons.edit,)),

          );
      },
      itemCount: resultsList.length,)
    );
  }
}
