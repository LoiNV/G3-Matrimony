<%-- 
    Document   : search-listing
    Created on : Dec 4, 2015, 3:14:40 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Search Page </title>

        <%@include file="importCSS.jsp" %>
    </head>
    <body>
        <div class="inner page boxed-style">
            <%@include file="header.jsp" %>
            <!-- BREADCRUMBS SECTION
            ================================================ -->
            <section>
                <div id="breadcrumbs-wrapp">
                    <div class="row">
                        <div class="nine columns">
                            <ul class="breadcrumbs hide-for-small">
                                <li><a href="index.jsp">Home</a></li>
                                <li class="current"><a href="#">Search result page</a></li>
                            </ul>
                        </div>

                    </div><!--end row-->
                </div><!--end breadcrumbs-wrapp-->
            </section>
            <!--END BREADCRUMBS SECTION-->





            <!-- SEARCH BAR SECTION
            ================================================ -->
            <section>
                <!--Search bar-->
                <div id="search-bar">
                    <div class="row">
                        <form action="UsersFindServlet" method="post" class="twelve columns custom">
                            <div class="row">
                                <div class="two columns">
                                    <label class="inline">Meet people:</label>
                                </div>

                                <div class="two columns">
                                    <input type="text" name="name" placeholder="name" />
                                </div>

                                <div class="three columns">
                                    <select class="expand" name="gender">
                                        <option selected="selected" value="false">Woman</option>
                                        <option value="true">Man</option>
                                    </select>
                                </div>

                                <div class="two columns">
                                    <select class="expand" name="age1">
                                        <option value="18" selected="selected" >18</option>
                                        <c:forEach begin="19" end="60" var="age">
                                            <option value="${age}">${age}</option>
                                        </c:forEach>                                        
                                    </select>
                                </div>
                                <div class="two columns">
                                    <select class="expand" name="age2">
                                        <option value="25" selected="selected">25</option>
                                        <c:forEach begin="18" end="60" var="age">
                                            <option value="${age}">${age}</option>
                                        </c:forEach>   
                                    </select>
                                </div>

                                <div class="two columns">
                                    <input type="text" name="city" placeholder="city" />
                                </div>

                                <div class="two columns">
                                    <input type="text" name="country" placeholder="country" />
                                </div>

                                <div class="four columns">
                                    <input value="Search" type="submit" class="small button radius right" style="float: left; margin: 3px;"/>
                                </div>
                            </div><!--end row-->
                        </form>
                    </div><!--end row-->
                </div><!--end Search bar-->
            </section>
            <!--END SEARCH BAR SECTION-->

            <!-- MAIN SECTION
            ================================================ -->
            <section>
                <div id="main" class="search-result text-center">
                    <div class="row">
                        <div class="twelve columns">
                            <h2>Search profile <span class="pink-text">results</span></h2>
                            <c:if test="${listResult !=null}">
                                <p class="lead">Your search returns (${(pageCurrent-1)*9}-
                                    <c:choose>
                                        <c:when test="${pageCurrent*9 < ListSearch.size()}">
                                            ${pageCurrent*9}
                                        </c:when>
                                        <c:otherwise>
                                            ${ListSearch.size()}
                                        </c:otherwise>
                                    </c:choose>
                                    )/ ${ListSearch.size()} matches:
                                </p>

                                <!--Search List-->
                                <div class=" twelve columns search-list">                                
                                    <c:forEach items="${listResult}" var="p">
                                        <div class="four columns">
                                            <div class="search-item">
                                                <div class="avatar">
                                                    <img style="width: 100%; height: 100%;" src="${p.avatar}" alt="Avatar">
                                                </div>
                                                <div class="search-meta">
                                                    <h5 class="author"><a href="#">${p.name}</a></h5>
                                                    <p class="date">${p.age} | ${p.maritalStatus} | ${p.city}, ${p.country}</p>
                                                </div>
                                                <div class="search-body">
                                                    <p>${p.description}</p>
                                                </div>
                                                <a href="Profile?uri=Profile?id=${p.id}&id=${p.id}" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a>&nbsp;&nbsp;&nbsp;
                                                <c:if test="${p.status != 3 && sessionScope.timeActive >0}"> 
                                                    <a href="#" id="${p.id}" class="addFriend small button radius secondary"><i class="icon-angle-right"></i> Add Friend</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="pager twelve columns" style="margin-top: 20px">
                                        <ul> 
                                            <li><a href="ResultSearch?page=1"><<</a></li>
                                                <c:forEach begin="1" end="${pageCount+1}" var="i">
                                                <li><a href="ResultSearch?page=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li><a href="ResultSearch?page=${pageCount+1}">>></a></li>
                                        </ul>
                                    </div>
                                </c:if>



                                <!--end row-->
                                <!--end  Pagination-->

                            </div><!--end twelve-->
                        </div><!--end row-->
                    </div><!--end #main-->
            </section>
            <!--END MAIN SECTION-->

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
