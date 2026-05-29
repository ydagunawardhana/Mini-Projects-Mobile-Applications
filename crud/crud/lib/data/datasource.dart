import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/student.dart';

class Database {
  Future<void> addStudent(Map<String, dynamic> studentInfo, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("Students")
          .doc(id)
          .set(studentInfo);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List<Student>> getStudentDetails() async {
    List<Student> studentDetailsList = [];
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("Students").get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Student student = Student(
            name: documentSnapshot.get('name') ?? '',
            id: int.parse(documentSnapshot.get('id')),
            degree: documentSnapshot.get('degree')
            // Add more properties as needed
            );

        studentDetailsList.add(student);
      }

      return studentDetailsList;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<void> updateStudentDetails(
      Map<String, dynamic> studentInfo, String id) async {
    try {
      return await FirebaseFirestore.instance
          .collection("Students")
          .doc(id)
          .update(studentInfo);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      return await FirebaseFirestore.instance
          .collection("Students")
          .doc(id)
          .delete();
    } catch (e) {
      print('Error: $e');
    }
  }
}
