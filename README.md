# Setup

1. Clone this repository

2. Create a branch to work in

3. Setup the application using the instructions below:

## Local Setup

Requires:

- Ruby 3.4.2

```
bundle install
```

4. When you have completed your assessment, please submit a pull request with your changes. We at Fleetio use AI tools as part of our work. If you use AI to assist you in completing this assessment please explain your choice of model and your prompts inside of your pull request.

## Application Overview

This project contains a simplified version of the Fleetio mobile app. Inside you will find a login page which requires an account ID and and API key. These are provided prior to the assessment. After login there is a simple list view of vehicles using preset sample data.

## Objectives

We need you to make some improvements to this sample application. This will require a mixture of traditional Swift iOS development and scripting. This will also provide the opportunity for you to suggest or implement architectural improvements. Please annotate your changes with comments explaining the rationale behind your changes and how they will aid application performance and maintainability. Ensure the included tests are passing. Bonus points will be awarded for adding your own meaningful tests.

1. Using the [Fleetio API](https://developer.fleetio.com/docs/overview/quick-start), update the Vehicle list view to use the asynchronous [List Vehicles api endpoint](https://developer.fleetio.com/docs/api/v-1-vehicles-index).

2. Inside the given Fastfile are two lane stubs for unit & UI tests respectively. Implement these lanes such that the followings commands run corresponding tests. Use "iPhone 16 Pro for the test device field. Approach this objective like you are creating lanes for use in a CI/CD pipeline. Additional support lanes are allowed.

Commands:

```
bundle exec fastlane unit_test
bundle exec fastlane ui_test
```

3. Implement paging for the vehicle list.

4. Implement a custom lane which would create a signed .ipa file and submit it to the app store connect. Use a dummy api key, the lane does not need to function, only demonstrate understanding of the iOS certificate system and app store submission procedure.

5. Implement a custom analytics collection system which will measure the following:

- App Start Time
- Page Load Time
- API Call duration

and generate a report on the average of these metrics over 10 executions of the UI Tests. Include this baseline report in your submission.

6. Optimize the application to bring down the metrics and generate a new report. Include the report on the optimization in your submission. The tests should pass with a TimeInterval.standardTimeout = 2 or lower. (Double+Extension.Swift)
