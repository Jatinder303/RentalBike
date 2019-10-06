<%@ Page Title="Login Page"  Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RentalBike.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bike Rental System</title>
    <link href="Content/Main.css" rel="stylesheet" />
</head>
<body id="LoginForm">
    <div class="container">
        <div class="login-form">
            <div class="main-div">
                <h1>Bike Rental System</h1>
                <div class="panel">
                    <h1>Admin Login</h1>
                    <h2>Please enter your username and password</h2>
                </div>
                <form id="Login" runat="server">
                    <div class="form-group">
                        <asp:TextBox ID="tbxUsername" class="form-control" placeholder="User Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="tbxUsername" ErrorMessage="Enter Username" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="tbxPassword" class="form-control" placeholder="Password" TextMode="Password" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ControlToValidate="tbxPassword" ErrorMessage="Enter Password" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btn" runat="server" class="btn btn-primary" OnClick="btn_Click" Text="Login" />
                    <asp:ValidationSummary ID="valsum" runat="server" ShowSummary="false" ShowMessageBox="true" />
                </form>
            </div>
        </div>
         <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp</h1>
        <h1 class="form-heading">&nbsp;</h1>
        <h1 class="form-heading">&nbsp</h1>
    </div>
    <br />
    <asp:Literal ID="ltrmessage" runat="server"></asp:Literal>
</body>
</html>
