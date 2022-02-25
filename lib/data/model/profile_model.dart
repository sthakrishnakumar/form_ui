class ProfileModel {
  final String profleimage;
  ProfileModel({required this.profleimage});

  ProfileModel.fromJson(Map<String, dynamic> json)
      : profleimage = json['profileimage'];
}
