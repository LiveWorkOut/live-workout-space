# Live Workout Application


Figma Link: https://www.figma.com/file/3QqNP3MJXaWRzLeNhJlFTJ/Original-App-Design-Project?type=design&node-id=0%3A1&mode=design&t=CkHcBp2yqG9Q6qRA-1

Designed to facilitate real-time fitness classes and workouts.
Allowing users to participate in live sessions led by professional trainers and instructors.

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description


Designed to facilitate real-time fitness classes and workouts.
Allowing users to participate in live sessions led by professional trainers and instructors.

### App Evaluation

- **Category:** Health, Video Streaming
- **Mobile:** Yes
- **Story:**  Our app revolutionizes workouts by bringing live workout sessions with professional trainesrs and other people around the worl.d
- **Market:** People who want to live an active and healthy lifestyle
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


- [ ] First Tab: [**Workouts Screen**]
- [ ] Second Tab: [**Instructors Screen**]
- [ ] Third Tab: [**Search Screen**]
- [ ] Fourth Tab: [**Profile Screen**]

**Flow Navigation** (Screen to Screen)

- [ ] [**Workouts Screen**]
  * Leads to [**Workout Modal Screen**]
- [ ] [**Workout Modal Screen**]
  * Leads to [**Stream Screen**]
- [ ] [**Stream Screen**]
  * Leads to [**Schedule Screen**]


## Wireframes

![Capture](https://hackmd.io/_uploads/HJwFMSPxA.png)



## Schema 


### Models

User

| Property | Type   | Description                                 |
| -------- | ------ | ------------------------------------------- |
| email    | string | Email of the user                           |
| username | String | unique id for the user post (default field) |
| password | String | user's password for login authentication    |
| ...      | ...    | ...                                         |


Schedule

| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| Title | String | unique id for the user post (default field)   |
| StartTime | datetime | Start time for the schedule     |
| EndTime | datetime | End time for the schedule|
| Description | String | Description of the scheudle |
| ...      | ...    | ...                          


ActivityRecord

| Property   | Type     | Description                                 |
| ---------- | -------- |:------------------------------------------- |
| id         | String   | unique id for the user post (default field) |
| timestamp  | datetime | Time of the activity                        |
| workout_id | int      | the workout performed                       |
| ...        | ...      | ...                                         |

- Metadata to be defined

Workout

| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| id | Int | unique id for workout   |
|name| Name of the exercise
| sets | String |    Count of sets   |
|repetitions| int | Repetition count
|time| int | expected duration of the workout in seconds
|weight| Weight if applicable
| ...      | ...    | ...                          

