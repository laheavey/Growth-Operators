# Growth Operators
*Duration: Five Weeks*

[See Live Demo Here!](https://next-level.fly.dev/)

This app is a prototype customer data platform designed & built to assist local consultancy Growth Operators. The team at Growth Operators asked us to build a tool for them that would make their consultant's assessment & presentation process (known as nextLevel) both lighter and leaner. The resulting product centralizes their workflow, streamlines documentation, and improves user experience.

## Table of Contents

- [Growth Operators](#growth-operators)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Built With](#built-with)
- [Get Started](#get-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Deployment](#deployment)
- [Known Issues](#known-issues)
    

# Approach

### Built With
- CSS3 / HTML5 / Javascript
- [Node.js](https://nodejs.org/en/): Building the back-end
- [Express](https://expressjs.com/en/4x/api.html) / [Axios](https://axios-http.com/docs/intro): Handling requests/responses to APIs and database
- [React.js](https://reactjs.org/) / [Redux](https://redux.js.org/) / [Redux-Saga](https://redux-saga.js.org/): State management
- [PostgreSQL](https://www.postgresql.org/) / [Postico 2](https://eggerapps.at/postico2/): Database  and db management
- [Passport](https://www.passportjs.org/): User authentication, secure login & account management
- [React](https://reactjs.org/) / [Bootstrap](https://getbootstrap.com/): Front-end styling
- [Reveal.js](https://revealjs.com/) / [Chart.js](https://www.chartjs.org/): Chart, report, & presentation creation
  
# Get Started

## Prerequisites
Before you get started, make sure you have the following software installed on your computer:

- [Node.js](https://nodejs.org/en/)
- [PostgresQL](https://www.postgresql.org/)
- [Nodemon](https://nodemon.io/)

## Installation

1. Fork the repository
2. Copy the SSH key in your new repository
3. In your terminal type...  `git clone {paste SSH link}`
4. Navigate into the repository's folder in your terminal
5. Open VS Code (or editor of your choice) and open the folder
6. In the terminal of VS Code run `npm install` to install all dependencies
7.  Create a `.env` file at the root of the project and paste this line into the file:
8. Create a database named `next_level` in PostgresSQL
If you would like to name your database something else, you will need to change `next_level` to the name of your new database name in `server/modules/pool.js`
9. The queries in the database.sql file are set up to create all the necessary tables that you need, as well as a dummy data table to test the app. Copy and paste those queries in the SQL query of the database. If this is going to production, leave out the dummy data.
10. Run `npm run server` in your VS Code terminal
11. Open a second terminal and run `npm run client`

## Usage

Once everything is installed and running it should open in your default browser - if not, navigate to http://localhost:3000/#/.

<!-- Video walkthrough of application usage: https://www.youtube.com/watch?v=HRonNTkScl0 -->

## Deployment
Login Credentials for Heroku have been provided in the hand off document.

If you need make changes you wish to push to the deployed app, you must login, go into the next-level section, go to the deploy tab, and then manually deploy. You can reconfigure this to redeploy automatically if you wish, which is on the same page.

Environment variables are kept on Heroku in the Settings tab, just click the Reveal Config Vars button

To set up the DB, we used Postico, just plug the information from Heroku into a new favorite. The Information for this can be found in the Resources tab, by clicking the Postgres add on. From there it will bring you to a new page where you will go into the settings tab and click view credentials. 

If you'd like to create new users (also a hacky way to change password) you must:
1. Go into the user router
2. Uncomment the route
3. Push changes and redeploy app
4. Register User
5. Comment out the route back in VSCode
6. Push changes
7. Redeploy

# Known Issues

**Assessment Form:**
- Number labels on progress bar, ratings scale do not line up exactly
- Need some conditional functionality for un-selecting radio button tags
- Inputs no longer allow for typing
- Header not showing company name properly

**Assessment Review:**
-Showing all buckets, even when input is empty/out of scope

**See Report:**
-Some styling/layout issues
-Showing all buckets, even when input is empty/out of scope

**See Overview:**
- Bucket tabs lack icons, additional styling needed.
- No 'bucket' graphs on each tab; only showing Overview graph, which takes in ratings from all buckets.
- The Strength/Opportunity and Quick Fix/Fire Drill tags are swapped/incorrectly placed, compared to the assessment and presentation

**See Presentation:**
- Additional styling needed.
- Several slide components commented out due to semi-functionality and lack of styling.
- Agenda items 1 & 2 are swapped.
- The data for the charts on the 6 bucket slides are not getting the data properly.
