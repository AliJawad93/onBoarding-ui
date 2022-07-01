class OnBoardingModel {
  String title;
  String body;
  String image;
  OnBoardingModel(
      {required this.title, required this.body, required this.image});
}

// this must containt all information to build view mean will send from ViewModel to view
// all information needed stream controller for onBoarding View model
class OnBoardingObject {
  OnBoardingModel onBoardingModel;
  int numOfSlid;
  int currentIndex;
  OnBoardingObject({
    required this.onBoardingModel,
    required this.numOfSlid,
    required this.currentIndex,
  });
}
