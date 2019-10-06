<%@ Page Title="Update Bike Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BikeUpdate.aspx.cs" Inherits="RentalBike.BikeUpdate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Update or Delete Bike Details</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form>
                    <div class="form-group">
                        <asp:DropDownList ID="ddl_Bike" Style="text-align: center;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Bike_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtBikeModel" Style="text-align: center;" CssClass="form-control" placeholder="Bike Model Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="reqBikeModel" runat="server" ControlToValidate="txtBikeModel" ErrorMessage="Enter Bike Model" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtBikeMaker" Style="text-align: center;" CssClass="form-control" placeholder="Company Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regBikeMaker" runat="server" ControlToValidate="txtBikeMaker" ErrorMessage="Enter Company Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtRegistrationNumber" Style="text-align: center;" CssClass="form-control" placeholder="Bike Registration Number" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regRegistrationNumber" runat="server" ControlToValidate="txtRegistrationNumber" ErrorMessage="Enter Bike Registration Number" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtRentPerDay" Style="text-align: center;" CssClass="form-control" placeholder="Bike Rent Per Day" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regRentPerDay" runat="server" ControlToValidate="txtRentPerDay" ErrorMessage="Enter Bike Rent Per Day" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnBikeUpdate" Style="float: left;" runat="server" class="btn btn-danger" OnClick="UpdateBike_btn_Click" ValidationGroup="Update" Text="Update" />
                        <asp:ValidationSummary ID="regBikeUpdate" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                        <asp:Button ID="btnBikeDelete" Style="float: right;" runat="server" class="btn btn-danger" OnClick="DeleteBike_btn_Click" ValidationGroup="Update" Text="Delete" />
                        <asp:ValidationSummary ID="regBikeDelete" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>
