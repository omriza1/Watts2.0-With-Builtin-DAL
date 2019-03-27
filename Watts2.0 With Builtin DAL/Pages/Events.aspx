<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Events.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Watts2._0_With_Builtin_DAL.Pages.Events1" %>

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
                                <a href="#" class="button">2<i class="fa fa-user"></i></a>
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

<asp:Content ID="Content3" ContentPlaceHolderID="EventList" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Timer Interval="60000" Enabled="true" OnTick="UpdateEvents" runat="server" ID="Timer1"></asp:Timer>
            <asp:DataList ID="EventList" RepeatDirection="Horizontal" runat="server"
                Style="position: absolute; top: 100px; left: 300px; width:500px; height:500px;">
                <HeaderTemplate>Events</HeaderTemplate>
                <ItemTemplate>
                    <div class="eventContainer">
                        <div class="EventHeader">
                             <asp:Label ID="EventName" runat="server" style="font-size:xx-large; position:relative; left:60px; top:20px;"  Text='<%# Eval("EventName") %>' />
                        </div>
                        <br />
                        <div class="EventFooter">
                             <asp:Label ID="EventDate" runat="server" Text='<%# Eval("EventDate") %>' />
                        <br />
                             <asp:Label ID="EventTime" runat="server" Text='<%# Eval("EventTime") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="Style" runat="server">
    <style type="text/css">
        .EventHeader{
            border-top-left-radius: 18px;
            border-top-right-radius: 18px;
            z-index: 7;
            position: relative;
            background-color: #c873ff;
            width: 363px;
            height: 95px;
        }
        .EventFooter{
            border: 2px solid #dedede;
            background-color: #E1B3FF;
            border-radius: 18.3px;
            padding: 10px;
            margin: 10px 0;
            width: 345px;
            height: 84px;
            margin-left: 10px;
            border-color: #E1B3FF;
            top:-10px;
            position:relative;
        }
        .eventContainer{
            background-color: #f0d9ff;
            border-radius:17px;
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