
class EventsModel {
  String? message;
  List<Data>? data;

  EventsModel({this.message, this.data});

  EventsModel.fromJson(Map<String, dynamic> json) {
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
  String? festiName;
  String? festDate;
  String? isactive;

  Data({this.fid, this.festiName, this.festDate, this.isactive});

  Data.fromJson(Map<String, dynamic> json) {
    fid = json['fid'];
    festiName = json['festi_name'];
    festDate = json['fest_date'];
    isactive = json['isactive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fid'] = this.fid;
    data['festi_name'] = this.festiName;
    data['fest_date'] = this.festDate;
    data['isactive'] = this.isactive;
    return data;
  }
}
