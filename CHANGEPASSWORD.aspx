<%@ Page Language="C#" MasterPageFile="~/main-page.master" AutoEventWireup="true"  CodeFile="CHANGEPASSWORD.aspx.cs" Inherits="CHANGEPASS"  Title="Trivani Tirth Science School Kalsar " %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div class="container border border-primary border-3 rounded-3 w-50 p-4 mt-5">
    <h1>Change Password</h1>
        <br />
    <asp:TextBox ID="TXT_NEW_PASSWORD" runat="server" class="form-control w-50" 
            placeholder="New Password" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="REQUIRED_NEW_PASS" runat="server" 
            ControlToValidate="TXT_NEW_PASSWORD" SetFocusOnError="True" ErrorMessage="*">*</asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="EXPRESSION_PASSWORD" runat="server" 
            ControlToValidate="TXT_NEW_PASSWORD" Display="Dynamic" 
            
            ErrorMessage="PASSWORD MUST CONTAINS A CAPITAL, SMALL, NUMBER AND SPECIAL CHARACTER WITH LENGTH OF 8 TO 15 CHARACTERS" 
            SetFocusOnError="True" 
            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!%*?&amp;]{8,15}"></asp:RegularExpressionValidator>
   
    
    <asp:TextBox ID="TXT_CONFORM_PASSWORD" runat="server" class="form-control w-50" placeholder="Confirm Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="REQUIRED_CONFIRM_PASS" runat="server" 
        ControlToValidate="TXT_CONFORM_PASSWORD" SetFocusOnError="True" 
            ErrorMessage="*">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="COMPARE_PASSWORD" runat="server" 
        ErrorMessage="BOTH PASSWORD MUST BE SAME" ControlToCompare="TXT_NEW_PASSWORD" 
        ControlToValidate="TXT_CONFORM_PASSWORD" Display="Dynamic" 
        SetFocusOnError="True"></asp:CompareValidator>     
    <br />
    <asp:Button ID="BTN_UPDATE" runat="server" Text="UPDATE" CssClass="btn btn-primary" onclick="BTN_UPDATE_Click" />
    <asp:Button ID="BTN_CANCEL" runat="server" Text="CANCEL" CssClass="btn btn-dark"/>
            
    </div>
    </center>
</asp:Content>