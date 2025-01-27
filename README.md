# Trivia Unleashed - A Timed Quiz Experience

**Trivia Unleashed** is an interactive mobile app that provides a timed quiz experience, where users can answer trivia questions from different categories. Players can customize their quiz experience by selecting the number of questions, difficulty level, and question type (multiple choice or true/false). The app presents questions in an engaging way, marking answers as correct or incorrect, and provides a performance rating at the end based on the user's score. Users can also track their performance, view detailed statistics such as total time taken, and average time per question.

- Developer: Noah Russell  
- Development Time: 6 hours  
- Technologies Used: Swift, SwiftUI, Xcode

## Features

The following required features have been successfully implemented:

- [✅] **Options Screen**: The app launches to an options screen where users can modify the types of questions presented when the game starts. Users can choose:
  - The number of questions.
  - The category of questions.
  - The difficulty level.
  - The type of questions (Multiple Choice or True/False).
- [✅] **Start Game**: Users can tap a button to start the trivia game, presenting questions and answers in a List or Card view.
- [✅] **Answer Selection**: Selected choices are marked as the user taps their choice (but the correct answer is not displayed yet).
- [✅] **Submit Answers**: After submitting answers, users are presented with a score for the trivia game.

The following optional features have been successfully implemented:

- [✅] **Correct/Incorrect Answer Marking**: Users see answers marked as correct or incorrect (green or red highlighting) after submission.
- [✅] **Timer**: A timer puts pressure on the user, auto-submitting answers after the timer expires.

The following additional features have been implemented:

- [✅] **Dynamic Results Screen**: The results screen features colorful gradients, large fonts, and shadow effects for visual appeal.
- [✅] **Smooth Screen Transitions**: The app includes smooth transitions between screens, such as opacity fade effects, providing a polished user experience.
- [✅] **Performance Rating**: A performance rating based on the score is displayed on the results screen, with categories like "Excellent" or "Needs Improvement."
- [✅] **Score Display**: The results screen clearly displays the user's final score, showing correct answers out of the total number of questions.
- [✅] **Progress Display**: The trivia question interface shows the current question number (e.g., "Question 2 of 5") at the top, helping users track their progress.
- [✅] **Time and Average**: The results screen shows the total time taken to complete the game and the average time per question for further analysis of performance.

## Future Enhancements

Potential future features include:

- [🔲] **Sound Effects**: Implement sound effects for correct and incorrect answers to enhance the user experience.
- [🔲] **Difficulty Scaling**: Implement additional levels of difficulty, such as "Easy," "Medium," and "Hard," for an even more customized quiz experience.

## Setup Instructions

To run the Trivia Unleashed app locally, follow these steps:

1. Clone the Repository:
    - `git clone https://github.com/your-username/Trivia-Unleashed.git`
    - `cd Trivia-Unleashed`
2. Open in Xcode:
    - Open the `.xcodeproj` or `.xcworkspace` file in Xcode.
3. Install Dependencies:
    - If using CocoaPods or Swift Package Manager, install the required libraries (if any):
    - `pod install`
4. Build and Run:
    - Select the desired simulator or physical iOS device.
    - Click the “Run” button to build and launch the app.
5. Test:
    - Start the trivia game by customizing your quiz settings.
    - Answer the questions, submit, and check your score.
    - View your performance analysis after completing the quiz.

## Video Walkthrough

Here’s a quick demonstration of the app’s core features:

<img style="max-width:300px;" src="Trivia Game/Project5.gif">

GIF created with VEED.io

## Development Process

This app was developed using SwiftUI to create an interactive and responsive UI that adapts to different screen sizes and orientations. The trivia questions and answers were fetched dynamically, and I used a combination of `Timer` and `State` to manage the quiz timing and user interactions. Smooth transitions and engaging animations were added to enhance the user experience.

## Challenges Faced

- **Timer Implementation**: Managing the timer functionality and ensuring it worked smoothly with question submission was challenging. I had to ensure the UI remained visually appealing while keeping track of the timer.
- **State Management**: Tracking the number of correct answers, calculating performance metrics like average time, and ensuring the data flowed smoothly between views required careful planning.
- **Answer Shuffling**: I encountered some syntax errors while trying to shuffle the answer choices, which delayed implementation.

## Key Takeaways

- Gained experience with creating dynamic and interactive quiz apps using SwiftUI.
- Learned how to manage state and transitions effectively in a quiz app.
- Enjoyed designing a results screen that’s both informative and visually appealing.

## Technologies Used

- Programming Language: Swift
- Frameworks: SwiftUI, UIKit
- Development Environment: Xcode 14.0+
- Version Control: Git, GitHub

## License

Trivia Unleashed is licensed under the Apache License 2.0.  
You may obtain a copy of the license at:  
http://www.apache.org/licenses/LICENSE-2.0
