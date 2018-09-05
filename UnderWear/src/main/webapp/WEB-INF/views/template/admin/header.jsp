<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/resource/default.html">UnderWear 관리자 페이지</a>
            </div>
        
        

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="/"> Main Page</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 회원 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/admin/member/memberList.do">회원 정보</a>
                                </li>
                                <li>
                                    <a href="morris.html">등급 정보</a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> 상품 관리</a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">상품 정보</a>
                                </li>
                                <li>
                                    <a href="morris.html">상품 등록</a>
                                </li>
                                  <li>
                                    <a href="morris.html">상품 분류</a>
                                </li>
                                 <li>
                                    <a href="morris.html">재고 관리</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 게시판 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">게시판 관리</a>
                                </li>
                                <li>
                                    <a href="/admin/qna/qnaList.do">관리자 문의 게시판 관리</a>
                                </li>
                                <li>
                                    <a href="/admin/notice/noticeList.do">관리자 Notice 관리</a>
                                </li>  
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                      
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/admin/order/orderList.do">주문관리</a>
                                </li>
                                <li>
                                    <a href="/admin/sale/saleList.do">판매관리</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>