
<%@page import="model.Users"%>
<%@page import="check.CheckFriend"%>
<%@page import="model.Friends"%>
<%@page import="java.util.List"%>

<%
    if (request.getAttribute("listFriends") == null) {
        Users user = (Users) request.getSession().getAttribute("infouser");
        List<Friends> listF = CheckFriend.getUserFriend(user.getId());

        request.setAttribute("listFriends", listF);
        request.setAttribute("username", user.getName());
    }

%>
<div class="chat_box">
    <div class="chat_head"> Friends </div>
    <div class="chat_body">

        <c:forEach items="${requestScope.listFriends}" var="f">
            <c:choose>
                <c:when test="${f.userId2.name eq requestScope.username}">
                    <div id="${f.namespace}" class="user" ><span class="mnrChat"></span> ${f.userId1.name}</div>
                </c:when>
                <c:otherwise>
                    <div id="${f.namespace}" class="user" ><span class="mnrChat"></span> ${f.userId2.name}</div>                        
                </c:otherwise>
            </c:choose>            
        </c:forEach>
    </div>
</div>


