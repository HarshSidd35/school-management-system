<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main-page.master" CodeFile="STU_DETAILS.aspx.cs" Inherits="_Default" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PlaceHolder ID="MyPlaceholder" runat="server"></asp:PlaceHolder>

<div class="container border border-3 border-primary rounded-3 w-50 my-4 px-4">
    <h1>STUDENT&#39;S DETAIL</h1>
    <br />
    
    <div class="form-floating">
        <asp:DropDownList ID="DROP_DOWN_ADMISSION_YEAR" runat="server" CssClass="form-select py-3">
            <asp:ListItem Value="SELECT_YEAR">SELECT YEAR</asp:ListItem>
            <asp:ListItem>2021</asp:ListItem>
            <asp:ListItem>2022</asp:ListItem>
            <asp:ListItem>2023</asp:ListItem>
            <asp:ListItem>2024</asp:ListItem>
            <asp:ListItem>2025</asp:ListItem>
            <asp:ListItem>2026</asp:ListItem>
            <asp:ListItem>2027</asp:ListItem>
            <asp:ListItem>2028</asp:ListItem>
            <asp:ListItem>2029</asp:ListItem>
            <asp:ListItem>2030</asp:ListItem>
            <asp:ListItem>2031</asp:ListItem>
            <asp:ListItem>2032</asp:ListItem>
            <asp:ListItem>2033</asp:ListItem>
            <asp:ListItem>2034</asp:ListItem>
            <asp:ListItem>2035</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="REQUIRED_ADMISSION_YEAR" runat="server" 
            ErrorMessage="*" Display="Dynamic" SetFocusOnError="True" 
            ControlToValidate="DROP_DOWN_ADMISSION_YEAR" InitialValue="SELECT_YEAR"></asp:RequiredFieldValidator>
    </div>
    <br />
    <div class="form-floating">
        <asp:TextBox ID="TXTROLLNO" runat="server" class="form-control" placeholder="Roll No"></asp:TextBox>
        <label for="TXTROLLNO">Roll Number</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_ROLLNO" runat="server" Display="Dynamic" 
            ControlToValidate="TXTROLLNO" SetFocusOnError="True" ErrorMessage="*" >*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RANGE_VALIDATOR_ROLLNO" runat="server" 
                    ControlToValidate="TXTROLLNO" Display="Dynamic" 
                    ErrorMessage="VALUES WITH IN 0 TO 1000" MaximumValue="999" MinimumValue="0" 
                    SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
    </div>
    <br />
    <div class="form-floating">
        <asp:TextBox ID="TXTNAME" runat="server" class="form-control" placeholder="Student Name" ></asp:TextBox>
        <label for="TXTNAME">Student Name</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_NAME" runat="server" 
            ControlToValidate="TXTNAME" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
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
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_GRP" runat="server" 
        ControlToValidate="RADIO_GRP" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
    <br />
    <div class="d-inline-flex w-100 ">
        <label class="form-check-label w-25 ">
            Date of Birth
        </label>
        <input type="date" name="TXTDOB" class="form-control w-100" />
        <br />
        <asp:Label ID="LBL_DATE" runat="server" Text="SELECT DATE" Visible="False" ForeColor="Red"></asp:Label>
    </div>
    <br />
    <br />  
    
    <div class="form-floating">
        <asp:TextBox ID="TXTMNO" runat="server" MaxLength="10" class="form-control" placeholder="Mobile No."></asp:TextBox>
        <label for="TXTMNO">Mobile Number</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_MNO" runat="server" 
            ControlToValidate="TXTMNO" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REGULAR_VALIDATION_MNO" runat="server" 
                        ControlToValidate="TXTMNO" Display="Dynamic" ErrorMessage="ENTER PROPER NUMBER" 
                        SetFocusOnError="True" ValidationExpression="^([6-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
   
    
    </div>
    
    <div class="form-floating">
        <asp:TextBox ID="TXTWNO" runat="server" MaxLength="10" class="form-control" placeholder="Whats App No."></asp:TextBox>
        <label for="TXTWNO">Whatsapp Number</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_WP" runat="server" 
            ControlToValidate="TXTWNO" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
        
        <asp:RegularExpressionValidator ID="REGULAR_VALIDATION_WNO" runat="server" 
                        ControlToValidate="TXTWNO" Display="Dynamic" ErrorMessage="ENTER PROPER NUMBER" 
                        SetFocusOnError="True" ValidationExpression="([6-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
    </div>
    
    
        
    <div class="form-floating">
         <asp:TextBox ID="TXTUID" runat="server" MaxLength="18" class="form-control" placeholder="UID" ></asp:TextBox>
         <label for="TXTUID">UID</label>
    
    </div>
    
   
    <br />
    <div class="form-floating">
        <asp:TextBox ID="TXTAADHAR" runat="server" MaxLength="12" class="form-control" placeholder="Aadhar No."></asp:TextBox>
        <label for="TXTAADHAR">Aadhar Number</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_AADHAR" runat="server" 
            ControlToValidate="TXTAADHAR" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
        
        <asp:RegularExpressionValidator ID="REGULAR_VALIDATION_AADHAR" runat="server" 
                        ControlToValidate="TXTAADHAR" Display="Dynamic" 
                        ErrorMessage="ENTER PROPER NUMBER" SetFocusOnError="True" 
                        ValidationExpression="^([0-9]{12})$"></asp:RegularExpressionValidator>
    
    </div>
   
    
    <div class="form-floating">
        <asp:TextBox ID="TXTGOAL" runat="server" class="form-control" placeholder="Goal"></asp:TextBox>
        <label for="TXTGOAL">Goal</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_GOAL" runat="server" 
            ControlToValidate="TXTGOAL" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    
    </div>
   
    
    <div class="form-floating">
        <asp:TextBox ID="TXTHOBBY" runat="server" class="form-control" placeholder="Hobby"></asp:TextBox>
        <label for="TXTHOBBY">Hobby</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_HOBBY" runat="server" 
            ControlToValidate="TXTHOBBY" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
   
    </div>
     
     
    <div class="form-floating">
    <asp:TextBox ID="TXT10PER" runat="server" class="form-control" placeholder="10TH Per"></asp:TextBox>
    <label for="TXT10PER">10<sup>TH</sup> Per</label>
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_10_PER" runat="server" 
            ControlToValidate="TXT10PER" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RANGE_VALIFATOR_PER" runat="server" 
                    ControlToValidate="TXT10PER" Display="Dynamic" 
                    ErrorMessage="VALUES WITH IN 0 TO 100" MaximumValue="100.00" MinimumValue="0.00" 
                    SetFocusOnError="True" Type="Double"></asp:RangeValidator>
    
    </div>
     
     
    <div class="form-floating">
        <asp:TextBox ID="TXT10SCHOOL" runat="server" class="form-control" placeholder="10TH Pass School"></asp:TextBox>
        <label for="TXT10SCHOOL">10<sup>TH</sup> School</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_10_SCHOOL" runat="server" 
            ControlToValidate="TXT10SCHOOL" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    
    
    </div>
    
    
    <div class="form-floating">
        <asp:TextBox ID="TXTMEMBERS" runat="server" class="form-control" placeholder="Number Of Memebers in Family"></asp:TextBox>
        <label for="TXTMEMBERS">Number of Members in Family</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_MEMBERS" runat="server" 
            ControlToValidate="TXTMEMBERS" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RANGE_VALIDATOR_MEMBERS" runat="server" 
                        ControlToValidate="TXTMEMBERS" Display="Dynamic" 
                        ErrorMessage="VALUES MUST BE INTEGER" 
                        SetFocusOnError="True" Type="Integer" MaximumValue="100" MinimumValue="0"></asp:RangeValidator>
    </div>
    
    
    
    <div class="form-floating">
        <asp:TextBox ID="TXTFDETAIL" runat="server" class="form-control" placeholder="Family Details"></asp:TextBox>
        <label for="TXTFDETAIL">Family Details</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_DETAILS" runat="server" 
            ControlToValidate="TXTFDETAIL" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
        
    </div>
    
    <label class="form-label">Father Present</label>
    <asp:RadioButtonList ID="RADIO_FATHER" runat="server" RepeatDirection="Horizontal" class=" d-inline-flex form-check ">
                    <asp:ListItem>YES</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
    </asp:RadioButtonList>
    
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_FATHER" runat="server" 
        ControlToValidate="RADIO_FATHER" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
    <br />
    <label class="form-label">Mother Present</label>
    <asp:RadioButtonList ID="RADIO_MOTHER" runat="server" RepeatDirection="Horizontal" class=" d-inline-flex form-check" >
                    <asp:ListItem>YES</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_MOTHER" runat="server" 
        ControlToValidate="RADIO_PHYSICAL" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
    <br />
     <div class="form-floating">
        <asp:TextBox ID="TXTOCCUPATION" runat="server" class="form-control" placeholder="Gardian Occupation"></asp:TextBox>
        <label for="TXTOCCUPATION">Gardian Occupation</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_OCCUPATION" runaT="server" 
                    ControlToValidate="TXTOCCUPATION" SetFocusOnError="true" 
             ErrorMessage="*"></asp:RequiredFieldValidator>
   
     </div>
     <label class="form-label">Physical Disability</label>
    <asp:RadioButtonList ID="RADIO_PHYSICAL" runat="server" Height="10px" RepeatDirection="Horizontal" class=" d-inline-flex form-check ">
                    <asp:ListItem>YES</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_PHYISCAL" runat="server" 
        ControlToValidate="RADIO_PHYSICAL" SetFocusOnError="True" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
    <br />
    
    <div class="form-floating">
        <asp:TextBox ID="TXTADDRESS" runat="server" TextMode="MultiLine" 
            class="form-control" placeholder="Address" Rows=3 Height="100px"></asp:TextBox>
        <label for="TXTADDRESS">Address</label>
        <asp:RequiredFieldValidator ID="REQUIRED_VALIDATOR_ADDRESS" runat="server" 
        ControlToValidate="TXTADDRESS" 
        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    
    
    <asp:Image ID="IMG_PHOTO" runat="server" Height="100px" Width="100px" />
    <br />
    <asp:Label ID="LBL_PHOTO" runat="server" ForeColor="Red" 
                    Text="SIZE MUST  BE WITH IN 200KB AND IMAGES ARE ONLY ALLOWED" 
        Visible="False"></asp:Label>
    <br />
    <asp:FileUpload ID="UPLOAD_PHOTO" runat="server" class="form-control"/>
    <br />
    <asp:TextBox ID="TXT_PATH_PHOTO" runat="server" placeholder="Photo" 
        Visible="False"></asp:TextBox>
    <br />
    <br />
    <asp:Image ID="IMG_SIGN" runat="server" Height="100px" Width="100px" />
    <br />
    <asp:Label ID="LBL_SIGN" runat="server" ForeColor="Red"
                    Text="SIZE MUST  BE WITH IN 50KB AND IMAGES ARE ONLY ALLOWED" 
        Visible="False"></asp:Label>
    <br />
    <asp:FileUpload ID="UPLOAD_SIGN" runat="server" class="form-control"/>
    <br />
    <asp:TextBox ID="TXT_PATH_SIGN" runat="server" Wrap="False" placeholder="Sign" 
        Visible="False"></asp:TextBox>
    <br />
    
    <div class="p-4">
        <asp:Button ID="BTN_SUBMIT" runat="server" class="btn btn-primary" Text="SUBMIT" onclick="BTN_SUBMIT_Click" />
        <input id="BTN_CLEAR" type="reset" value="CLEAR" class="btn btn-danger"/>
    </div>
</div>

</asp:Content>