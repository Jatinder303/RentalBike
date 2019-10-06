<%@ Page Title="Add Customer Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerAdd.aspx.cs" Inherits="RentalBike.CustomerAdd" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Add Customer Details</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form>
                    <div class="form-group">
                        <asp:TextBox ID="txtFirstName" Style="text-align: center;" Cssclass="form-control" placeholder="First Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="reqFirstName" runat="server" ControlToValidate="txtFirstname" ErrorMessage="Enter First Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtLastName" Style="text-align: center;" Cssclass="form-control" placeholder="Last Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtAddress" Style="text-align: center;" Cssclass="form-control" placeholder="Address" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Enter Address" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPhone" Style="text-align: center;" Cssclass="form-control" placeholder="Phone" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Phone" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtLicenseNo" Style="text-align: center;" Cssclass="form-control" placeholder="LicenseNo" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regLicenseNo" runat="server" ControlToValidate="txtLicenseNo" ErrorMessage="Enter License Number" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group"  style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-danger" OnClick="Insert_btn_Click" ValidationGroup="insert" Text="Submit" />
                        <asp:ValidationSummary ID="valsum" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="insert"/>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>
