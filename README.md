# Project 5 - *Trivia Unleashed*

Submitted by: **Noah Russell** ZNumber: **Z23667779**

**Trivia Unleashed** is an interactive mobile app that provides a timed quiz experience where users can answer trivia questions in different categories. Players can customize their quiz experience by choosing the number of questions, difficulty level, and question type (multiple choice or true/false). The app presents questions in a fun and engaging way, marking answers as correct or incorrect, and providing a performance rating at the end based on the user's score. Users can also track their performance, view their score, and see detailed statistics such as total time and average time per question. 

Time spent: **6** hours spent in total

## Required Features

The following **required** functionality is completed:

- [✅︎] App launches to an Options screen where user can modify the types of questions presented when the game starts. Users should be able to choose:
  - [✅︎] Number of questions
  - [✅︎] Category of questions
  - [✅︎] Difficulty of questions
  - [✅︎] Type of questions (Multiple Choice or True False)
- [✅︎] User can tap a button to start trivia game, this presents questions and answers in a List or Card view.
  - Hint: For Card view visit your FlashCard app. List view is an equivalent to UITableView in UIKit. Much easier to use!
- [✅︎] Selected choices are marked as user taps their choice (but answered is not presented yet!)
- [✅︎] User can submit choices and is presented with a score on trivia game
 
The following **optional** features are implemented:

- [✅︎] User has answer marked as correct or incorrect after submitting choices (alongside their score).
- [✅︎] Implement a timer that puts pressure on the user! Choose any time that works and auto submit choices after the timer expires. 

The following **additional** features are implemented:

- [✅︎] The results screen has a dynamic design with colorful gradients, large fonts, and shadow effects for visual appeal.
- [✅︎] Smooth transitions between screens, such as opacity fade effects, provide a polished user experience
- [✅︎] A performance rating based on the score is displayed on the results screen, with categories like "Excellent" and "Needs Improvement."
- [✅︎] Visual elements like shadow effects, bold text, and color coding improve the app’s aesthetic and readability.
- [✅︎] The results screen clearly displays the user's score final, showing correct answers out of total questions for easy understanding.
- [✅︎] Users can submit their answer, and the app immediately marks correct or incorrect answers (green or red highlighting) once submitted, along with the updated score.
- [✅︎] The trivia question interface displays the current question number (e.g., "Question 2 of 5") at the top, helping users track progress.
- [✅︎] The results screen shows the total time taken to complete the game and the average time per question for further analysis of performance.



## Video Walkthrough

My video walkthrough:

<img style="max-width:300px;" src="Trivia Game/Project5.gif">

GIF created with VEED.io

## Notes

Challenges encountered while building the app:

- Implementing the timer functionality and ensuring it works smoothly with question submission was challenging but rewarding. Making sure the UI looked visually appealing was one of my top priorities
- Managing the state of the app to track the number of correct answers and average time per question required careful consideration of data flow and logic. Also had several difficulties trying to shuffle the answers due to syntac errors.

## License

    Copyright [2024] [Noah Russell]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
