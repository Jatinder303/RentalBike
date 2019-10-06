<%@ Page Title="Return Bike Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ReturnBike.aspx.cs" Inherits="RentalBike.ReturnBike" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Return Rental Bike Details</h1>
            </div>
        </div>
        <hr />
        <br />
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <form>
                    <div class="form-group">
                        <asp:DropDownList ID="ddl_RentID" Style="margin-left: auto; margin-right: auto; text-align: center;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Rent_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtCustomerName" Style="float: left; text-align: center;" CssClass="form-control" placeholder="Customer Name" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="reqCustomerName" runat="server" ControlToValidate="txtCustomerName" ErrorMessage="Enter Name Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtBikeModel" Style="float: right; text-align: center;" CssClass="form-control" placeholder="Bike Model" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regBikeModel" runat="server" ControlToValidate="txtBikeModel" ErrorMessage="Enter Bike ID" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <br />

                    <div class="form-group">
                        <asp:TextBox ID="txtIssueDate"  Style="float: left; text-align: center;" CssClass="form-control" placeholder="Bike Issue Date" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regIssueDate" runat="server" ControlToValidate="txtIssueDate" ErrorMessage="Enter Bike Issue Date" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtReturnDate" Style="float: right; text-align: center;" CssClass="form-control" placeholder="Bike Return Date" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regReturnDate" runat="server" ControlToValidate="txtReturnDate" ErrorMessage="Enter Bike Return Date" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <br />

                    <div class="form-group">
                        <asp:TextBox ID="txtTotalRent" Style="margin-left: auto; margin-right: auto; text-align: center;" CssClass="form-control" Enabled="false" placeholder="Total Rent" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regTotalRent" runat="server" ControlToValidate="txtTotalRent" ErrorMessage="Enter Total Rent" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <hr />
                    <div class="form-group">
                           <asp:Button ID="btnReturn" Style="margin-left: 45%; margin-right: 45%; text-align: center;" runat="server" class="btn btn-danger" OnClick="Return_btn_Click" ValidationGroup="Update" Text="Return" />
                        <asp:ValidationSummary ID="regReturn" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                    </div>
                </form>
                 <hr />
                <asp:Label ID ="MessageReturn" runat ="server"></asp:Label>
      
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</asp:Content>
