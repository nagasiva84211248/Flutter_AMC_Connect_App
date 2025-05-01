class LoginModel {
  StudentProfile studentProfile;
  List<BottomMenu> bottomMenu;
  List<RightMenu> rightMenu;
  LoginModel(this.bottomMenu, this.rightMenu, this.studentProfile);

}

class StudentProfile {
   int? Student_Id;
   String? Student_Name;
   String? Student_MobileNo;
   String? Student_Email;
   int? College_Id;
   String? College_Name;
   int? StudentCategory_Id;
   String? StudentCategory_Name;
   String? Student_ProfileImage;
   bool? AlumniStudent;
   int? AlumniStudent_Id;
   String? DOB;

  StudentProfile(
     { required this.Student_Id,
      required this.Student_Name,
      required this.Student_MobileNo,
      required this.Student_Email,
      required this.College_Id,
      required this.College_Name,
      required this.StudentCategory_Id,
      required this.StudentCategory_Name,
      required this.Student_ProfileImage,
      required this.AlumniStudent,
      required this.AlumniStudent_Id,
      required this.DOB});
 factory StudentProfile.fromJson(Map<String, dynamic> json) => StudentProfile (
    Student_Id : json["Student_Id"],
    Student_Name : json["Student_Name"],
    Student_MobileNo : json["Student_MobileNo"],
    Student_Email : json["Student_Email"],
    College_Id : json["College_Id"],
    College_Name : json["College_Name"],
    StudentCategory_Id : json["StudentCategory_Id"],
    StudentCategory_Name : json["StudentCategory_Name"],
    Student_ProfileImage : json["Student_ProfileImage"],
    AlumniStudent : json["AlumniStudent"],
    AlumniStudent_Id : json["AlumniStudent_Id"],
    DOB : json["DOB"]
 );

 Map<String, dynamic> toJson() {
    return {
      "Student_Id": Student_Id,
      "Student_Name": Student_Name,
      "Student_MobileNo": Student_MobileNo,
      "Student_Email": Student_Email,
      "College_Id": College_Id,
      "College_Name": College_Name,
      "StudentCategory_Id": StudentCategory_Id,
      "StudentCategory_Name": StudentCategory_Name,
      "Student_ProfileImage": Student_ProfileImage,
      "AlumniStudent": AlumniStudent,
      "AlumniStudent_Id": AlumniStudent_Id,
      "DOB": DOB,
    };
  }
}
 
class BottomMenu {
   int? Menu_ParentMenu_Id;
   String? Parent;
   int? Menu_Id;
   String? Menu_Name;
   String? Menu_Icon;
   int? Menu_DisplayOrder;
   int? Page_Id;
   String? Page_Header;
   String? IntroContent;
   String? Page_Link;
   String? Page_GroupName;
   int? LinkType_Id;
   String? LinkType_Name;

  BottomMenu(
      {required this.Menu_ParentMenu_Id,
      required this.Parent,
      required this.Menu_Id,
      required this.Menu_Name,
      required this.Menu_Icon,
      required this.Menu_DisplayOrder,
      required this.Page_Id,
      required this.Page_Header,
      required this.IntroContent,
      required this.Page_Link,
      required this.Page_GroupName,
      required this.LinkType_Id,
      required this.LinkType_Name}
      );

 factory BottomMenu.fromJson(Map<String, dynamic> json) => BottomMenu(
    Menu_ParentMenu_Id :json["Menu_ParentMenu_Id"],
    Parent : json["Parent"],
    Menu_Id : json["Menu_Id"],
    Menu_Name : json["Menu_Name"],
    Menu_Icon : json["Menu_Icon"],
    Menu_DisplayOrder : json["Menu_DisplayOrder"],
    Page_Id : json["Page_Id"],
    Page_Header : json["Page_Header"],
    IntroContent : json["IntroContent"],
    Page_Link : json["Page_Link"],
    Page_GroupName : json["Page_GroupName"],
    LinkType_Id : json["LinkType_Id"],
    LinkType_Name : json["LinkType_Name"]
 );

 Map<String,dynamic> toJson(){
  return {
    "Menu_ParentMenu_Id ":Menu_ParentMenu_Id,
    "Parent ": Parent,
    "Menu_Id ": Menu_Id,
    "Menu_Name ": Menu_Name,
    "Menu_Icon ": Menu_Icon,
    "Menu_DisplayOrder ": Menu_DisplayOrder,
    "Page_Id ": Page_Id,
    "Page_Header ": Page_Header,
    "IntroContent ": IntroContent,
    "Page_Link ": Page_Link,
    "Page_GroupName ": Page_GroupName,
    "LinkType_Id ": LinkType_Id,
    "LinkType_Name ": LinkType_Name
  };
 }
}

class RightMenu {
   int? Menu_ParentMenu_Id;
   String? Parent;
   int? Menu_Id;
   String? Menu_Name;
   String? Menu_Icon;
   int? Menu_DisplayOrder;
   int? Page_Id;
   String? Page_Header;
   String? IntroContent;
   String? Page_Link;
   String? Page_GroupName;
   int? LinkType_Id;
   String? LinkType_Name;

  RightMenu(
      {required this.Menu_ParentMenu_Id,
      required this.Parent,
      required this.Menu_Id,
      required this.Menu_Name,
      required this.Menu_Icon,
      required this.Menu_DisplayOrder,
      required this.Page_Id,
      required this.Page_Header,
      required this.IntroContent,
      required this.Page_Link,
      required this.Page_GroupName,
      required this.LinkType_Id,
      required this.LinkType_Name});

 factory RightMenu.fromJson(Map<String, dynamic> json) => RightMenu(
    Menu_ParentMenu_Id :json["Menu_ParentMenu_Id"],
    Parent :json["Parent"],
    Menu_Id :json["Menu_Id"],
    Menu_Name :json["Menu_Name"],
    Menu_Icon :json["Menu_Icon"],
    Menu_DisplayOrder :json["Menu_DisplayOrder"],
    Page_Id :json["Page_Id"],
    Page_Header :json["Page_Header"],
    IntroContent :json["IntroContent"],
    Page_Link :json["Page_Link"],
    Page_GroupName :json["Page_GroupName"],
    LinkType_Id :json["LinkType_Id"],
    LinkType_Name :json["LinkType_Name"]
 );

  Map<String,dynamic> toJson(){
  return {
    "Menu_ParentMenu_Id ":Menu_ParentMenu_Id,
    "Parent ": Parent,
    "Menu_Id ": Menu_Id,
    "Menu_Name ": Menu_Name,
    "Menu_Icon ": Menu_Icon,
    "Menu_DisplayOrder ": Menu_DisplayOrder,
    "Page_Id ": Page_Id,
    "Page_Header ": Page_Header,
    "IntroContent ": IntroContent,
    "Page_Link ": Page_Link,
    "Page_GroupName ": Page_GroupName,
    "LinkType_Id ": LinkType_Id,
    "LinkType_Name ": LinkType_Name
  };
 }
}
