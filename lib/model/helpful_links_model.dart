class HelpfulLinksModel {
  String? message;
  List<Data>? data;

  HelpfulLinksModel({this.message, this.data});

  HelpfulLinksModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? fid;
  String? title;
  String? link;
  String? isactive;
  String? createdAt;

  Data({this.fid, this.title, this.link, this.isactive, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    fid = json['fid'];
    title = json['title'];
    link = json['link'];
    isactive = json['isactive'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fid'] = this.fid;
    data['title'] = this.title;
    data['link'] = this.link;
    data['isactive'] = this.isactive;
    data['created_at'] = this.createdAt;
    return data;
  }
}
