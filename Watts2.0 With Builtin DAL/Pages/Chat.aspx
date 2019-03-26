<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Chat.Master" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="Watts2._0_With_Builtin_DAL.Pages.Chat1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="server">
    <section class="menu menu--circle" style="z-index: 1">
        <input type="checkbox" id="menu__active" />
        <label for="menu__active" class="menu__active">
            <div class="menu__toggle">
                <div class="icon">
                    <div class="hamburger"></div>
                </div>
            </div>
            <input type="radio" name="arrow--up" id="degree--up-0" />
            <input type="radio" name="arrow--up" id="degree--up-1" />
            <input type="radio" name="arrow--up" id="degree--up-2" />
            <div class="menu__listings">
                <ul class="circle">
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="Home">2<i class="fa fa-user"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <div class="spin">
                                    <a href="#" class="button">
                                        <img src="../photos/settings_gear.png" /><i class="fa fa-cog"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#">&nbsp</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button">9<i class="fa fa-commenting"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button">8<i class="fa fa-trash"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button">7<i class="fa fa-battery-4"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button">6<i class="fa fa-calendar"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button">5<i class="fa fa-cloud"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button">4<i class="fa fa-wifi"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button">3<i class="fa fa-envelope-o"></i></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="menu__arrow menu__arrow--top">
                <ul>
                    <li>
                        <label for="degree--up-0">
                            <div class="arrow"></div>
                        </label>
                        <label for="degree--up-1">
                            <div class="arrow"></div>
                        </label>
                        <label for="degree--up-2">
                            <div class="arrow"></div>
                        </label>
                    </li>
                </ul>
            </div>
        </label>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="style" runat="server">
    <style type="text/css">
        .CastAside {
            position: absolute;
            left: 2000px;
        }

        digital-clock {
            margin: auto;
            position: relative;
            position: relative;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            width: 200px;
            height: 60px;
            color: #ffffff;
            border: 2px solid #999;
            border-radius: 4px;
            text-align: center;
            font: 50px/60px 'DIGITAL', Helvetica;
            background: linear-gradient(90deg, #000, #555);
        }

        .topBar {
            position: absolute;
            left: 400px;
            top: 90px;
            border-radius: 17px;
            border: 0px solid;
            background-color: #c873ff;
            width: 1000px;
            height: 100px;
        }

        .Pimg {
            border-radius: 50%;
            border:0px solid;
            margin-top: 5px;
            margin-left:5px;
            width: 90px;
            height:90px;
            position:relative;
        }
        .ChatScreen {
            width: 1000px;
            height: 600px;
            flex-flow: column;
            border-top-left-radius: 17px;
            border-top-right-radius: 17px;
            transition: 0.1s ease-out;
            background-color: #f0d9ff;
        }

            .ChatScreen .container {
                border: 0px solid;
                background-color: #E1B3FF;
                border-radius: 5px;
                padding: 10px;
                margin: 10px 0;
                width: 440px;
                margin-left: 120px;
                border-radius: 17px;
            }

            .ChatScreen .darker {
                border-color: #c1264e;
                margin-left: 287%;
                background: #ffb8e9;
            }

            .ChatScreen .lighter {
                border-color: #f1f1f1;
                background: #E1B3FF;
            }

                .ChatScreen .lighter .mdate {
                    text-align: right;
                }

            .ChatScreen .darker .mdate {
                text-align: left;
            }

            .ChatScreen .darker .sender {
                text-align: right;
            }

        span > div.container {
            border-color: #ccc;
            color: #000;
            background-color: #ffffff;
        }


        div.container::after {
            content: "";
            clear: both;
            display: table;
        }

        .SecondUser {
            border-bottom: 2px solid #dedede;
            left: 25%;
            width: 600px;
            height: 50px;
            z-index: 6;
            text-align: center;
            font: 300;
            position: sticky;
        }

        .friendClass {
            border: 2px solid #dedede;
            background-color: #E1B3FF;
            border-radius: 18.3px;
            padding: 10px;
            margin: 10px 0;
            width: 345px;
            height: 84px;
            margin-left: 10px;
            border-color: #E1B3FF;
        }

        .friendClass2 {
            border: 2px solid #dedede;
            background-color: #E1B3FF;
            border-radius: 18.3px;
            padding: 10px;
            margin: 10px 0;
            width: 345px;
            height: 84px;
            margin-left: 10px;
            border-color: #E1B3FF;
        }

        .tbl {
            width: 200px;
            color: white;
            z-index: 3;
            background-color: #f0d9ff;
        }

        .tbl2 {
            width: 200px;
            color: white;
            z-index: 3;
        }

        .ChatText {
            -webkit-border-radius: 27px;
            border-radius: 27px;
            position: absolute;
            z-index: 8;
        }

        .headerFriendTbl {
            -webkit-border-radius: 18px;
            -moz-border-radius: 18px;
            border-radius: 18px;
            position: relative;
            top: 50px;
            width: 345px;
            height: 37px;
        }

        .headerTblFriend {
            border-top-left-radius: 18px;
            border-top-right-radius: 18px;
            z-index: 7;
            position: relative;
            background-color: #c873ff;
            width: 363px;
            height: 95px;
        }

        .MainContainer {
            background-color: #f0d9ff;
            border-bottom-left-radius: 17px;
            border-bottom-right-radius: 17px;
            z-index: 8;
            position: absolute;
            left: 400px;
            top: 800px;
            width: 1000px;
            height: 94px;
        }

        .onoffswitch {
            position: absolute;
            width: 60px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            z-index: 8;
        }

        .onoffswitch-checkbox {
            display: none;
        }

        .onoffswitch-label {
            display: block;
            overflow: hidden;
            cursor: pointer;
            height: 20px;
            padding: 0;
            line-height: 20px;
            border: 2px solid #E3E3E3;
            border-radius: 20px;
            background-color: #FFFFFF;
            transition: background-color 0.3s ease-in;
        }

            .onoffswitch-label:before {
                content: "";
                display: block;
                width: 20px;
                margin: 0px;
                background: #f0d9ff;
                position: absolute;
                top: 0;
                bottom: 0;
                right: 38px;
                border: 2px solid #E3E3E3;
                border-radius: 20px;
                transition: all 0.3s ease-in 0s;
            }

        .onoffswitch-checkbox:checked + .onoffswitch-label {
            background-color: #85FFEA;
        }

            .onoffswitch-checkbox:checked + .onoffswitch-label, .onoffswitch-checkbox:checked + .onoffswitch-label:before {
                border-color: #85FFEA;
            }

                .onoffswitch-checkbox:checked + .onoffswitch-label:before {
                    right: 0px;
                }

        body {
            padding: 0;
            margin: 0;
            background-color: #392338;
            color: #fff;
        }

            body * {
                box-sizing: border-box;
            }

        .icon {
            position: absolute;
            top: 70%;
            left: 70%;
            transform: translateX(-50%) translateY(-50%);
        }

        .hamburger {
            content: ' ';
            position: relative;
            width: 20px;
            border: 2px solid #392338;
            border-radius: 5px;
            transition: all 0.333333333333333s ease;
        }

            .hamburger:after,
            .hamburger:before {
                content: ' ';
                position: absolute;
                left: 50%;
                width: 100%;
                border: 2px solid #392338;
                border-radius: 5px;
                transform: translateX(-50%);
                transition-property: top, bottom, transform;
                transition-duration: 1s, 1s, 0.25s;
            }

            .hamburger:after {
                top: -8px;
            }

            .hamburger:before {
                bottom: -8px;
            }

        .menu {
            pointer-events: none;
        }

        .menu--circle {
            position: absolute;
            z-index: 13;
            width: 243.33333333333334px;
            height: 243.33333333333334px;
            background-color: #392338;
            overflow: hidden;
        }

        .menu__active {
            position: relative;
        }

        .menu__toggle {
            z-index: 11;
            position: absolute;
            top: -100px;
            left: -100px;
            width: 200px;
            height: 200px;
            background-color: #fff;
            border-radius: 50%;
            transition: transform 1.3s;
            cursor: pointer;
            pointer-events: auto;
        }

        .menu__listings {
            z-index: 10;
            position: absolute;
            top: -200px;
            left: -200px;
            width: 400px;
            height: 400px;
            border-radius: 50%;
            transform: scale(0.1) rotate(150deg);
            transition: transform 1s;
        }

        .menu__arrow {
            visibility: hidden;
            position: absolute;
        }

            .menu__arrow input[type="radio"] {
                position: fixed;
                top: -99999px;
                left: -99999px;
            }

            .menu__arrow ul {
                padding: 0;
                margin: 0;
                list-style: none;
            }

        .menu__arrow--top {
            top: 0.5em;
            left: 220px;
        }

            .menu__arrow--top .arrow {
                transform: rotate(-45deg);
            }

        .menu__arrow--left {
            top: 220px;
            left: 0.5em;
        }

            .menu__arrow--left .arrow {
                transform: rotate(-135deg);
            }

        .arrow {
            width: 20px;
            height: 20px;
            border-right: 6.666666666666667px solid #fff;
            border-top: 6.666666666666667px solid #fff;
            border-radius: 3px;
            transition: border-color 0.3s;
            cursor: pointer;
            pointer-events: auto;
        }

            .arrow:hover {
                border-color: #ff947f;
                transition: border-color 0.3s;
            }

        .circle {
            position: relative;
            padding: 0;
            margin: 0;
            height: 100%;
            width: 100%;
            background-color: #fff;
            border-radius: 50%;
            transform: rotate(108deg);
            overflow: hidden;
            list-style: none;
        }

            .circle li {
                position: absolute;
                top: 0;
                right: 0;
                width: 50%;
                height: 50%;
                transform-origin: 0 100%;
            }

                .circle li .placeholder {
                    position: absolute;
                    left: -100%;
                    padding-top: 1.5em;
                    width: 200%;
                    height: 200%;
                    text-align: center;
                    transform: skewY(54deg) rotate(18deg);
                }

                    .circle li .placeholder .upside {
                        transform: rotate(180deg);
                    }

                    .circle li .placeholder a {
                        text-decoration: none;
                        pointer-events: auto;
                    }

                    .circle li .placeholder button {
                        pointer-events: auto;
                    }

                    .circle li .placeholder .button {
                        font-size: 2.3em;
                        background-color: transparent;
                        border: none;
                        color: #392338;
                        cursor: pointer;
                    }

                .circle li:nth-child(1) {
                    transform: rotate(0deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(2) {
                    transform: rotate(36deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(3) {
                    transform: rotate(72deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(4) {
                    transform: rotate(108deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(5) {
                    transform: rotate(144deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(6) {
                    transform: rotate(180deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(7) {
                    transform: rotate(216deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(8) {
                    transform: rotate(252deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(9) {
                    transform: rotate(288deg) skewY(-54deg);
                    background-color: #fff;
                }

                .circle li:nth-child(10) {
                    transform: rotate(324deg) skewY(-54deg);
                    background-color: #fff;
                }

        #menu__active {
            position: fixed;
            top: -99999px;
            left: -99999px;
        }

            #menu__active:checked ~ label .menu__listings {
                transform: rotate(10deg) scale(1);
                transition: transform 1s;
            }

            #menu__active:checked ~ label .menu__toggle {
                background-color: #392338;
                transition: all 1s;
            }

            #menu__active:checked ~ label .hamburger {
                border-color: transparent;
                transition: border-color 0.333333333333333s;
            }

                #menu__active:checked ~ label .hamburger:after {
                    top: -2px;
                    border-color: #fff;
                    transform: translateX(-50%) rotate(45deg);
                    transition-property: top, transform;
                    transition-duration: 0.25s, 1s;
                }

                #menu__active:checked ~ label .hamburger:before {
                    bottom: -2px;
                    border-color: #fff;
                    transform: translateX(-50%) rotate(-45deg);
                    transition-property: bottom, transform;
                    transition-duration: 0.25s, 1s;
                }

            #menu__active:checked ~ label .button:hover {
                color: #c1264e;
            }

            #menu__active:checked ~ label .menu__arrow {
                visibility: visible;
                transition: all 1s 1.111111111111111s;
            }

            #menu__active:checked ~ label .menu__arrow--top label {
                display: none;
            }

                #menu__active:checked ~ label .menu__arrow--top label[for="degree--up-0"] {
                    display: block;
                }

            #menu__active:checked ~ label #degree--up-0:checked ~ .menu__listings {
                transform: rotate(116deg);
            }

            #menu__active:checked ~ label #degree--up-0:checked ~ .menu__arrow--top label {
                display: none;
            }

                #menu__active:checked ~ label #degree--up-0:checked ~ .menu__arrow--top label[for="degree--up-1"] {
                    display: block;
                }

            #menu__active:checked ~ label #degree--up-1:checked ~ .menu__listings {
                transform: rotate(224deg);
            }

                #menu__active:checked ~ label #degree--up-1:checked ~ .menu__listings ~ .menu__arrow--top label {
                    display: none;
                }

                    #menu__active:checked ~ label #degree--up-1:checked ~ .menu__listings ~ .menu__arrow--top label[for="degree--up-2"] {
                        display: block;
                    }



        img {
            width: 10%;
            height: 10%;
        }

        .spin {
            transform-origin: 50% 50%;
            animation: 2s rotateRight infinite linear;
        }


            .spin:hover {
                animation-name: spinn;
                #-webkit-animation-duration: 0.5s;
                #-webkit-animation-iteration-count: infinite;
                #-webkit-animation-timing-function: linear;
                #animation-name: spinn;
                #animation-duration: 4000ms;
                #animation-iteration-count: infinite;
                #-webkit-transform: rotate(360deg);
                #-moz-transform: rotate(360deg);
            }

        @keyframes spinn {
            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="chatScreen" runat="server">
    <asp:UpdatePanel ID="updatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer2" Interval="1000" OnTick="UpdateChatTable1" Enabled="false" runat="server"></asp:Timer>
            <asp:DataList ID="userChatList" runat="server" CssClass="tbl2" RepeatDirection="Vertical" Style="position: absolute; top: 30px; left: 0px; right: 688px;" RepeatLayout="Flow">
                <ItemTemplate>
                    <div class="container <%# Eval("containerStyle") %>">
                        <asp:Label class="sender" ID="SenderID" runat="server" Text='<%# Eval("sender") %>' />
                        <br />
                        <asp:Label class="content" ID="ContentID" runat="server" Text='<%# Eval("content") %>' />
                        <br />
                        <asp:Label class="mdate" ID="dateTimeID" runat="server" Text='<%# Eval("Mdate") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="Indicator" runat="server" Style="border-bottom: 2px solid #dedede; border-left: 2px solid #dedede; border-right: 2px solid #dedede; left: 250px; width: 200px; height: 50px; z-index: 7; position: sticky;"></asp:Label>
</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="searchLabel">
    <div class="MainTwoContainer" style="position: absolute; width: 250px;">
        <div class="headerTblFriend" style="left: -60px;">
            <asp:Label ID="Label1" runat="server" Style="font-size: xx-large; position: relative; left: 110px; top: 25px;" Text="Add friend"></asp:Label>
        </div>
        <div class="friendClass2" style="width: 363px; position: relative; left: -70px; top: -10px; border-top-left-radius: 0px; border-top-right-radius: 0px;">
            <asp:TextBox ID="searchT" runat="server" Style="position: relative; width: 280px; height: 70%; top: -1px; border: 0px solid;" CssClass="headerFriendTbl"></asp:TextBox>
            <asp:Button ID="searchB" runat="server" OnClick="addfriend" Style="position: relative; height: 50px; width: 50px; border: 0px solid;" CssClass="ChatText" Text="Add" />
        </div>
    </div>
    <div class="MainTwoContainer" style="position: absolute; top: 200px; width: 250px;">
        <div class="headerTblFriend" style="left: -60px;">
            <asp:Label ID="groupChatL" runat="server" Style="position: relative; top: 30px; left: 85px; font-size: xx-large;" Text="Create a group"></asp:Label>
        </div>
        <div class="friendClass2" style="width: 363px; position: relative; left: -70px; top: -10px; border-top-left-radius: 0px; border-top-right-radius: 0px;">
            <asp:TextBox ID="groupChatT" runat="server" Style="position: relative; width: 280px; height: 70%; top: -1px; border: 0px solid;" CssClass="headerFriendTbl" />
            <asp:Button ID="groupChatB" runat="server" Style="position: relative; height: 50px; width: 50px; border: 0px solid;" CssClass="ChatText" Text="Create group" OnClick="createGroup" />
            <asp:Label ID="Label2" runat="server" Style="position: relative; top: 0px;"></asp:Label>
        </div>

    </div>
    <div class="MainTwoContainer" style="position: absolute; top: 400px; width: 250px;">
        <div class="headerTblFriend" style="left: -60px;">
            <asp:Label ID="DateL" runat="server" Text="Create an event" Style="font-size: xx-large; position: relative; left: 82px; top: 30px;"></asp:Label>
        </div>
        <div class="friendClass2" style="width: 363px; position: relative; left: -70px; top: -10px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 200px;">
            <asp:Label ID="DL" runat="server" Text="Day:" Style="width: 20px;"></asp:Label>
            <asp:TextBox ID="DayT" runat="server" Style="position: relative; width: 80px; left: 35px; top: 2px;" CssClass="headerFriendTbl"></asp:TextBox>
            <br />
            <asp:Label ID="ML" runat="server" Text="Month:" Style="width: 20px;"></asp:Label>
            <asp:TextBox ID="MonthT" runat="server" CssClass="headerFriendTbl" Style="width: 80px; left: 19px; top: 5px;"></asp:TextBox>
            <br />
            <asp:Label ID="YL" runat="server" Text="Year" Style="width: 20px;"></asp:Label>
            <asp:TextBox ID="YearT" runat="server" Style="position: relative; width: 80px; left: 37px; top: 5px;" CssClass="headerFriendTbl"></asp:TextBox>
            <asp:Button ID="CalanderB" runat="server" Style="position: relative; float: right; left: -5px; top: -40px; height: 50px; width: 50px; border: 0px solid;" CssClass="ChatText" Text="Create" />
        </div>
    </div>



</asp:Content>

<asp:Content ID="Content10" runat="server" ContentPlaceHolderID="searchbar">
    <%--<div class="onoffswitch">
    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>
    <label class="onoffswitch-label" for="myonoffswitch" ></label>
    </div>--%>
    <div class="HiddenClass">
        <asp:HiddenField ID="hidden" runat="server" />
    </div>
    <div class="headerTblFriend">
        <asp:Button ID="displaybutton" runat="server" OnClick="displaybutton_Click" CssClass="ChatText" />
        <asp:TextBox ID="searchF" runat="server" CssClass="headerFriendTbl" OnTextChanged="searchF_TextChanged"></asp:TextBox>
    </div>
</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="friends">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Timer Interval="1000" Enabled="true" OnTick="updateTable" runat="server" ID="Timer1"></asp:Timer>
            <asp:DataList ID="friendsList" RepeatDirection="Vertical" runat="server"
                Style="position: relative; width: 363px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;" OnItemCommand="friendsList_ItemCommand" CssClass="tbl">
                <ItemTemplate>
                    <div class="friendClass" onclick="getFriend('<%# Eval("user_name")%>')">
                        <asp:Label ID="friendID" runat="server" CssClass="derivativeFriendClass" Text='<%# Eval("user_name")%>'></asp:Label>

                        <asp:Button ID="ChatButton" runat="server" Style="left: 90px; width: 250px; height: 50px; font-size: x-large; background-color: transparent; border: 1px solid; border-color: white;" CssClass="ChatText" Text="Chat" OnClick="ChooseSecondUser" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="CreateEvent">
    <asp:Label ID="l1" runat="server" Text="Event name" Style="position: absolute; left: 200px; top: 400px;"></asp:Label>
    <asp:TextBox ID="eveName" runat="server" Style="position: absolute; left: 200px; top: 450px;"></asp:TextBox>
    <asp:Calendar ID="calendar" runat="server" Style="left: 150px; top: 500px; position: absolute; width: 200px; height: 250px;" OnSelectionChanged="calendar_SelectionChanged"></asp:Calendar>
</asp:Content>

<asp:Content ID="Content8" runat="server" ContentPlaceHolderID="messageBar">
    <div class="MainContainer">
        <div class="ChatText">
            <asp:TextBox ID="userMessage" runat="server" Style="top: 8px; margin-left: 19px; height: 54px; width: 961px; border: 0px solid;" CssClass="ChatText"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="SendMessageUser" Style="position: absolute; left: 927px; z-index: 9; height: 54px; width: 54px; border-radius: 50%; top: 8px; border: 0px solid;" CssClass="ChatText" Text="Send" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content11" runat="server" ContentPlaceHolderID="TopBar">
    <div class="topBar">
        <asp:Image runat="server" ID="profilepic" CssClass="Pimg" ImageUrl="~/photos/group_icon.png" />
        <asp:Label runat="server" ID="name" style="position:relative; margin-left:10px; left:50px; top:-30px; font-size:50px;"></asp:Label>
        <div class="digital-clock" style="position:relative; left:500px; top:-85px; font-size: 50px;">00:00:00</div>
        <asp:Label runat="server" ID="date"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content9" runat="server" ContentPlaceHolderID="scripts">
    <script type="text/javascript">
        var username = window.location.href.slice(window.location.href.indexOf('=') + 1).split('%60');
        var password = window.location.href.slice(window.location.href.indexOf('&') + 10).split('%60');
        var url1 = "Home.aspx?username=" + username[0] + "`&password=" + password[0] + "`";
        var EndUser = "";
        function ChatLink() {
            alert(url);
        }
        function getFriend(username) {
            EndUser = username;
            alert(EndUser);

            //alert($(".HiddenClass").val());
            //$('#hidden').val(EndUser);
            //alert($('#hidden').val());
            //$("#ChatButton").click();
        }
        function clockUpdate() {
            var date = new Date();
            $('.digital-clock').css({ 'color': '#fff', 'text-shadow': '0 0 6px #ff0' });
            function addZero(x) {
                if (x < 10) {
                    return x = '0' + x;
                } else {
                    return x;
                }
            }

            function twelveHour(x) {
                if (x > 12) {
                    return x = x - 12;
                } else if (x == 0) {
                    return x = 12;
                } else {
                    return x;
                }
            }

            var h = addZero(twelveHour(date.getHours()));
            var m = addZero(date.getMinutes());
            var s = addZero(date.getSeconds());

            $('.digital-clock').text(h + ':' + m + ':' + s)
        }
        function setDisplay() {
            $(".onoffswitch").click(function () {

            })
        }
        $(document).ready(function () {
            $(".Home").click(function () {
                ChatLink();
                $(".Home").attr("href", url);
            });
            $(".friendClass").click(function () {
                getFriend();
            });
            clockUpdate();
            setInterval(clockUpdate, 1000);
        });
    </script>
</asp:Content>
