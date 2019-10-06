<%@ Page Title="Add Bike Page"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BikeAdd.aspx.cs" Inherits="RentalBike.BikeAdd" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Add Bike Details</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form>
                    <div class="form-group">
                        <asp:TextBox ID="txtBikeModel" Style="text-align: center;" Cssclass="form-control" placeholder="Bike Model Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="reqBikeModel" runat="server" ControlToValidate="txtBikeModel" ErrorMessage="Enter Bike Model" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtBikeMaker" Style="text-align: center;" Cssclass="form-control" placeholder="Company Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regBikeMaker" runat="server" ControlToValidate="txtBikeMaker" ErrorMessage="Enter Company Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtRegistrationNumber" Style="text-align: center;" Cssclass="form-control" placeholder="Bike Registration Number" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regRegistrationNumber" runat="server" ControlToValidate="txtRegistrationNumber" ErrorMessage="Enter Bike Registration Number" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtRentPerDay" Style="text-align: center;" Cssclass="form-control" placeholder="Bike Rent Per Day" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regRentPerDay" runat="server" ControlToValidate="txtRentPerDay" ErrorMessage="Enter Bike Rent Per Day" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group"  style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-danger" OnClick="InsertBike_btn_Click" ValidationGroup="insert" Text="Submit" />
                        <asp:ValidationSummary ID="valsum" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="insert"/>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>

