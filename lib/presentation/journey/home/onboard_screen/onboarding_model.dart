class OnBoardingModel {
  final String image;
  final String? title;
  final String? subTitle;

  OnBoardingModel({required this.image, this.title, this.subTitle});
  static List<OnBoardingModel> imageList = [
    OnBoardingModel(
        title: 'Intelligent AI',
        subTitle: 'Platform users AI to ensure you receive best matches!',
        image:
            'https://media.istockphoto.com/photos/excited-woman-wearing-rainbow-cardigan-picture-id1327495437?b=1&k=20&m=1327495437&s=170667a&w=0&h=Vbl-XLyAnBoTkyGXXi-X1CFzuSHlNcn-dqB-sCosxFo='),
    OnBoardingModel(
        title: 'Matches',
        subTitle:
            'We Match you with the people whom you shared a common interest',
        image:
            'https://media.istockphoto.com/photos/portrait-of-female-architect-picture-id1298074216?b=1&k=20&m=1298074216&s=170667a&w=0&h=YqqoiKMC5zdju1J3PvJninCyF7ts6MlAG-lsw-6AQvs='),
    OnBoardingModel(
        title: 'Premium',
        subTitle: 'Sign up today and enjoy the premium benefits',
        image:
            'https://images.unsplash.com/photo-1524502397800-2eeaad7c3fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80'),
    OnBoardingModel(
        title: 'Intelligent AI',
        subTitle: 'Platform users AI to ensure you receive best matches!',
        image:
            'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80'),
    OnBoardingModel(
        title: 'Intelligent AI',
        subTitle: 'Platform users AI to ensure you receive best matches!',
        image:
            'https://images.unsplash.com/photo-1482361046637-0226fdcfa3b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  ];
}
