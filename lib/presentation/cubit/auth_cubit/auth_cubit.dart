import 'package:beginner_guide/core/constants/Strings/user_id.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_states.dart';


class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(AuthenticationInitialState());

  static AuthenticationCubit get(BuildContext context) =>
      BlocProvider.of(context);


  final FirebaseAuth _auth = FirebaseAuth.instance;


  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;


  registerWithEmailAndPassword(
      {required String ?email, required String ?password, required String?phone,required String?firstName,required String lastName,required String jobExperience,required String currentJob,required String address}) async {
    emit(RegisterLoadingState());
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      emit(RegisterSuccessState());
      createUser(email: email, phone: phone, id: userCredential.user!.uid,lastName: lastName,firstName: firstName,jobExperience:jobExperience ,currentJob: currentJob,address: address);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterWeakPasswordState());
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterEmailUsedState());
      }
    } catch (e) {
      emit(RegisterErrorState());
    }
  }



  signInWithEmailAndPassword({required String ?email ,required String ?password}) async {
    emit(LoginLoadingState());
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email!,
          password: password!,
      );

      _firebaseFireStore.collection('users').doc(userCredential.user!.uid).get().then((value) {
        userId =  value.data()!['uid'];
        userFirstName =  value.data()!['first_name'];
        userLastName =  value.data()!['last_name'];
        userCurrentJob =  value.data()!['currentJob'];

        emit(LoginSuccessState());


      }).catchError((onError){});

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

        emit(LoginUserNotFoundState());
      } else if (e.code == 'wrong-password') {
        emit(LoginUserWrongPasswordState());
      }
    }catch(e){
      emit(LoginErrorState());
    }
  }


  createUser(
      {required String email, required String ?phone, required String id,required String?firstName,required String?lastName,required String?currentJob,required String?jobExperience,required String?address}) {
    emit(CreateUserLoadingState());
    UserModel model = UserModel(firstName: firstName,lastName: lastName ,phone: phone, email: email, uid: id,currentJob: currentJob,jobExperience: jobExperience,address: address);
    _firebaseFireStore.collection('users').doc(id).set(model.toMap()).then((value) {
      emit(CreateUserSuccessState());

    }).catchError((onError){
      emit(CreateUserErrorState());

    });
  }
}