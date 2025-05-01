class CategoryCollegeModel{
    List<StudentCategory> studentCategory;
    List<StudentCollege> studentCollege;
    CategoryCollegeModel(this.studentCategory, this.studentCollege);
}

class StudentCategory{
     int? studentCategoryId;
    String? studentCategoryName;

    StudentCategory({
         required this.studentCategoryId,
         required this.studentCategoryName
    });

    factory StudentCategory.fromJson(Map<String,dynamic> json) => StudentCategory(
          studentCategoryId: json["StudentCategory_Id"],
          studentCategoryName: json["StudentCategory_Name"]
    );

    Map<String,dynamic> toJson(){
      return {
          "StudentCategory_Id": studentCategoryId,
          "StudentCategory_Name":studentCategoryName
      };
    }
}

class StudentCollege{
    int? collegeId;
    String? collegeName;

    StudentCollege({
         required this.collegeId,
         required this.collegeName
    });

    factory StudentCollege.fromJson(Map<String,dynamic> json) => StudentCollege(
          collegeId: json["College_Id"],
          collegeName: json["College_Name"]
    );

    Map<String,dynamic> toJson(){
      return {
          "College_Id": collegeId,
          "College_Name":collegeName
      };
    }
}