<%@ Page Language="C#" MasterPageFile="~/main-page.master" AutoEventWireup="true" CodeFile="LOGIN.aspx.cs" Inherits="LOGIN" Title="Trivani Tirth Science School Kalsar " %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div class="container mt-5 w-25 p-3 ">
   
        <div class="border border-primary border-3 rounded-4 p-5">
            <h1>Login Page</h1>
            <asp:TextBox ID="TXT_USERNAME" runat="server" class="form-control mt-4" placeholder="Username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TXT_USERNAME" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TXT_PASSWORD" runat="server" class="form-control " 
                placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TXT_PASSWORD" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="BTN_LOGIN" runat="server" onclick="BTN_LOGIN_Click" class="btn btn-primary" Text="LOGIN" />
            <asp:Button ID="BTN_CANCEL" runat="server" Text="CANCEL" class="btn btn-secondary" />
                                
        </div>
        
    </div>
</center>
</asp:Content>

