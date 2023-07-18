class GetOfficeModel {
  List<GetOfficeData>? data;
  int? statusCode;
  String? error;

  GetOfficeModel({this.data, this.statusCode, this.error});

  GetOfficeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetOfficeData>[];
      json['data'].forEach((v) {
        data!.add(new GetOfficeData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    data['error'] = this.error;
    return data;
  }
}

class GetOfficeData {
  String? ofisAdi;
  String? id;
  int? status;
  String? createdDate;
  String? updatedDate;

  GetOfficeData(
      {this.ofisAdi, this.id, this.status, this.createdDate, this.updatedDate});

  GetOfficeData.fromJson(Map<String, dynamic> json) {
    ofisAdi = json['ofisAdi'];
    id = json['id'];
    status = json['status'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ofisAdi'] = this.ofisAdi;
    data['id'] = this.id;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}