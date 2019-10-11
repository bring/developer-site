---
layout: post
disqus: false
title: Experience with Frontend Error Tracking Using Sentry.io In React Apps
date: 2019-10-06 11:00:00
category: monitoring
author:
    - Rameshkumar

---


It has been more than a year we started using [Sentry.io](https://sentry.io) to idenitfy the user experience and UI failures one year ago. I thought of sharing What have we learnt about it so far and our experience with it.
## 📄 Intro  🏊‍♀️
- Why do you need Sentry?
- Sign In and create a project
- Integrate Sentry in app
- First error tracking
- Use Sentry with API Endpoint
- When and what to log in Sentry

##  Why do you need Sentry?  🏊‍♀️

we are interested in real time error tracking in production which would happen due to security bug, invalid data or etc and understand the end customer experiences

Do you think that’s not enough? 

Okay, let’s look at the details.

The main reasons for developers:

Getting rid of risks to deploy code with bugs
Getting a quick notification about troubles
Allowing a fast turnaround with bug fixes
Receiving a convenient display of errors in admin panel
Sorting the errors by user / browser segments
Understanding what is wrong with your project in real time
Understanding the number of issues people are having with your app


What is Sentry?
Sentry is Open-source error tracking that helps developers to monitor, fix crashes in real time. Don’t forget about boosting the efficiency, improving user experience. Sentry has support for JavaScript, React, Node, Python, PHP, Ruby, Java and other programming languages.

## Sign up and Create a project
You can register for the account here -> [Signup](https://sentry.io/signup/)
In some cases where organization is already have Sentry workspace. You may gain access to it using Github account or Azure DevOps acc from the person who is responsible for it. 
Next step create a project.
Choose your language from the list
(We’re going to pick React. Click “Create Project”)

Configure your application. Sentry has a useful wizard that helps you understand what you should do next. You can follow those steps. 

## Sentry integration
First of all, we should install npm package in your project.

```
  npm i @sentry/browser
```

As a best practice, We created separate Javascript with below code and load only in the environment which we feel required.
Initialize Sentry in the application in the beginning of the flow. 

```
  Raven.config(dsnURL, 
                      { release: VERSION, 
                        environment: 'qa' or 'prod',
                        tags: {commit: COMMIT_HASH, }
                      }).install();
```

You can find the unique DSN URL from the Project -> Settings -> Client Keys from the selected project. Or you can find Client Keys in search input.
Also, define the additional parameters such as release version environment, and other required tags in JSON format to config method. 



## First error tracking

In your react application, We need to create an error. We should create a button that calls console.log with 'user.emailId' variable. 
After this action, we have to get an error message: “Uncaught TypeError (Cannot read property ‘xxx’ of undefined)” due to the lack of user object. You also can use javascript throw exception.

After integrating this button in the application, you should test it in a browser.

We have created issue 😄 but in real time if you click on a button to do something if it doesn't produce anything. user would go mad but developer would look at the dev tools and see a stack trace.

The Messages look bad. Of course, we have seen error messages, not understanding where this code is. It’s about a source map by default in ReactJS because they aren’t configured.


## Use Sentry with API Endpoint

Okay. We covered javascript exception in previous points. However, what are we going to do with XHR errors?
Sentry also has custom error handling. I used it for tracking api errors.

```
  Sentry.captureException(err, {level: 'error',...})
```

You can customize error name, level, add data, unique user data with your app, email, etc.

Like Sentry initialization. We’d like to use a common function for api catch custom exception, messages and breadcrumbs

Let’s check the methods out:

Sentry allows to insert level error in sentry dashboard. It has properties — (‘fatal’, ‘error’, ‘warning’, ‘info, ‘debug’, ‘critical’).

```
  Raven.captureMessage(message, {level: 'warning',...});
```

Raven.setUserContext helps to save unique details about user session (id, customer Id, and etc).

```
  Raven.setUserContext({
      email: 'email@example.com',
      id: '123'
  });
```
setExtraContext allows to set any data that you need, for example, the store.
 
```
  Raven.setExtraContext({extra: 'extra detail'})
```

If you want to get user feedbacks about error, you should use function showReportDialog.

```
  Sentry.showReportDialog();
```

## When and what to log in Sentry

After the usage of Sentry in Tracking applications for quite some time which is highly used applications. We found that thousands's of API failure reported in Sentry which is not actual application errors.

- By including and configuring Sentry, the SDK will automatically attach global handlers to capture uncaught exceptions and unhandled rejections.
- Logging the following HTTP status ```400, 401, 404, 204``` from API errors in Sentry doesn't help much in high usage application. Created more noise in the Slack channel and high usage resulted application consume more memory in Sentry.io which would disturb monthly usage limit 
- Before decide logging custom exception or message consider the frequency of backend errors and based on criticality and nature of the application
- Log Internal Server Error(500) if you feel useful to detect the user experience
- Do not append the key identifiers such as consignment number, customer identifier or any other details in exception message which will prevent the grouping issues done by Sentry internally    
- Instead you can use `Raven.setUserContext` or `setTagContent` methods or add additional info debugging in JSON format in `captureException` & `captureMessage` methods in optional parameter which would help in debug the issue or user info as mentioned in the above section
- You can define log level while logging custom exception which helps to identify the criticality
- Providing Git release details to Sentry gives us advantage to view source map whenever issue start occuring
- React 16 has introduced `Error Boundaries ` which catches JavaScript errors anywhere in component tree, we can capture error details to Sentry, and display a fallback UI instead of the component tree that crashed. 


## Conclusion

Overall I feel Sentry.io is useful to understand the frontend failure but we need to use effectively by considering some of the above points to make best use of it.

URLs:
- [Sentry Documentation](https://docs.sentry.io/error-reporting/quickstart/?platform=javascript)
- [Sentry Integrations](https://sentry.io/integrations/)
 

Hope you find the information useful...🙌

