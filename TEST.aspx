<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main-page.master"  CodeFile="TEST.aspx.cs" Inherits="_Default" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:PlaceHolder ID="MyPlaceholder" runat="server"></asp:PlaceHolder>
    <div class="container border border-3 mt-5 rounded-5 border-primary  w-50 overflow-hidden">
    <h1 class="text-center">TEST INFORMATION</h1>
    <br />
    <asp:DropDownList ID="DROP_DOWN_TEST" runat="server" class="form-select">
                    <asp:ListItem Value="SELECT_TEST">SELECT TEST</asp:ListItem>
                    <asp:ListItem Value="LECTURE_TEST">LECTURE TEST</asp:ListItem>
                    <asp:ListItem Value="WEEK_TEST">WEEK TEST</asp:ListItem>
                    <asp:ListItem Value="GUJCET_TEST">GUJCET TEST</asp:ListItem>
                    <asp:ListItem Value="JEE_NEET_TEST">JEE/NEET TEST</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="REQUIRED_TEST" runat="server" 
                        ControlToValidate="DROP_DOWN_TEST" InitialValue="SELECT_TEST" 
                        SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
       
   <br />
   <div class="form-floating">
    <asp:TextBox ID="TXTRNO" runat="server" class="form-control" placeholder="Roll Number"></asp:TextBox>
    <label for="TXTRNO">Roll Number</label>
   </div>
   <asp:RequiredFieldValidator ID="REQUIED_RNO" runat="server" ControlToValidate="TXTRNO" 
                        SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
   <br />
   
   <div class="d-inline-flex flex-row  float-start">
   <label class="form-check-label" for="flexRadioDefault1">
    STD
  </label>
   <asp:RadioButtonList ID="RADIO_STD" runat="server" class="d-flex ms-4 px-3" RepeatDirection="Horizontal">
        <asp:ListItem>11</asp:ListItem>        
        <asp:ListItem>12</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="REQUIRED_STD" runat="server" 
           ControlToValidate="RADIO_STD" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
    
   </div>
   <br />
   <br />
    <div class="d-inline-flex flex-row  float-start">
    <label class="form-check-label">
    Group
    </label>
    <asp:RadioButtonList ID="RADIO_GRP" class="d-flex ms-3 px-3" runat="server" RepeatDirection="Horizontal" >
        <asp:ListItem>A</asp:ListItem>
        <asp:ListItem>B</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="REQUIRED_GRP" runat="server" 
            ControlToValidate="RADIO_GRP" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
   
    </div>
    <br />
    <br />
        <div>            
            <h3>Subject Marks</h3>
            <br />
            
            
            
            <!-- PHYSICS -->
             <asp:CheckBox ID="CHECKPHYSICS" runat="server" Text="PHYSICS"  CssClass="form-control form-check d-inline-flex w-25"
                    oncheckedchanged="CHECHPHYSICS_CheckedChanged" AutoPostBack="True" />
             <br />
             Obtain Marks:
             <asp:RequiredFieldValidator ID="REQUIRED_OB_PHY" runat="server" 
                ControlToValidate="TXT_OB_PHY" SetFocusOnError="True" Enabled="False" 
                ErrorMessage="*"></asp:RequiredFieldValidator>
              <asp:CompareValidator ID="COMPARE_PHY" runat="server" 
                    ControlToCompare="TXT_TOT_PHY" ControlToValidate="TXT_OB_PHY" Display="Dynamic" 
                    Enabled="False" ErrorMessage="VALUES MUST BE INTERGER &amp; LESS THAN  TOTAL MARKS" 
                    Operator="LessThanEqual" Type="Integer"></asp:CompareValidator>
             <br />
             <asp:TextBox ID="TXT_OB_PHY" runat="server" Enabled="False" class="form-control">AB</asp:TextBox>
             Total Marks:
             <asp:RequiredFieldValidator ID="REQUIRED_TOT_PHY" runat="server" 
                ControlToValidate="TXT_TOT_PHY" SetFocusOnError="True" Enabled="False" 
                ErrorMessage="*"></asp:RequiredFieldValidator>
             <asp:TextBox ID="TXT_TOT_PHY" runat="server" Enabled="False" class="form-control">AB</asp:TextBox>
             <br />
               
               
               
              <!-- CHEMISTRY -->
              <asp:CheckBox ID="CHECKCHEMISTRY" runat="server" Text="CHEMISTRY" AutoPostBack="True" oncheckedchanged="CHECKCHEMISTRY_CheckedChanged1" CssClass="form-control form-check d-inline-flex w-25" />
                <br />
              
              Obtain Marks:
              <asp:RequiredFieldValidator ID="REQUIRED_OB_CHEM" runat="server" 
                ControlToValidate="TXT_OB_CHE" SetFocusOnError="True" Enabled="False" 
                ErrorMessage="*"></asp:RequiredFieldValidator>
              <asp:CompareValidator ID="COMPARE_CHEM" runat="server" 
                    ControlToCompare="TXT_TOT_CHE" ControlToValidate="TXT_OB_CHE" Display="Dynamic" 
                    ErrorMessage="VALUES MUST BE INTERGER &amp; LESS THAN  TOTAL MARKS" 
                    Operator="LessThanEqual" Type="Integer" Enabled="False" 
                SetFocusOnError="True"></asp:CompareValidator>
              <br />
              <asp:TextBox ID="TXT_OB_CHE" runat="server" Enabled="False" class="form-control">AB</asp:TextBox>
              Total Marks:
              <asp:RequiredFieldValidator ID="REQUIRED_TOT_CHEM" runat="server" 
                   ControlToValidate="TXT_TOT_CHE" SetFocusOnError="True" Enabled="False" 
                   ErrorMessage="*"></asp:RequiredFieldValidator>
              <asp:TextBox ID="TXT_TOT_CHE" runat="server" Enabled="False" class="form-control">AB</asp:TextBox>
              <br />
                
                
                
                
              <!--MATHS-BIOLOGY-->
              <asp:CheckBox ID="CHECKM_B" runat="server" Text="MATHS/BIOLOGY" 
                oncheckedchanged="CHECKM_B_CheckedChanged1" 
                CssClass="form-control form-check d-inline-flex w-25" AutoPostBack="True"/>
              <br />
              Obtain Marks:
              <asp:CompareValidator ID="COMPARE_M_B" runat="server" 
                    ControlToCompare="TXT_TOT_M_B" ControlToValidate="TXT_OB_M_B" Display="Dynamic" 
                    ErrorMessage="VALUES MUST BE INTERGER &amp; LESS THAN  TOTAL MARKS" 
                    Operator="LessThanEqual" Type="Integer" Enabled="False" 
                    SetFocusOnError="True"></asp:CompareValidator>
              <asp:RequiredFieldValidator ID="REQUIRED_OB_M_B" runat="server" 
                ControlToValidate="TXT_OB_M_B" SetFocusOnError="True" Enabled="False" 
                ErrorMessage="*"></asp:RequiredFieldValidator>
              <br />
              <asp:TextBox ID="TXT_OB_M_B" runat="server" Enabled="False" class="form-control">AB</asp:TextBox>
              Total Marks:
              <asp:RequiredFieldValidator ID="REQUIRED_TOT_M_B" runat="server" 
                ControlToValidate="TXT_TOT_M_B" SetFocusOnError="True" Enabled="False" 
                ErrorMessage="*"></asp:RequiredFieldValidator>
              <asp:TextBox ID="TXT_TOT_M_B" runat="server" Enabled="False" class="form-control">AB</asp:TextBox>
              <br />
        </div> 
        
        <div class="d-inline-flex flex-row w-100">
        <label for="exampleFormControlInput1" class="form-label ">Date</label>
        <input type="date" name="TXT_DATE" class="form-control w-100 mx-3"/>
            <asp:Label ID="LBL_DATE" runat="server" Text="SELECT DATA" Visible="False"></asp:Label>      
        </div>
        <br />
        <br />
        <div class="form-floating">
            <asp:TextBox ID="TXT_TOTAL" runat="server" ReadOnly="True" class="form-control" 
                placeholder="Total Marks" Visible="False"></asp:TextBox>
        </div>
        
        <br />
        <div class="p-3">
            <asp:Button ID="BTN_SUBMIT" runat="server" Text="SUBMIT" class="btn btn-info" onclick="BTN_SUBMIT_Click" />
            <input id="BTN_CLEAR" type="reset" value="CLEAR" runat=server class="btn btn-danger px-3"/>           
        </div>        
   </div>
</asp:Content>