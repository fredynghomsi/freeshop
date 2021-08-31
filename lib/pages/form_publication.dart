//import 'dart:html';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freeshop/api/firebase_api.dart';
import 'package:freeshop/widget/button_widget.dart';

class FormPublication extends StatefulWidget {
  @override
  _FormPublicationState createState() => _FormPublicationState();
}

class _FormPublicationState extends State<FormPublication> {
  UploadTask task;
  File file;

  Widget build(BuildContext context) {
    final fileName =
        file != null ? basename(file.path) : 'Aucun fichier selectionné';

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un nouvel article'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Entrer le nom de l\'article'),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Prix'),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Détails'),
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: [
                    ButtonWidget(
                      text: 'Selectionner une image',
                      icon: Icons.attach_file,
                      onClicked: selectFile,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      fileName,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ButtonWidget(
                      text: 'Publier',
                      icon: Icons.cloud_upload_outlined,
                      onClicked: uploadFile,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    task != null ? buildUploadStatus(task) : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path;
    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;
    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);
            return Text(
              '$percentage%',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
