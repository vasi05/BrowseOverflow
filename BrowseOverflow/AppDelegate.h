//
//  AppDelegate.h
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

//On launching BrowseOverflow, the user sees a list of topics, shown in Figure 5.1. Each topic represents a tag on Stack Overflow. Questions are tagged to indicate what subjects they address.
//Tapping on a topic in the list loads a list of the 20 most recently asked questions tagged with that topic, presented in chronological order. A sample list is shown in Figure 5.2. In addition to the titles of the questions, users can see who asked each question (including an avatar image) and the question’s score (how many times it has been voted up and down on the website).
//Retrieving the list of questions clearly requires a network connection, and even if the app has a Wi-Fi or 3G data network available, it’s still possible for the connection to stackoverflow.com to fail. If it does, BrowseOverflow should show a message explaining that current questions are not available (demonstrated in Figure 5.3).
//Tapping on a question title in one of the lists of questions presents a view showing more information about this question.The full question text is available, along with each of the answers.The accepted answer (if there is one) is indicated with a tick and appears directly below the question. Following this, the other answers are presented in descend- ing order of score.The name and avatar of the writer of each answer is presented along with that answer, as shown in Figure 5.4. As with the question list, BrowseOverflow should display a message explaining that answers aren’t available if it cannot retrieve the information from the Stack Overflow website.


#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

