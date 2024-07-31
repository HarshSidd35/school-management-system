<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main-page.master" CodeFile="ABOUT.aspx.cs" Inherits="about" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--<br />
    <br />
    
    <div style="background-color: #3399FF; color: #FFF">
        <center>
        <h1>About Us</h1>
        <div>
            <div>
                 <span> CONTACT NO:8866588835</span><br />
                 <span>WHATSAPP NO:8866588835</span><br />
                 <span>EMAIL: triveniscience2017@gmail.com</span><br />
                 <span>TRIVENI TIRTH SCIENCE SCHOOL KALSAR</span><br />
            </div>
        </div>
        </center>
        
    </div>-->
    <center>
    <div class="container-fluid mt-5 ">
       <div class="card" style="width: 22rem;">
           <asp:Image ID="Image1" runat="server" ImageUrl="~/images_for_gallery/logo.png" class="card-img-top" />
  
  <div class="card-body">
    <h5 class="card-title">Contact Us</h5>
    <p class="card-text">Contact Us on any of the media .</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Contact No. - 8866588835</li>
    <li class="list-group-item">Whatsapp No. - <a href="https://wa.me/8849926030" target="_blank">8849926030</a></li>
    <li class="list-group-item">E-mail ID - <a href="mailto:triveniscience2017@gmail.com">triveniscience2017@gmail.com</a></li>
  </ul>
  <div class="card-body">
    <a href="HOME.aspx" class="card-link">Home Page</a>
    <a href="tel:8866588835" class="card-link">Call Directly</a>
  </div>
</div>
    </div>
    </center>
</asp:Content>