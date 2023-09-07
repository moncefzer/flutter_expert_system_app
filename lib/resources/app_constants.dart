import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/question_model.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

const String showResultText =
    'From The info you have provided about your self ,we see the best specialties for you are :';

const List<Question> kQuestions = [
  Question(
    id: 0,
    text: "What are the subjects or fields that you feel confident in ?",
    value: 'subjects',
    answers: [
      "Mathematics",
      "Physics",
      "Science",
      "Biology",
      "Chemistry",
      "Law"
    ],
  ),
  Question(
    id: 1,
    text: "What are your soft skills or topics you feel attracted to?",
    value: 'skills',
    answers: [
      "CriticalThinking",
      "ProblemSolving",
      "Literature",
      "Writing",
      "Language",
      "Programing",
    ],
  ),
  Question(
    id: 2,
    text:
        "What are the topics or fields that you find particularly interesting or would like to learn more about ?",
    value: 'interests',
    answers: [
      "InterestInSports",
      "Fitness",
      "Business",
      "Finance",
      "Law",
      "Justice",
      "Technology",
      "Engineering",
      "History",
      "PoliticalScience",
      "Literature",
      "Writing",
      "ComputerScience",
      "InterestInBuilding",
      "InterestInEnvironment",
      "Sustainability",
      "EntertainmentIndustry",
      "InterestInFilm",
      "InterestInActing",
      "InterestInMusic",
      "InterestInDesign"
    ],
  ),
  Question(
    id: 3,
    text:
        "What are the Social and Behavioral Sciences do you master or enjoy practicing?",
    value: 'social',
    answers: [
      "WorkingWithHands",
      "WorkingWithPeople",
      "CommunicationSkills",
      "Education",
      "WorkingWithChildren",
      "InterestInPsychology",
      "HelpingOthers",
      "InterestInCommunity",
      "CulturalUnderstanding"
    ],
  ),
];
