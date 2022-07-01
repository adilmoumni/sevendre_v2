import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/backend/schema/users_record.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGoogle {
  static Future<User> signInUsingEmailPassword(
      String email, String password, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString("uidUser", user.uid);

      print(prefs.getString("uidUser"));

      // Navigator.pushReplacementNamed(context, '/TableauDeBoard');
      try {
        final usersRecord = await UsersRecord.collection.doc(user.uid).get();
        Map<String, dynamic> userGet = usersRecord.data();

        if (userGet["statut"] == "active") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("currentPassword", password);
          Navigator.pushReplacementNamed(context, '/CommencerLaSumilation');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Votre compte est desactiver.')));
          return null;
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('Une erreur est survenue merci de réessayer après.')));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Aucun utilisateur trouvé pour cet e-mail.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('mot de passe incorrect')));
      }
    }

    return user;
  }

  static Future sendPasswordResetEmail(
      String email, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: email).then((value) =>
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('email envoiée .')))
              .closed
              .then((value) => Navigator.pushNamed(context, '/Login')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log(e.code);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Aucun utilisateur trouvé pour cet e-mail.')));
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance
        .signOut()
        .whenComplete(() => (value) => Navigator.pushNamed(context, '/Login'));
  }
}
