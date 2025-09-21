import '/models/quiz_question.dart';

const questions = [
  QuizQuestion( text: 'What are the main building blocks of Flutter UIs?',
   answers: [
   'Widgets',
   'Components',
   'Blocks',
   'Functions',
   ],),

   QuizQuestion( text: 'How are Flutter UIs built ?',
   answers: [
    'By Combining Widgets in code.',
    'By Combining Widgets in a visual editor.',
    'By Defining Widgets in config files.',
    'By using XCode for IOS and Android Stuido For Android.',
   ],),

   QuizQuestion( text: "What's the purpose of a StatefulWidget?",
   answers: [
   'Update UI as data Changes.',
   'Update data as UI  Changes.',
   'Ignore data Changes.',
   'Render UI that does not depend on data.',
   ],),

   QuizQuestion( text: 'Which Widge should try to sue more often: StatelessWidget or StatefulWidget?',
   answers: [
   'StatelessWidget',
   'StatefulWidget',
   'Borth are equallay good',
   'None of the above',
   ],),

   QuizQuestion( text: 'What happend if you change data in a Stateless Widget?',
   answers: [
   'The UI is not updated.',
   'The UI is updated.',
   'The closetst Stateful Widget is updated.',
   'Any nested StatefulWidgets are updated.',
   ],),

   QuizQuestion( text: 'How should you update data inside of Statefulwidget?',
   answers: [
   'By calling setSate()',
   'By calling updateData()',
   'By calling updateUI()',
   'By calling updateState()',
   ],),
];
