import 'package:assistant/constants/color.dart';
import 'package:assistant/widgets/feature_box.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Assistant'),
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        children: [
          //Assistant picture
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: const BoxDecoration(
                    color: ColorsTheme.assistantCircleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: 123,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/virtualAssistant.png',
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Chat bubble
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsTheme.borderColor),
              borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                '${getGreeting()}, what can I do for you?',
                style: const TextStyle(
                  color: ColorsTheme.mainFontColor,
                  fontSize: 25,
                  fontFamily: 'Cera Pro',
                ),
              ),
            ),
          ),

          //Suggestions Text
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10, left: 22),
            child: const Text(
              'Here are a few suggestions',
              style: TextStyle(
                fontFamily: 'Cera Pro',
                fontSize: 20,
                color: ColorsTheme.mainFontColor,
              ),
            ),
          ),
          Column(
            children: const [
              FeatureBox(
                  color: ColorsTheme.firstSuggestionBoxColor,
                  headerText: 'ChatGPT',
                  descriptionText: 'Get Information from ChatGPT'),
              FeatureBox(
                  color: ColorsTheme.secondSuggestionBoxColor,
                  headerText: 'Dall-E',
                  descriptionText: 'Get Images from Dall-E'),
              FeatureBox(
                  color: ColorsTheme.thirdSuggestionBoxColor,
                  headerText: 'TTS',
                  descriptionText: 'Text2Speech and Speech2Text'),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.mic),
      ),
    );
  }
}

String getGreeting() {
  DateTime time = DateTime.now();
  int hour = time.hour;
  if (hour > 0 && hour < 12) {
    return 'Good Morning';
  } else if (hour > 12 && hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
