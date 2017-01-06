<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profiles.aspx.cs" Inherits="Nicescrum_homepage.Profiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profiles</title>
        <style type="text/css">
            h1{
            color: antiquewhite;
            text-align: center;
            font-size: x-large;
}
        .auto-style3 {
            font-size: x-large;
            color: antiquewhite;
        }
        .auto-style2 {
            font-size: large;
            color: antiquewhite;
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
    <script type="text/javascript">

        function hidePanel(panID) {
            var panel = document.getElementById(panID);
            panel.style.display = 'none';
        }
        function showPanel(panId) {
            var panel = document.getElementById(panId)
            panel.style.display = "";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
    <h1 class ="h1" ><strong style="font-family: 'OCR A Extended'">Profile</strong> </h1>
        <ul id="menulist1">
            <li><a href="#" onclick="window.location='homepage.aspx'">Home</a> </li>
            <li><a href="#" class="active" onclick="showPanel('Panel1'); hidePanel('Panel2');">Skills</a></li>
             <%  if (Session["accType"].ToString().Equals("admin"))
                {   %>
                 <li><a href="#" onclick="showPanel('Panel2'); hidePanel('Panel1');">Search</a> </li>
            <% } %>
            
            <li><a href="#" onclick="window.location='myWork.aspx'">MyWork</a> </li>
            <li><a href="#" onclick="window.location='message.aspx'">Messages</a></li>
            <li><a href="#" onclick="window.location='Sandbox.aspx'">Sandbox</a> </li>
            <li><a href="#" onclick="window.location='Resources.aspx'">Resources</a> </li>
            <li><a href="#" onclick="window.location='index.aspx'">Logout</a> </li>
            </ul>
       
         <p>
        </p>
        <p>
        </p>
        
            <asp:Panel ID="Panel1" runat="server" Height ="300px">
                <asp:Label ID="Skills" runat="server" Text="Skills" Forecolor ="White"></asp:Label>
                <br />
                <asp:TextBox ID="txtskills" runat="server" Height="150px" Width="435px" TextMode="MultiLine" style="margin-right: 0px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Resume" runat="server" Text="Resume" Forecolor ="White"></asp:Label>               
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                <br />
<asp:Button ID="btnUpload" runat="server" Text="Upload & Save" OnClick="Upload" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="Green" style="text-align: left" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />
<hr />
 
                
                
                
                              
                
            </asp:Panel>
        <br />

         <asp:Panel ID="Panel2" runat="server" Height ="500px" Width = "845px" Style="display: none">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Left" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Skills" HeaderText="Skills" SortExpression="Skills" />
                            <asp:BoundField DataField="Filename" HeaderText="Resume" SortExpression="Filename"/>
                            
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" SelectCommand="SELECT [Name], [Skills], [Filename] FROM [profile]"></asp:SqlDataSource>
                </asp:Panel>
        
&nbsp;&nbsp;
        </form>
</body>
</html>
