<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Watts2._0_With_Builtin_DAL.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UserName" runat="server">
    <asp:TextBox ID="userT" Height="20px" Width="200px" runat="server" style="position:absolute;top:300px;left:850px;"></asp:TextBox>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Password" runat="server">
    <asp:TextBox ID="passT" Height="20px" Width="200px" runat="server" style="position:absolute;top:330px;left:850px;" TextMode="Password"></asp:TextBox>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="label1" runat="server">
    <asp:Label Height="20px" Width ="100px" Text="User name:" style="position:absolute;top:300px;left:772px;" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="label2" runat="server">
    <asp:Label Height="20px" Width ="50px" Text="Password:" style="position:absolute;top:330px;left:780px;" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="people" runat="server">
    
        <div id="1">
            <img class="loginphotos1" src="photos/loginPhotos/firstguy.png">
        </div>
        <div id="2">
            <img class="loginphotos2" src="photos/loginPhotos/secondguy.png">
        </div>
        <div id="3">
            <img class="loginphotos3" src="photos/loginPhotos/thirdguy.png">
        </div>
        <div id="4">
            <img class="loginphotos4" src="photos/loginPhotos/forthguy.png">
        </div>
        <div id="5">
            <img class="loginphotos7" src="photos/loginPhotos/thirdguy.png">
        </div>
        <div id="6">
            <img class="loginphotos6" src="photos/loginPhotos/secondguy.png">
        </div>
        <div id="7">
            <img class="loginphotos5" src="photos/loginPhotos/firstguy.png">
        </div>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Submit" runat="server">
    <asp:Button Text="register" OnClick="Rsub" style="position:absolute;top:370px;left:880px;" runat="server" />
    
</asp:Content>
<asp:Content ID="LoginButton" ContentPlaceHolderID="login" runat="server">
    <asp:Button Text="login" OnClick="Lsub" runat="server" style="position:absolute;top:370px;left:950px;" />
</asp:Content>

<asp:Content ID="Style" ContentPlaceHolderID="style" runat="server">
    <style type="text/css">
        
        body{
		background-image:url("photos/loginPhotos/firstscreen.png");
		background-size:1920px 1080px;
		background-repeat: no-repeat;
		overflow:hidden;
		}
        .loginphotos1{
		width:166px;
		height:323px;
		left:75px;
		top:504px;
		float:right;
		position: absolute;
		}
		.loginphotos2{
		width: 219px;
		height: 426px;
		left:206px;
		top: 593px;
		z-index:1;
		float:right;
		position: absolute;
		}
		.loginphotos3{
		width: 246px;
		height: 480px;
		left: 454px;
		top: 665px;
		float:right;
		position: absolute;
		}
		.loginphotos4{
		width: 285px;
		height: 555px;
		left: 818px;
		top: 725px;
		float:right;
		position: absolute;
		}
		.loginphotos5{
		width:166px;
		height:323px;
		left:1678px;
		top:504px;
		float:right;
		position: absolute;
		}
		.loginphotos6{
		width: 219px;
		height: 426px;
		left:1496px;
		top: 593px;
		z-index:1;
		float:right;
		position: absolute;
		}
		.loginphotos7{
		width: 246px;
		height: 480px;
		left: 1220px;
		top: 665px;
		float:right;
		position: absolute;
		}
    </style>
</asp:Content>


<asp:Content ID="script" ContentPlaceHolderID="afterBody" runat="server">
    <script> 
       var arr;
var img = {};
var pos;
var counter = 0;
var dir = "toright";
var i = 0;
var x = 80;
function fillarr()
{
	arr =[];
	//finds the photos in the login page according to their respective classes and puts them in an array as an object of two photos
	for (var i = 1; i < 8; i++)
	{
		img = document.getElementsByClassName('loginphotos' + (i).toString());
		//alert(img);
		arr.push(img);
	}
}
function move()
{
	fillarr();
	godown();
	if(dir == "toright")
	{
		goupright();
		dir = "toleft";
		move();
	}
	else
	{
		 goupleft();
		dir = "toright";
		move();
	}
}





function godown()
{
	fillarr();
	
	for (var i = 0; i < (arr.length)/2 ; i++)
	{
		if(i == 0)
		{
			$(arr[i]).animate({"top": "+=" + x.toString() + "px"}, "slow");
			$(arr[i +4]).animate({"top": "+=" + x.toString() + "px"}, "slow");
		}
		else if(i ==1)
		{
			$(arr[i]).animate({"top": "+=" + x.toString() + "px"}, "slow");
			$(arr[i +4]).animate({"top": "+=" + x.toString() + "px"}, "slow");
		}
		else if(i == 2)
		{
			$(arr[i]).animate({"top": "+=" + x.toString() + "px"}, "slow");
			$(arr[i +4]).animate({"top": "+=" + x.toString() + "px"}, "slow");
		}
		else
		{
			$(arr[i]).animate({"top": "+=10px"}, "slow");
		}
	/*$(arr[0]).animate({"top": "+=250px"}, "slow",function(){
	$(arr[1]).animate({"top": "+=150px"}, "slow",function(){
	$(arr[2]).animate({"top": "+=70px"}, "slow",function(){
	$(arr[3]).animate({"top": "+=10px"}, "slow",function(){
	$(arr[6]).animate({"top": "+=70px"}, "slow",function(){
	$(arr[5]).animate({"top": "+=150px"}, "slow",function(){
	$(arr[4]).animate({"top": "+=250px"}, "slow")})})})})})});*/
	}
}
function goupright()
{
	
	for (var i = 0; i < (arr.length)/2 ; i++)
	{
	
		if(i == 0)
		{
			$(arr[i]).animate({"top": "-=" + x.toString() + "px"}, 1000);
			$(arr[i +4]).animate({"top": "-=" + x.toString() + "px"}, 1000);
		}
		else if(i ==1)
		{
			$(arr[i]).animate({"top": "-=" + x.toString() + "px"}, 500);
			$(arr[i +4]).animate({"top": "-=" + x.toString() + "px"}, 500);
		}
		else if(i == 2)
		{
			$(arr[i]).animate({"top": "-=" + x.toString() + "px"}, "slow");
			$(arr[i +4]).animate({"top": "-=" + x.toString() + "px"}, "slow");
		}
		else
		{
			$(arr[i]).animate({"top": "-=10px"}, "slow");
		}		
		
	}
	/*$(arr[0]).animate({"top": "-=250px"}, "slow",function(){
	$(arr[1]).animate({"top": "-=150px"}, "slow",function(){
	$(arr[2]).animate({"top": "-=70px"}, "slow",function(){
	$(arr[3]).animate({"top": "-=10px"}, "slow",function(){
	$(arr[6]).animate({"top": "-=70px"}, "slow",function(){
	$(arr[5]).animate({"top": "-=150px"}, "slow",function(){
	$(arr[4]).animate({"top": "-=250px"}, "slow")})})})})})});*/
}	

function goupleft()
{
	for (var i = arr.length - 1; i > -1  ; i--)
	{
			
		if(i == 0 || i == 4)
		{
			$(arr[i]).animate({"top": "-=" + x.toString() + "px"}, "slow");
		}
		else if(i ==1 || i == 5)
		{
			$(arr[i]).animate({"top": "-=" + x.toString() + "px"}, "slow");
		}
		else if(i == 2|| i == 6)
		{
			$(arr[i]).animate({"top": "-=" + x.toString() + "px"}, "slow");
		}
		else
		{
			$(arr[i]).animate({"top": "-=10px"}, "slow");
		}
		//window.setTimeout(goupleft(i+1),1000);
	}
	/*$(arr[4]).animate({"top": "-=250px"}, "slow",function(){
	$(arr[5]).animate({"top": "-=150px"}, "slow",function(){
	$(arr[6]).animate({"top": "-=70px"}, "slow",function(){
	$(arr[3]).animate({"top": "-=10px"}, "slow",function(){
	$(arr[2]).animate({"top": "-=70px"}, "slow",function(){
	$(arr[1]).animate({"top": "-=150px"}, "slow",function(){
	$(arr[0]).animate({"top": "-=250px"}, "slow")})})})})})});*/
}

function stopOrContinue()
{
	if(counter == 0)
	{
		dir = "stop";
		counter++;
	}
	else
	{
		dir = "toright";
		counter--;
	}
}
        move();
    </script>
</asp:Content>
