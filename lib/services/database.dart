// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:to_do_list/models/user_model.dart';

// class Database {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<bool> createUser(UserModel user) async {
//     try {
//       await _firestore.collection('users').doc(user.id).set({
//         'name': user.name,
//         'email': user.email,
//       });
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<UserModel> getUser(String uid) async {
//     try {
//       DocumentSnapshot documentSnapshot =
//           await _firestore.collection('users').doc(uid).get();
//       return UserModel.fromDocumentSnapshot(documentSnapshot: documentSnapshot);
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }
// }
