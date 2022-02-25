import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating_app/presentation/Forms/login.dart';
import 'package:dating_app/presentation/Forms/sign_up.dart';
import 'package:dating_app/presentation/journey/home/onboard_screen/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final IndexProvider = StateProvider<int>((ref) {
  return 1 - 2;
});

class OnBoardScreen extends ConsumerWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    int currentindex = ref.watch(IndexProvider);
    final List<OnBoardingModel> imgList = OnBoardingModel.imageList;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Stack(
              children: [
                CarouselSlider(
                  items: [
                    ...imgList.map(
                      (e) => Column(
                        children: [
                          Container(
                            height: 400,
                            margin: const EdgeInsets.only(
                              top: 20,
                              bottom: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(e.image),
                              ),
                            ),
                          ),
                          Text(
                            e.title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            e.subTitle!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    autoPlay: false,
                    autoPlayInterval: const Duration(milliseconds: 3000),
                    height: 560,
                    onPageChanged: (index, reason) {
                      ref.read(IndexProvider.notifier).state = index + 1;
                    },
                  ),
                ),
                Positioned(
                  top: 530,
                  left: 100,
                  child: AnimatedSmoothIndicator(
                    effect: SlideEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey[400]!,
                      activeDotColor: const Color(0xFF00A651),
                    ),
                    activeIndex: currentindex,
                    count: imgList.length,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUp(),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.green],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account? '),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
