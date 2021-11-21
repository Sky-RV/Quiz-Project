class Lesson {

  late int ID;
  late String Name;
  late String TeacherName;
 // late Teacher TeacherName;
  late int TeacherID;
//  late Teacher TeacherID;
  late List<int> StudentsList;

  Lesson(String name, String teacherName){
    this.Name = name;
    this.TeacherName = teacherName;
  }

  // Lesson(int id, int teacherID){
  //   this.ID = id;
  //   this.TeacherID = teacherID;
  // }

}