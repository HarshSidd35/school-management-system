<%@ Page Language="C#" MasterPageFile="~/main-page.master" AutoEventWireup="true" CodeFile="UPDATE_STU_DETAILS.aspx.cs" Inherits="UPDATE_STU_DETAILS" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:PlaceHolder ID="MyPlaceholder" runat="server"></asp:PlaceHolder>
<div class="container border border-3 border-primary rounded-3 w-50 my-4 px-3">
    <h1 style="font-size:2.2rem">STUDENT UPDATE AND DELETE DETAILS</h1>
    <br />
    <div class="form-floating">
      <asp:TextBox ID="TXTROLLNO" runat="server" class="form-control" placeholder="Roll No"></asp:TextBox>
      <label for="TXTROLLNO">Roll Number</label>
       <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_ROLLNO" runat="server" ControlToValidate="TXTROLLNO" SetFocusOnError="True" ></asp:RequiredFieldValidator>
        
    </div>
 
  
    
    <label Cssclass="form-check-label">
        Std
    </label>
    <asp:RadioButtonList ID="RADIO_STD" runat="server" RepeatDirection="Horizontal" class=" d-inline-flex form-check">
        <asp:ListItem >11</asp:ListItem>
        <asp:ListItem >12</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_STD" runat="server" 
                    ControlToValidate="RADIO_STD" Display="Dynamic" 
                    ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>  
    <br />
    
    <label class="form-check-label" >
        Group
    </label>
    <asp:RadioButtonList ID="RADIO_GRP" runat="server" RepeatDirection="Horizontal" class=" d-inline-flex form-check mt-3">
        <asp:ListItem>A</asp:ListItem>
        <asp:ListItem>B</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_GRP" runat="server" ControlToValidate="RADIO_GRP" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <div>
        <asp:Button ID="BTN_SEARCH" runat="server" class="btn btn-primary m-3" 
            Text="SEARCH" onclick="BTN_SEARCH_Click" />
        <asp:Button ID="BTN_CLEAR" runat="server" class="btn btn-danger" Text="CLEAR" />
        <asp:Button ID="BTN_DELETE" runat="server" class="btn btn-dark m-3" Text="DELETE" 
            onclick="BTN_DELETE_Click" />
    </div>
    <br />
    <asp:Panel ID="Panel1" runat="server">
    <div class="form-floating">
        <asp:TextBox ID="TXTNAME" runat="server" class="form-control" placeholder="Student Name" ></asp:TextBox>
        <label for="TXTNAME">Student Name</label>
    </div>
    
    <br />
    
    <div class="form-floating">
         <asp:TextBox ID="TXTMNO" runat="server" MaxLength="10" class="form-control" placeholder="Mobile No."></asp:TextBox>
          <label for="TXTMNO">Mobile Number</label>
          <asp:RegularExpressionValidator ID="REGULAR_VALIDATION_MNO" runat="server"
                    ControlToValidate="TXTMNO" Display="Dynamic" ErrorMessage="ENTER PROPER NUMBER" 
                    SetFocusOnError="True" 
            ValidationExpression="^([6-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
    </div>
    
    <br />
   
   <div class="form-floating">
        <asp:TextBox ID="TXTWNO" runat="server" MaxLength="10" class="form-control" placeholder="Whats App No."></asp:TextBox>
        <label for="TXTWNO">Wahtsapp Number</label>
        <asp:RegularExpressionValidator ID="REGULAR_VALIDATION_WNO" runat="server"
                    ControlToValidate="TXTWNO" Display="Dynamic" ErrorMessage="ENTER PROPER NUMBER" 
                    SetFocusOnError="True" ValidationExpression="([6-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
   </div>
    <br />
    
    <div class="form-floating">
        <asp:TextBox ID="TXTUID" runat="server" MaxLength="18" class="form-control" placeholder="UID" ></asp:TextBox> 
        <label for="TXTUID">UID</label>
            
    </div>
    
    <br />
    
    <div class="form-floating">
         <asp:TextBox ID="TXTAADHAR" runat="server" MaxLength="12" class="form-control" placeholder="Aadhar No."></asp:TextBox>
          <label for="TXTAADHAR">Aadhar Number</label>
         <asp:RegularExpressionValidator ID="REGULAR_VALIDATION_AADHAR" runat="server"
                    ControlToValidate="TXTAADHAR" Display="Dynamic" 
                    ErrorMessage="ENTER PROPER NUMBER" SetFocusOnError="True" 
                    ValidationExpression="^([0-9]{12})$"></asp:RegularExpressionValidator>
         
    </div>
    
    
    <br />
    
    <div class="form-floating">
        <asp:TextBox ID="TXTGOAL" runat="server" class="form-control" placeholder="Goal"></asp:TextBox>
         <label for="TXTGOAL">Goal</label>
    </div>
    
    
    <br />
    
    <div class="form-floating">
        <asp:TextBox ID="TXTHOBBY" runat="server" class="form-control" placeholder="Hobby"></asp:TextBox>
         <label for="TXTHOBBY">Hobby</label>
    </div>
    
    <br />
    
    <div class="form-floating">
        <asp:TextBox ID="TXT10PER" runat="server" class="form-control" placeholder="10TH Per"></asp:TextBox>
        <label for="TXT10PER">10<sup>TH</sup> Per</label>
        <asp:RangeValidator ID="RANGE_VALIFATOR_PER" runat="server"
                    ControlToValidate="TXT10PER" Display="Dynamic" 
                    ErrorMessage="VALUES WITH IN 0 TO 100" MaximumValue="100.00" MinimumValue="0.00" 
                    SetFocusOnError="True" Type="Double"></asp:RangeValidator>
    </div>
    <br />
    <div class="form-floating">
        <asp:TextBox ID="TXT10SCHOOL" runat="server" class="form-control" placeholder="10TH Pass School"></asp:TextBox>
        <label for="TXT10SCHOOL">10<sup>TH</sup>School</label>
    </div>
    <br />
    
    <div class="form-floating">
        <asp:TextBox ID="TXTMEMBERS" runat="server" class="form-control" placeholder="Number of Family Member "></asp:TextBox>    
        <label for="TXTMEMBERS">Number of Family Members</label>
        <asp:RangeValidator ID="RANGE_VALIDATOR_MEMBERS" runat="server"
                    ControlToValidate="TXTMEMBERS" Display="Dynamic" 
                    ErrorMessage="VALUES MUST BE INTEGER" 
                    SetFocusOnError="True" Type="Integer" MaximumValue="100" 
            MinimumValue="0"></asp:RangeValidator>
    </div>
    <br />
    
    <div class="form-floating">
        <asp:TextBox ID="TXTFDETAIL" runat="server" class="form-control" placeholder="Family Details"></asp:TextBox>
        <label for="TXTFDETAIL">Family Details</label>
    </div>
    
    
    <br />
    <label class="form-label">Father Present</label>
    <asp:RadioButtonList ID="RADIO_FATHER" runat="server" RepeatDirection="Horizontal" class=" d-inline-flex form-check p-3">
                    <asp:ListItem>YES</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    
    <label class="form-label">Mother Present</label>
    <asp:RadioButtonList ID="RADIO_MOTHER" runat="server" RepeatDirection="Horizontal" class=" d-inline-flex form-check p-3" >
                    <asp:ListItem>YES</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <br />
    <div class="form-floating">
        <asp:TextBox ID="TXTOCCUPATION" runat="server" class="form-control" placeholder="Gardian Occupation"></asp:TextBox>
        <label for="TXTOCCUPATION">Gardian Occupation</label>
    </div>
    
    <br />
    
    <label class="form-label">Physical Disability</label>
    <asp:RadioButtonList ID="RADIO_PHYSICAL" runat="server" Height="10px" RepeatDirection="Horizontal" class=" d-inline-flex form-check p-3">
                    <asp:ListItem>YES</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <br />
    <div class="form-floating">
        <asp:TextBox ID="TXTADDRESS" runat="server" TextMode="MultiLine" class="form-control" placeholder="Address"></asp:TextBox>
        <label for="TXTADDRESS">Address</label>
        
    </div>
    
    
    <br />
    <asp:Image ID="IMG_PHOTO" runat="server" Height="100px" Width="100px" />
    <br />
    <asp:Label ID="LBL_PHOTO" runat="server" 
                    Text="SIZE MUST  BE WITH IN 200KB AND IMAGES ARE ONLY ALLOWED" Visible="False"></asp:Label>
    <br />
    <asp:FileUpload ID="UPLOAD_PHOTO" runat="server" class="form-control"/>
    <br />
    <asp:TextBox ID="TXT_PATH_PHOTO" runat="server" placeholder="Photo"></asp:TextBox>
    <br />
    <br />
    <asp:Image ID="IMG_SIGN" runat="server" Height="100px" Width="100px" />
    <br />
    <asp:Label ID="LBL_SIGN" runat="server" 
                    Text="SIZE MUST  BE WITH IN 50KB AND IMAGES ARE ONLY ALLOWED" Visible="False"></asp:Label>
    <br />
    <asp:FileUpload ID="UPLOAD_SIGN" runat="server" class="form-control"/>
    <br />
    <asp:TextBox ID="TXT_PATH_SIGN" runat="server" Wrap="False" placeholder="Sign"></asp:TextBox>
    <br />
    <div class="p-4">
        <asp:Button ID="BTN_UPDATE" runat="server" class="btn btn-primary"
            Text="UPDATE" onclick="BTN_UPDATE_Click" />
        <input id="BTN_CLEAR" type="reset" value="CLEAR" class="btn btn-danger"/>
    </div>
   
    </asp:Panel>
</div>
</asp:Content>