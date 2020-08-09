# Problem statement
   To develop a E-Mart into Grocery business for managing the inventory its gets on the daily or regular basis. [For more details](https://github.com/Mathan7767/Inventory_Management_System/blob/master/Documents/Objective.pdf)
   
# Inventory Management System for Emart Grocery System
  - An attempt to build an Web Application for Inventory Management. This application, E-Mart manages the inventory,customers,supplier also to add products.
  - Design written in Java,MVC pattern and MySQL database.
  - Follows Singleton pattern for the database interface.
  - Authorization and Authentication using sessions in controllers.
  - JSP CSS Bootstrap and javascript for Client-side validation.
  - **Model** folder contains all the application's data objects and entities that are embodied in the data base.
  - **Controller** folder contains application's logic. Manipulating Models, Views and grabbing GET, POST HTTP requests.
  - **View** folder contains .jsp files than render the corresponding HTML.
  - index.html acts as homepage of the website.
 
# Built With
  - To build it, you will need to [download](https://maven.apache.org/download.cgi) and unpack the latest (or recent) version of Maven.
  - Now put the ***mvn*** command on your path.
  - Install the Core Platform, Java 1.8(or higher) JDK and make sure your run ``` Java ``` from command line.
  - Now you can run ```mvn lean install``` and Maven will complie your project  
  - For More details in [Configuring Apache Maven](https://docs.github.com/en/packages/using-github-packages-with-your-projects-ecosystem/configuring-apache-maven-for-use-with-github-packages)
  
# Development Tools & Technologies
  1. Front-End Development
     * HTML
     * JSP
     * CSS
     * Javascript
  2. Back-End Development
     * Java
     * Servlet
     * JDBC
  3. Database
     * MySQL
  
# IDE for the Development
  - Eclipse IDE 4.15.
# Prerequisites
   There are a few important prerequisites which should be prepared or answered before deployment of this project.Here's the software you'll need before you start. [Click Here](https://github.com/Mathan7767/Inventory_Management_System/blob/master/requriments.txt) 
   - **Web server + servlet container**
      * Additional information: [Web Server](https://github.com/OneBusAway/onebusaway/wiki/Setting-Up-a-Tomcat-Server-in-Eclipse)
      * Required: Enabled https, ability to deploy java webapps
   - **MySQl**
      * Additional information: [MySQL](https://gist.github.com/learncfinaweek/4120988#:~:text=When%20presented%20with%20a%20list,'Next'%20until%20it%20disappears.)
      * Required: postgreSQL database cluster up and running, user with permissions to create/access databases
# Working with Eclipse IDE
  Maven Eclipse plugin installation:
  1. Download the maven and unzip into directory
 ```  EX: C:\Users\intel\apache-maven-3.6.3  ```
  2. Set the Enviroment for Maven.
  3. Type M2E plugin install and restart the Eclipse
  4. Maven is used .m2 folder to download all the jars.
  5. Now in window->preferences of Eclipse, type Maven then select User Setting fromt the menu and then give path of the setting .xml here.
  
# Task
  1. Model Building
  2. UI Development
  3. Deployment
 
# How to run the application
- Clone/Download the project and import into your IDE.
- ``` git clone https://github.com/Mathan7767/Inventory_Management_System```
- Run [index.html](https://github.com/Mathan7767/Inventory_Management_System/blob/master/WebContent/index.html) as Main File
