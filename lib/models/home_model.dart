class HomeModel {
    List<HomeBanner> homeBanner;
    HomeModel(this.homeBanner);
}

class HomeBanner{
   int? pageId;
  int? menuId;
  String? pageHeader;
  String? introContent;
  String? pageLink;
  String? pageGroupName;
  int? linkTypeId;
  String? linkTypeName;
  int? templateId;
  String? templateName;
  int? bannerId;
  String? bannerName;
  String? bannerImageLink;
  int? bannerDisplayOrder;
  int? showPopUp;

  HomeBanner({
        required this.pageId,
        required this.menuId,
        required this.pageHeader,
        required this.introContent,
        required this.pageLink,
        required this.pageGroupName,
        required this.linkTypeId,
        required this.linkTypeName,
        required this.templateId,
        required this.templateName,
        required this.bannerId,
        required this.bannerName,
        required this.bannerImageLink,
        required this.bannerDisplayOrder,
        required this.showPopUp,
    });

    factory HomeBanner.fromJson(Map<String,dynamic> json)=> HomeBanner(
      pageId: json["Page_Id"],
        menuId: json["Menu_Id"],
        pageHeader: json["Page_Header"],
        introContent: json["IntroContent"],
        pageLink: json["Page_Link"],
        pageGroupName: json["Page_GroupName"],
        linkTypeId: json["LinkType_Id"],
        linkTypeName: json["LinkType_Name"],
        templateId: json["Template_Id"],
        templateName: json["Template_Name"],
        bannerId: json["Banner_Id"],
        bannerName: json["Banner_Name"],
        bannerImageLink: json["Banner_Image_link"],
        bannerDisplayOrder: json["Banner_DisplayOrder"],
        showPopUp: json["showPopUp"],
    );

    //  Map<String, dynamic> toJson(){
    //   return{
    //     "Page_Id": pageId,
    //     "Menu_Id": menuId,
    //     "Page_Header": pageHeader,
    //     "IntroContent": introContent,
    //     "Page_Link": pageLink,
    //     "Page_GroupName": pageGroupName,
    //     "LinkType_Id": linkTypeId,
    //     "LinkType_Name": linkTypeName,
    //     "Template_Id": templateId,
    //     "Template_Name": templateName,
    //     "Banner_Id": bannerId,
    //     "Banner_Name": bannerName,
    //     "Banner_Image_link": bannerImageLink,
    //     "Banner_DisplayOrder": bannerDisplayOrder,
    //     "showPopUp": showPopUp,

    //   };
    // }
}