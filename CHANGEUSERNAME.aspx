<%@ Page Language="C#" MasterPageFile="~/main-page.master" AutoEventWireup="true" CodeFile="CHANGEUSERNAME.aspx.cs" Inherits="CHANGEUSERNAME" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
   
    <div class="container border border-primary border-3 rounded-3 w-50 p-4 mt-5">
        <h1>Change Username</h1>
        <br />
        <asp:TextBox ID="TXT_NEW_USER"  class="form-control w-50" runat="server" placeholder="New Username"></asp:TextBox>
        <asp:RequiredFieldValidator ID="REQUIRED_NEW_USER" runat="server" 
            Display="Dynamic" ErrorMessage="*" ControlToValidate="TXT_NEW_USER" 
            SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="TXT_CONFIRM_USERNAME" class="form-control w-50" runat="server" placeholder="Confirm Username"></asp:TextBox>
        <asp:RequiredFieldValidator ID="REQUIRED_CONFIRM_USER" runat="server" 
            ErrorMessage="*" ControlToValidate="TXT_CONFIRM_USERNAME" Display="Dynamic" 
            SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="COMPARE_USERNAME" runat="server" 
                    ErrorMessage="BOTH USERNAME MUST BE SAME" ControlToCompare="TXT_NEW_USER" 
                    ControlToValidate="TXT_CONFIRM_USERNAME" Display="Dynamic" 
                    SetFocusOnError="True"></asp:CompareValidator>
                    <br />
        <asp:Button ID="BTN_UPDATE" runat="server" Text="UPDATE" CssClass="btn btn-primary" onclick="BTN_UPDATE_Click" />
        <asp:Button ID="BTN_CANCEL" runat="server" Text="CANCEL" CssClass="btn btn-dark" />
           
        
    </div>
    </center>
</asp:Content>

