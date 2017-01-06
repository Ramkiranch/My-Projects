<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="NiceScrum.Models.Resources" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Help</title>
    <style>
        h1{
            color: antiquewhite;
            text-align: center;
            font-size: x-large;
}

ul {
            list-style-type: none;
            display: table;
            margin: 0 auto;
            padding: 0;
            overflow: hidden;
            background-color: lightblue;
        }

        li {
            float: left;
        }

            li a {
                display: block;
                color: #111;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                li a:hover {
                    background-color: white;
                }
        body{
            
            background-color: #2c3338;
            color: antiquewhite;
        }       
         #Button1 {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.4s;
        } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class ="h1" ><strong style="font-family: 'OCR A Extended'"> Help</strong> </h1>

        <ul id="menulist1">
            <li><a href="#" onclick="window.location='homepage.aspx'">Home</a> </li>
            <li><a href="#" onclick="window.location='myWork.aspx'">MyWork</a> </li>
            <li><a href="#" onclick="window.location='message.aspx'">Messages</a></li>
            <li><a href="#" onclick="window.location='Sandbox.aspx'">Sandbox</a> </li>
            <li><a href="#" onclick="window.location='index.aspx'">Logout</a> </li>
         </ul>

        </br>

   
        </form>

   Main pages of NiceScrum System: </br></br>

<a href="#" onclick="window.location='homepage.aspx'">Home:</a> Home is a NiceScrum homepage. NiceScrum is a computer-aided software engineering (CASE) tool used to aid agile software development by providing a meaningful way to coordinate the project and monitor progress for a group of people. This software is especially useful for teams which utilize agile programming methodologies in which requirements and solutions evolve and adapt, promoting continual and rapid improvement. </br></br>
<a href="#" onclick="window.location='myWork.aspx'">MyWork:</a> MyWork is a user's work environment. There are different features in MyWork depend on the type of the user.More features are available for the project manager users than team member users. My Task option allow the user to  see their task details. Change Task Status option allow the user to choose one of three statues for their tasks. These status are "To Do", "In Progress", and "Completed". Create new project option is a feature where the project manager can create new project. Project option is a feature where the project manager select a project and create tasks for the selected project or update created tasks. </br> </br>
<a href="#" onclick="window.location='message.aspx'">Messages:</a> Messages all users can message members either personally or publicly. Message page allow NiceScrum users to send email to each other and communicate using NiceScrum application itself.The message box is not restricted to just commenting/messaging on ideas, users can also post their queries. Another user can reply/answer to those queries as well.</br> </br>
<a href="#" onclick="window.location='Sandbox.aspx'">Sandbox:</a> SandBox is a container which stores the ideas created by any one authorized to access the application. </br></br>
<a href="#" onclick="window.location='Resources.aspx'">Resources:</a> This page provide links on various technologies to help the team in completing their task successfully.</br></br>
<a href="#" onclick="window.location='index.aspx'">Logout:</a> Logout is where user exit the application and they have to re-login to reuse the application.</br></br>
     </br>
    

</body>
</html>
