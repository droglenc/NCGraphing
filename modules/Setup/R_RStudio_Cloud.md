---
layout: page
title: RStudio in the Cloud
css: /css/modules.css
---

Analyses with R and RStudio can be run through a web browser on "the cloud", thus eliminating the need to install these softwares and the associated packages on your computer. Follow the directions below if you would like to try using R/RStudio in the cloud.

You must create a free RStudio Cloud account to use this service. Go to the [RStudio Cloud website](https://rstudio.cloud/){:target="_blank"} and select "Get Started." In the ensuing dialog box enter your e-mail adddress, a password, and your first and last names. Press "Sign up." In a subsequent screen you will be asked to provide a name for the account with prompts to use your first and last name. Just press "Create Account" here.

Once you have created your account, follow [this link to the "MTH250_S20" project](https://rstudio.cloud/project/1161857){:target="_blank"}, which should open a project that looks like that below. Currently this project is in my "workspace." Click on the red "Save a Permanent Copy" item in the top bar to save the project to your workspace.

<img src="../zimgs/RStudioCloud_Project_1.JPG" alt="RStudio Cloud Project" style="display: block; margin-left: auto; margin-right: auto; width: 95%;">

Any changes that you make to the project (uploading files, creating scripts) will be saved in this project in your workspace. *If you do not save a permanent copy then any work that you do in the project will be lost when you come back to it.*

RStudio-in-the-cloud operates the same as RStudio with the exception that RStudio-in-the-Cloud cannot access data from your computer. Rather you must uploaded the data from your computer to the cloud. To upload a file (e.g., a CSV data file) from your computer, select the "Upload" button in the "Files" tab in the lower-right pane of RStudio. Then "Browse ..." to where your file is located on your computer and select OK. The CSV file will then appear in the Files pane (e.g., see "Avocados.csv" below). This file is then read into RStudio-in-the-Cloud by including the filename in `read.csv()` (note that you do not need to worry about setting the working directory with `setwd()`).

<img src="../zimgs/RStudioCloud_Data.JPG" alt="RStudio Cloud Data" style="display: block; margin-left: auto; margin-right: auto; width: 95%;">
