<%@ Page Language="C#" MasterPageFile="~/main-page.master" AutoEventWireup="true" CodeFile="REPORT.aspx.cs" Inherits="REPORT" Title="Trivani Tirth Science School Kalsar " %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="w-100">
<div class="table-responsive mx-3 mt-5">
<asp:Table ID="Table1" runat="server"  Visible="False" 
        Class="table table-striped table-hover" CaptionAlign="Top">
    <asp:TableRow ID="TableRow1" runat="server">
        <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" width="250px">DATE</asp:TableHeaderCell>
        <asp:TableHeaderCelL ID="TableHeaderCelL2" runat="server" >PHYSICS OBTAIN MARKS</asp:TableHeaderCelL>
        <asp:TableHeaderCelL ID="TableHeaderCelL3" runat="server" >PHYSICS TOTAL MARKS</asp:TableHeaderCelL>
        <asp:TableHeaderCelL ID="TableHeaderCelL4" runat="server" >CHEMISTRY OBTAIN MARKS</asp:TableHeaderCelL>
        <asp:TableHeaderCelL ID="TableHeaderCelL5" runat="server" >CHEMISTRY TOTAL MARKS</asp:TableHeaderCelL>
        <asp:TableHeaderCelL ID="TableHeaderCelL6" runat="server" >MATHS/BIOLOGY OBTAIN MARKS</asp:TableHeaderCelL>
        <asp:TableHeaderCelL ID="TableHeaderCelL7" runat="server" >MATHS/BIOLOGY TOTAL MARKS</asp:TableHeaderCelL>
        <asp:TableHeaderCelL ID="TableHeaderCelL8" runat="server" >TOTAL MARKS</asp:TableHeaderCelL>
    </asp:TableRow>
</asp:Table>
</div>



<div class=" container border border-3 border-primary rounded-5 overflow-hidden w-50 my-5">
    <h1 class="text-center">STUDENT&#39;S MARKS</h1>
    <br />
    <div class="container d-inline-flex">
    
    
    <asp:CheckBox ID="CHECK_LECTURE_TEST" runat="server" CssClass="form-control form-check d-inline-flex " Text="LECTURE TEST" />
    <asp:CheckBox ID="CHECK_WEET_TEST" runat="server" CssClass="form-control form-check d-inline-flex " Text="WEEK TEST"  />
    <asp:CheckBox ID="CHECK_GUJCET_TEST" runat="server" CssClass="form-control form-check d-inline-flex " Text="GUJCET TEST"  />
    <asp:CheckBox ID="CHECK_JEE_NEET_TEST" runat="server" CssClass="form-control form-check d-inline-flex" Text="JEE NEET TEST" />
    </div>
    <br />
    <br />
    <div class="form-floating">
        <asp:TextBox ID="TXTROLLNO" runat="server" class="form-control" placeholder="Roll No."></asp:TextBox>
        <label for="TXTROLLNO">Roll Number</label>
    </div>
    
            
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_ROLLNO" runat="server" 
                        ControlToValidate="TXTROLLNO" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    
    <br />
    <div class="d-inline-flex ">
     <label class="form-check-label">
    Std
  </label>
    <asp:RadioButtonList ID="RADIO_STD" runat="server" Height="10px" 
                    RepeatDirection="Horizontal" Width="147px" class="form-check px-3">
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_STD" runat="server" 
            ControlToValidate="RADIO_STD" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
    <br />
    <br />
    <div class="d-inline-flex ">
    <label class="form-check-label">
    Group
  </label>
    <asp:RadioButtonList ID="RADIO_GRP" runat="server" Height="10px" 
                    RepeatDirection="Horizontal" Width="147px" class="form-check px-3">
                <asp:ListItem>A</asp:ListItem>
                <asp:ListItem>B</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_STD0" runat="server" 
            ControlToValidate="RADIO_GRP" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
       
    </div> 
    <br />
    <div class="p-3">
    <asp:Button ID="BTN_SUBMIT" runat="server" Text="SUBMIT" class="btn btn-primary" onclick="BTN_SUBMIT_Click"/>
    <input id="BTN_CLEAR" type="reset" value="CLEAR" class="btn btn-danger"/>
    </div>         
</div>





</div>
</asp:Content>