﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>主页</title>
        <style type="text/css">
        .entrance{
            font-size: 12pt;
        }
            .entrance:hover{

                /*background-color: red;*/
                color: red;

            }
        </style>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 数据库连接 -->
        <%
            Function ReadFromTextFile (FileUrl,CharSet)
                dim str
                set stm=server.CreateObject("adodb.stream")
                stm.Type=2
                stm.mode=3 
                stm.charset=CharSet
                stm.open
                stm.loadfromfile server.MapPath(FileUrl)
                str=stm.readtext
                stm.Close
                set stm=nothing
                ReadFromTextFile=str
            End Function
            strconnection=ReadFromTextFile("other/odbc.ini","utf-8")
            set conn = server.createobject("adodb.connection") 
            conn.open strconnection
        %>

        <!-- 加载函数 -->
        <%
            Function GetUrl() 
            On Error Resume Next 
            Dim strTemp 
            If LCase(Request.ServerVariables("HTTPS")) = "off" Then 
             strTemp = "http://"
            Else 
             strTemp = "https://"
            End If 
            strTemp = strTemp & Request.ServerVariables("SERVER_NAME") 
            If Request.ServerVariables("SERVER_PORT") <> 80 Then 
             strTemp = strTemp & ":" & Request.ServerVariables("SERVER_PORT") 
            end if
            strTemp = strTemp & Request.ServerVariables("URL") 
            If Trim(Request.QueryString) <> "" Then 
             strTemp = strTemp & "?" & Trim(Request.QueryString) 
            end if
            GetUrl = strTemp 
            End Function
            url=GetUrl()
            sub load_element(span,name,price,pic_src1,pic_src2,gid)
                response.write "<div class='col-md-12'><div class='all-pros all-pros-6 animated fadeInUp'><div class='single_product_3 '><span>"&span&"</span></div><div class='sinle_pic'><a href='#'><img class='primary-img' src='"&pic_src1&"' alt='图片加载错误'/><img class='secondary-img' src='"&pic_src2&"' alt='图片加载错误'/></a></div><div class='product-action' data-toggle='modal' data-target='#myModal'><a href='detail.asp?gid="&gid&"'><button type='button' class='btn btn-info btn-lg quickview' data-toggle='tooltip' title='Quickview'>详情</button></a>   </div><div class='product_content'><div class='usal_pro'><div class='product_name_2'><h2><a href='#'>"&name&"</a></h2></div><div class='product_price'><div class='price_rating'><a href='#'><i class='fa fa-star'></i></a><a href='#'><i class='fa fa-star'></i></a><a href='#'><i class='fa fa-star'></i></a><a href='#'><i class='fa fa-star'></i></a><a class='not-rated' href='#'><i class='fa fa-star-o' aria-hidden='true'></i></a></div></div><div class='price_box'><span class='spical-price'>￥"&price&"</span></div><div class='last_button_area'><ul class='add-to-links clearfix'><li class='addwishlist'><div class='yith-wcwl-add-button show' ><a class='add_to_wishlist' href='add_collection.asp?href="&url&"&gid="&gid&"' rel='nofollow' data-product-id='45' data-product-type='external' data-toggle='tooltip' title='' data-original-title='添加收藏'><i class='fa fa-heart'></i></a></div></li><li><div class='new_act'><a class='button_act' data-quick-id='45' href='add_cart.asp?href="&url&"&gid="&gid&"' title='' data-toggle='tooltip' data-original-title='不买要涨价'>加入购物车</a></div></li>   </ul></div></div></div></div></div>"
            end sub
        %>
        <%
            if request.QueryString("logout")="True" then
                Session("user")=""
                Session("pass")=""
            end if
        %>
        <!-- all css here -->
        <!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- jquery-ui.min css -->
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <!-- meanmenu css -->
        <link rel="stylesheet" href="css/meanmenu.min.css">
        <!-- nivo slider css -->
        <link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
        <link rel="stylesheet" href="lib/css/preview.css" type="text/css" />
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <!-- font-awesome css -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="style.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
        <style type="text/css">
           /* .col-md-9 col-sm-9{
                background-color: red;
                width: 100%;
            }*/
           /* *{
                margin:0;
                padding:0;
            }
            .container .row{
                width:100%;
            }

            .container .col-md-9 col-sm-9{
                width: 100%;
            }*/
        </style>

        
    </head>
    <body>
        

        <!--header top area start-->
        <div class="header_area">
            <div class="header_border">

                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                            <div class="header_heaft_area">
                                 <h4 style="margin-top: 15px; font-family: 楷书;">
        <%response.write "当前用户:" & Session("user")%>
        </h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                            <div class="header_right_area">
                                <ul>
                                    <li>
                                        <a class="account" id="mylogin" data-toggle="modal" data-target="#myModal" style="cursor: pointer;">
                                        <%
                                            if Session("user")="" and Session("pass")="" then
                                                Response.Cookies("whetherlogin")="False"
                                                
                                            else
                                                Response.Cookies("whetherlogin")="True"
                                            end if
                                        %>
                                        </a>
                                    </li>
                                    <script>
                                        function getCookie(c_name)
                                        {
                                        if (document.cookie.length>0)
                                          {
                                          c_start=document.cookie.indexOf(c_name + "=")
                                          if (c_start!=-1)
                                            { 
                                            c_start=c_start + c_name.length+1 
                                            c_end=document.cookie.indexOf(";",c_start)
                                            if (c_end==-1) c_end=document.cookie.length
                                            return unescape(document.cookie.substring(c_start,c_end))
                                            } 
                                          }
                                        return ""
                                        }
                                        var jud=getCookie("whetherlogin")
                                        if(jud=="True")
                                        {
                                            $("#mylogin").html("退出登录")
                                            $("#mylogin").removeAttr("data-target")
                                            $("#mylogin").attr("href","index.asp?logout=True")
                                        }
                                        else
                                        {
                                            $("#mylogin").html("登录/注册")
                                        }
                                    </script>
                                    <li>
                                        <a class="wishlist" href="order.asp">我的订单</a>
                                    </li>
                                    <li>
                                        <a class="Shopping cart" href="cart.asp">购物车</a>
                                    </li>
                                   
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--header top area end-->
            <!--header middle area start-->
            <div class="header_middle">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="logo_area">
                                <a href="index.asp"><img src="img/logo-pic/logo.jpg" alt="" /></a>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="header_all search_box_area">
                                <form class="new_search" role="search" method="get" action="search.asp">
                                    <input id="mix_search" class="search-field" placeholder="查找商品" value="" name="s" title="Search for:" type="search">
                                    <input value="Search" type="submit">
                                    <input name="post_type" value="product" type="hidden">
                                </form>
                            </div>
                            <div class="header_all shopping_cart_area">
                                <div class="widget_shopping_cart_content">
                                    <div class="topcart">
                                        <a class="cart-toggler" href="">
                                            <i class="icon"></i>
                                            <span class="my-cart">购物车</span>
                                            
                                            <span class="fa fa-angle-down"></span>
                                        </a>
                                        <div class="new_cart_section">
                                            <ol class="new-list">
                                            
                                                <%
                                                function load_li(img_route,name,price,amount)

                                                    response.write "<li class='wimix_area'><a class='pix_product' href=''><img alt='' src='"&img_route&"'></a><div class='product-details'><a href='#'>"&name&"</a><span class='sig-price'>"&amount&"×￥"&price&"</span></div><div class='cart-remove'><a class='action' href='#'><i class='fa fa-close'></i></a></div></li>"
                                                end function
                                                    
                                                    sql="select * from user where uid='"&Session("user")&"'and password='"&Session("pass")&"'"
                                                    set rs=conn.execute(sql)
                                                    if rs.bof then
                                                        rs.close
                                                        set rs=nothing
                                                    else
                                                    
                                                        set rs=nothing
                                                        sql2="select goods.name,goods.price,goods.pic_route,cart.uid,cart.gid,cart.amount from goods,cart where goods.gid=cart.gid and cart.uid='"&Session("user")&"'"
                                                        alltotal=0
                                                        set rs=conn.execute(sql2)
                                                        if not rs.bof then
                                                            do while not rs.eof
                                                                call load_li(rs("pic_route"),rs("name"),rs("price"),rs("amount"))
                                                                alltotal=alltotal+rs("price")*rs("amount")
                                                                rs.movenext
                                                            loop
                                                        end if
                                                    end if
                                                    

                                                %>
                                               <script type="text/javascript">
                                               function getCookie(cname) {
                                                    var name = cname + "=";
                                                    var ca = document.cookie.split(';');
                                                    for(var i=0; i<ca.length; i++) {
                                                        var c = ca[i];
                                                        while (c.charAt(0)==' ') c = c.substring(1);
                                                        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
                                                    }
                                                    return "";
                                                }
                                                    $(".new_act").click(function(){
                                                        alert(111)
                                                        if(getCookie("whetherlogin")=="False")
                                                            alert("未登录")
                                                    });
                                               </script>
                                            </ol>
                                            <div class="top-subtotal">
                                                总价: <span class="sig-price">￥<%=alltotal%></span>
                                            </div>
                                            <div class="cart-button">
                                                <ul>
                                                    <li>
                                                        <a href="cart.asp">浏览购物车 <i class="fa fa-angle-right"></i></a>
                                                    </li>
                                                    <!-- <li>
                                                        <a href="#">结算 <i class="fa fa-angle-right"></i></a>
                                                    </li> -->
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--header footer area start-->
            <div class="all_menu_area">
                <div class="menu_inner">
                    <div class="container">
                        <div class="full_menu clearfix">
                            <div class="new_menu">
                                <div class="drp-menu">
                                    <div class="col-md-3 pr pl">
                                        <div class="all_catagories">
                                            <div class="enable_catagories">
                                                <i class="fa fa-bars"></i>
                                                <span>所有种类</span>
                                                <i class="fa fa-angle-down"></i>
                                            </div>
                                        </div>
                                        <div class="catagory_menu_area">
                                            <div class="catagory_mega_menu">
                                                <div class="cat_mega_start">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--menu area start-->
                                    <div class="col-md-9 pl">
                                        <div class="menu_area">
                                            <div class="menu">
                                                <nav>
                                                    <ul>
                                                        <li><a href="index.asp">主页</a></li>
														<li><a href="about-us.asp">关于</a></li>
														<li><a href="cart.asp">购物车</a></li>
														<li><a href="collection.asp">收藏</a></li>
														<li><a href="order.asp">订单</a></li>
														<li><a href="contact-us.asp">联系我们</a></li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- mobile-menu-area-start -->
      <!--   <div class="mobile-menu-area hidden-md hidden-lg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="mobile-menu">
                            <nav id="mobile-menu-active">
                                <ul id="nav">
                                    <li><a href="index.asp">主页</a></li>
									<li><a href="about-us.asp">关于</a></li>
									<li><a href="cart.asp">购物车</a></li>
									<li><a href="list-view.html">我的收藏</a></li>
									<li><a href="my.account.asp">Account</a></li>
									<li><a href="simple-product.html">Product</a></li>
									<li><a href="contact-us.html">联系我们</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- mobile-menu-area-end -->
        <!--slider area start-->
        <section class="slider-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="bend niceties preview-2">
                            <div id="ensign-nivoslider" class="slides">
                                <img src="img/slider/slider1_1-1.jpg" alt="" title="#slider-caption-1" />
                                <img src="img/slider/slider1_2.png" alt="" title="#slider-caption-2" />
                            </div>
                            <!-- direction 1 -->
                            <div id="slider-caption-1" class="t-cn slider-direction slider-one">
                                <div class="slider-progress"></div>
                                <div class="tld-f1">
                                    <div class="layer-1-1 animated fadeInDown">
                                        <h1> ￥320.00</h1>
                                    </div>
                                    <div class="layer-1-2 animated flipInX">
                                        <h2>￥245.00</h2>
                                    </div>
                                    <div class="layer-1-3 animated rotateInUpLeft">
                                        <h1>NOKIA E600</h1>
                                    </div>
                                    <div class="layer-1-4  animated rotateInUpLeft">
                                        <h3>SALE UO TO 30%</h3>
                                    </div>
                                    <div class="layer-1-5 animated rotateInUpLeft">
                                        <a href="#">Shopping Now</a>
                                    </div>
                                </div>
                                <div class="tld-f2">
                                    <div class="layer-1-6 animated zoomIn">
                                        <img src="img/slider/slider_8.png" alt="">
                                    </div>
                                </div>
                            </div>
                            <!-- direction 2 -->
                            <div id="slider-caption-2" class="slider-direction slider-two">
                                <div class="slider-progress"></div>
                                <div class="sld-fl">
                                    <div class="layer-2-1 animated fadeInLeftBig">
                                        <h1> ￥320.00</h1>
                                    </div>
                                    <div class="layer-2-2 animated slideInLeft">
                                        <h2>￥245.00</h2>
                                    </div>
                                    <div class="layer-2-3 animated slideInLeft">
                                        <h1>MEN'S </h1>
                                    </div>
                                    <div class="layer-2-4 animated slideInLeft">
                                        <h3>SALE UO TO 30%</h3>
                                    </div>
                                    <div class="layer-2-5 animated bounceInUp">
                                        <a href="#">Shopping Now</a>
                                    </div>
                                </div>
                                <div class="sld-fr">
                                    <!-- <div class="layer-2-6 animated zoomIn">
                                        <img src="img/slider/slider-9.png" alt="">
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--slider area end-->

        <!--social design arae start-->
        <div class="link_area">
            <div class="container">
                <div class="row">
                    <div class="social_design on_right">
                        <ul>
                            <li>
                                <a class="facebook" target="_blank" href="#facebook">
                                    <span>
                                        <i class="fa fa-facebook"></i>
                                        <span class="social-text">分享到QQ</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="twitter" target="_blank" href="#twitter.com">
                                    <span>
                                        <i class="fa fa-twitter"></i>
                                        <span class="social-text">分享到微信</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="youtube" target="_blank" href="#youtube">
                                    <span>
                                        <i class="fa fa-youtube"></i>
                                        <span class="social-text">复制链接</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="mail-to" target="_blank" href="mailto:lionthemes88@gmail.com">
                                    <span>
                                        <i class="fa fa-envelope-o"></i>
                                        <span class="social-text">联系我们</span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--social design arae end-->

        <!--product area start-->
        <section class="product_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-sm-9" style="width: 100%">
                        <div class="all_product animated fadeInUp">
                            <div class="new_product">
                                <div class="product_heading">
                                    <i class="fa fa-play-circle"></i>
                                    <span>最新上架</span>
                                </div>
                            </div>
                            <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 text-right">
                        <div class="my-tabs">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="home">
                                    <div class="row">
                                        <div class="feature-carousel indicator-brand-3">
                                            <%
                                            sql="select * from goods order by included_date desc"
                                            set rs=conn.execute(sql)
                                            if not rs.bof then
                                                count=0
                                                do while not rs.eof and count<=4
                                                    call load_element("new",rs("name"),rs("price"),rs("pic_route"),rs("pic_route2"),rs("gid"))
                                                    rs.movenext
                                                    count=count+1
                                                loop
                                                
                                            end if
                                            rs.close
                                            set rs=nothing
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="profile">
                                    <div class="row">
                                        <div class="feature-carousel indicator-brand-3">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="messages">
                                    <div class="row">
                                        <div class="feature-carousel indicator-brand-3">
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--product area end-->

        <!--plus area start-->
        <div class="plus_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="plus_pic">
                            <div class="pix_new">
                                <a href="#">
                                <img src="img/differ-pic/differ_pic_4.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="plus_pic">
                            <div class="pix_new">
                                <a class="#" href="#">
                                <img src="img/differ-pic/differ_pic_7.jpg" alt="" >
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--plus area end-->

        <!--product catagory area start-->
        <div class="catagory_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="visible_product">
                            <div class="new_product">
                                <div class="product_heading">
                                    <i class="fa fa-star"></i>
                                    <span>手机</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                                <div class="whole_product indicator-brand">
                                    
                                    <div class="col-md-12" style="cursor: pointer;">
                                        <div class="all-pros animated fadeInUp">
                                            <div class="single_product">
                                                <span>New</span>
                                            </div>
                                            <div class="sinle_pic">
                                                <a href="goods.asp?type=学生党">
                                                    <img class="primary-img" src="img/newimage/S1.jpg" style="height: 281px" alt="" />
                                                    <img class="secondary-img" src="img/newimage/SR15.jpg" alt="" />
                                                </a>
                                            </div>
                                            
                                            <div class="product_content">
                                                <div class="usal_pro">

                                                    <div class="product_name_2">
                                                        <h2>
                                                            <h3><b><i>青春派</i></b></h3>
                                                        </h2>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12" style="cursor: pointer;">
                                        <div class="all-pros animated fadeInUp">
                                            <div class="single_product">
                                                <span>New</span>
                                            </div>
                                            <div class="sinle_pic">
                                                <a href="goods.asp?type=商务机">
                                                    <img class="primary-img" src="img/newimage/B2.jpg" style="height: 281px" alt="" />
                                                    <img class="secondary-img" src="img/newimage/SP9.jpg" alt="" />
                                                </a>
                                            </div>
                                            
                                            <div class="product_content">
                                                <div class="usal_pro">

                                                    <div class="product_name_2">
                                                        <h2>
                                                            <h3><b><i>商务精英</i></b></h3>
                                                        </h2>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12" style="cursor: pointer;">
                                        <div class="all-pros animated fadeInUp">
                                            <div class="single_product">
                                                <span>New</span>
                                            </div>
                                            <div class="sinle_pic">
                                                <a href="goods.asp?type=老年机">
                                                    <img class="primary-img" src="img/newimage/OLD1.jpg" style="height: 281px" alt="" />
                                                    <img class="secondary-img" src="img/newimage/OLD2.jpg" alt="" />
                                                </a>
                                            </div>
                                            
                                            <div class="product_content">
                                                <div class="usal_pro">

                                                    <div class="product_name_2">
                                                        <h2>
                                                            <h3><b><i>老年时尚</i></b></h3>
                                                        </h2>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    
                                    
                                    
                                    
                                </div>
                            </div>
              
            </div>
        </div>
        <!--catagory area end-->

        <!--differ pic area start-->
        <div class="differ_pic">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="plus_pic">
                            <div class="pix_new">
                                <a href="#">
                                <img src="img/differ-pic/differ_pic_1.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="plus_pic">
                            <div class="pix_new">
                                <a href="#">
                                <img src="img/differ-pic/differ_pic_2.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="plus_pic">
                            <div class="pix_new">
                                <a href="#">
                                <img src="img/differ-pic/differ_pic_3.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <!--lumia area start-->
        <div class="lumia_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="plus_pic">
                            <div class="pix_new">
                                <a href="#">
                                <img src="img/differ-pic/differ_pic_6.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--lumia area end-->
      
        <!--footer top area start-->
        <div class="footer_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer_menu">
                            <div class="news_heading_2">
                                <h3>Information </h3>
                            </div>
                            <div class="footer_menu">
                                <ul>
                                    <li>
                                        <a href="#">our blog</a>
                                    </li>
                                    <li>
                                        <a href="#">about our shop</a>
                                    </li>
                                    <li>
                                        <a href="#">secure shopping</a>
                                    </li>
                                    <li>
                                        <a href="#">privecy policy</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="footer_menu">
                            <div class="news_heading_2">
                                <h3>My Account </h3>
                            </div>
                            <div class="footer_menu">
                                <ul>
                                    <li>
                                        <a href="#">My Account</a>
                                    </li>
                                    <li>
                                        <a href="#">Wishlist</a>
                                    </li>
                                    <li>
                                        <a href="#">Shopping Cart</a>
                                    </li>
                                    <li>
                                        <a href="#">Checkout</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="footer_menu">
                            <div class="news_heading_2">
                                <h3> Our Services </h3>
                            </div>
                            <div class="footer_menu">
                                <ul>
                                    <li>
                                        <a href="#">Shipping & Returns</a>
                                    </li>
                                    <li>
                                        <a href="#">Secure Shopping</a>
                                    </li>
                                    <li>
                                        <a href="#">International Shipping</a>
                                    </li>
                                    <li>
                                        <a href="#">Affiliates</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="footer_menu footer_menu_2">
                            <div class="news_heading_2">
                                <h3> Store Information </h3>
                            </div>
                            <ul>
                                <li>
                                    <i class="fa fa-home"></i>
                                    <p>My Company : 42 avenue des Champs Elysées 75000  France</p>
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <p>Phone: (0123) 456789</p>
                                </li>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <p>Email: admin@hastech.company</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--footer top area end-->
            <!--footer middle area start-->
            <div class="footer_middle">
                <div class="container">
                    <div class="fotter_inner">
                        <div class="middele_pic">
                            <img src="img/icon/payment-300x30.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--footer middle area end-->
        <!--footer bottom area start-->
        <div class="footer-bottom">
            <div class="container">
                <div class="widget-copyright text-center">
                   <!--  Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
                   版权所有：金氏文化软件传媒集团
                </div>
            </div>
        </div>
        <!--footer bottom area end-->
        <!--modal content start-->
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">

            <div class="modal-dialog modal-dialog-2">
                <!-- Modal content-->
                <div class="modal-content" style="background-image: url(img/newimage/register.jpg);background-size: 80% 55%;background-attachment: fixed; background-repeat: no-repeat;">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body" style="width: 300px;height: 200px;">
                        
                        <div class="modal-product" style="cursor: pointer;" >
                            <div class="userentrance" style="border:1px solid;border-radius:5px;width: 100px;height:40px;text-align: center;margin-left:270px;margin-top: 0px;line-height: 40px;" ><a href="login.asp">用户登陆</a></div>
                            <div class="superentrance" style="border:1px solid;border-radius:5px;width: 100px;height:40px;text-align: center;margin-left:380px;margin-top: -40px;line-height: 40px;"><a href="http://127.0.0.1:8080/admin">管理员登陆</a></div>
                        </div>
                    </div>
                    <!-- <img src="img/newimage/register.jpg" style="width: 600px;height: 200px;"> -->
                </div>
            </div>
        </div>
        <!--modal content end-->
		
		
		
		
		
		
        <!-- all js here -->
        <!-- jquery latest version -->
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- nivo slider js -->
        <script src="lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="lib/home.js" type="text/javascript"></script>
        <!-- owl.carousel js -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="js/jquery.meanmenu.js"></script>
        <!-- jquery-ui js -->
        <script src="js/jquery-ui.min.js"></script>
        <!-- easing js -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- mixitup js -->
        <script src="js/jquery.mixitup.min.js"></script>
        <!-- jquery.countdown js -->
        <script src="js/jquery.countdown.min.js"></script>
        <!-- wow js -->
        <script src="js/wow.min.js"></script>
        <!-- popup js -->
        <script src="js/jquery.magnific-popup.min.js"></script> 
        <!-- plugins js -->
        <script src="js/plugins.js"></script>
        <!-- main js -->
        <script src="js/main.js"></script>
    </body>
    <%
        conn.close
        set conn=nothing
    %>
</html>


