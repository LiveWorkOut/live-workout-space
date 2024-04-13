Original App Design Project - README Template
===

## Live Workout Application


Digital Wireframe link: https://www.figma.com/file/3QqNP3MJXaWRzLeNhJlFTJ/Original-App-Design-Project?type=design&node-id=0%3A1&mode=design&t=CkHcBp2yqG9Q6qRA-1

Interactive Prototype Gif Link: https://i.imgur.com/9xAWptz.gif


Designed to facilitate real-time fitness classes and workouts.
Allowing users to participate in live sessions led by professional trainers and instructors.

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
Our app allows peer to peer workout streaming content and scheduling of work out streams. 
### Description


Designed to facilitate real-time fitness classes and workouts.
Allowing users to participate in live sessions led by professional trainers and instructors.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Health, Video Streaming
- **Mobile:** Yes
- **Story:**  [What story does your app tell?]
- **Market:** [Target audience for the app]
- **Habit:** Habit Use
- **Scope:** Narrow Scope fitness streaming community

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can watch Trainning Videos
* Users can track their trainning routine
* Set Stream Schedule time

**Optional Nice-to-have Stories**

* Ability to stream oneself
* Ability to connect with others
* Can design personalized workout routines


### 2. Screen Archetypes

- [ ] [**Screen Name, e.g., Login Screen**]
* [Required User Feature: User can log in]
- [ ] [**Streaming Screen**]
* [Required User Feature: User can stream workout]
- [ ] [**Comment Screen**]
* [Nice-to-have Feature: Users can comment on streams]
- [ ] [**Schedule Screen**]
* [Required User Feature: Users can create a schedule for their workout stream and notify friends ]

### 3. Navigation

**Tab Navigation** (Tab to Screen)


- [ ] [First Tab, e.g., Home Feed
- [ ] [Second Tab, e.g., Profile]
...
...
...

**Flow Navigation** (Screen to Screen)

- [ ] [**Screen Name**]
  * Leads to [**Next Screen**]
- [ ] [**Another Screen Name**]
  * Leads to [**Another Screen**] 


## Wireframes

[Add picture of your hand sketched wireframes in this section]

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 


### Models

User

| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)   |
| password | String | user's password for login authentication      |
| ...      | ...    | ...                          


Schedule

| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| Title | String | unique id for the user post (default field)   |
| StartTime | datetime | user's password for login authentication      |
| EndTime | datetime | user's password for login authentication      |
|Description | String | |
|InstructorName | String | |
| ...      | ...    | ...                          


ActivityRecord

| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)   |
| password | String | user's password for login authentication      |
| ...      | ...    | ...                          



Workout

| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)   |
| password | String | user's password for login authentication      |
| ...      | ...    | ...                          







### Networking

- [List of network requests by screen]
- [Example: `[GET] /users` - to retrieve user data]
- ...
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
