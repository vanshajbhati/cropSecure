class ResponseFarmer {
  int errorCode;
  String responseString;
  List<Data> data;
  String data1;
  String data2;
  String data3;

  ResponseFarmer(
      {this.errorCode,
        this.responseString,
        this.data,
        this.data1,
        this.data2,
        this.data3});

  ResponseFarmer.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    responseString = json['response_string'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    data1 = json['data1'];
    data2 = json['data2'];
    data3 = json['data3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['response_string'] = this.responseString;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data3'] = this.data3;
    return data;
  }
}

class Data {
  String id;
  String userId;
  String name;
  String fathernameHusbandname;
  String gender;
  String dob;
  String age;
  String handicapped;
  String minority;
  String caste;
  String mobileNumber;
  String pincode;
  String state;
  String districtName;
  String taluka;
  String hobble;
  String gramaPanchayath;
  String villageName;
  String aadhaar;
  String aadhaarNumber;
  String pan;
  String rashan;
  String image;
  String createdAt;
  String deletedAt;



  Data(
      {this.id,
        this.userId,
        this.name,
        this.fathernameHusbandname,
        this.gender,
        this.dob,
        this.age,
        this.handicapped,
        this.minority,
        this.caste,
        this.mobileNumber,
        this.pincode,
        this.state,
        this.districtName,
        this.taluka,
        this.hobble,
        this.gramaPanchayath,
        this.villageName,
        this.aadhaar,
        this.aadhaarNumber,
        this.pan,
        this.rashan,
        this.image,
        this.createdAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    fathernameHusbandname = json['fathername_husbandname'];
    gender = json['gender'];
    dob = json['dob'];
    age = json['age'];
    handicapped = json['handicapped'];
    minority = json['minority'];
    caste = json['caste'];
    mobileNumber = json['mobile_number'];
    pincode = json['pincode'];
    state = json['state'];
    districtName = json['district_name'];
    taluka = json['taluka'];
    hobble = json['hobble'];
    gramaPanchayath = json['grama_panchayath'];
    villageName = json['village_name'];
    aadhaar = json['Aadhaar'];
    aadhaarNumber = json['aadhaar_no'];
    pan = json['pan'];
    rashan = json['rashan'];
    image = json['image'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['fathername_husbandname'] = this.fathernameHusbandname;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['handicapped'] = this.handicapped;
    data['minority'] = this.minority;
    data['caste'] = this.caste;
    data['mobile_number'] = this.mobileNumber;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['district_name'] = this.districtName;
    data['taluka'] = this.taluka;
    data['hobble'] = this.hobble;
    data['grama_panchayath'] = this.gramaPanchayath;
    data['village_name'] = this.villageName;
    data['Aadhaar'] = this.aadhaar;
    data['aadhaar_no'] = this.aadhaarNumber;
    data['pan'] = this.pan;
    data['rashan'] = this.rashan;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
