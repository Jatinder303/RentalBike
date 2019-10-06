<%@ Page Title="Update Customer Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerUpdate.aspx.cs" Inherits="RentalBike.CustomerUpdate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Update or Delete Customer Details</h1>
            </div>
        </div>


        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form>
                    <div class="form-group">
                        <asp:DropDownList ID="ddl_Customer" Style="text-align: center;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Customer_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                          
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtFirstName" Style="text-align: center;" CssClass="form-control" placeholder="First Name" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="reqFirstName" runat="server" ControlToValidate="txtFirstname" ErrorMessage="Enter First Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtLastName" Style="text-align: center;" CssClass="form-control" placeholder="Last Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtAddress" Style="text-align: center;" CssClass="form-control" placeholder="Address" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Enter Address" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPhone" Style="text-align: center;" CssClass="form-control" placeholder="Phone" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Phone" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtLicenseNo" Style="text-align: center;" CssClass="form-control" placeholder="LicenseNo" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regLicenseNo" runat="server" ControlToValidate="txtLicenseNo" ErrorMessage="Enter License Number" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnUpdate" Style="float: left;" runat="server" class="btn btn-danger" OnClick="Update_btn_Click" ValidationGroup="Update" Text="Update" />
                        <asp:ValidationSummary ID="regUpdate" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                        <asp:Button ID="btnDelete" Style="float: right;" runat="server" class="btn btn-danger" OnClick="Delete_btn_Click" ValidationGroup="Update" Text="Delete" />
                        <asp:ValidationSummary ID="regDelete" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>
