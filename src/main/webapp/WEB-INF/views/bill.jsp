<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
       pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="/WEB-INF/views/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<meta charset="ISO-8859-1">
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<title>Admin view Page</title>
<style type="text/css">
.error {
       color: red;
}
</style>

<style>
#sub-left {
       float: left;
}

#sub-right {
       float: right;
       position: absolute;
       width: 300px;
       height: 100px;
       z-index: 15;
       top: 20%;
       left: 50%;
       margin: -100px 0 0 -150px;
       width: 50%;
}

.myTable {
       margin-top: 200px;
}
</style>
<script>
       function onRowClick() {
             var table = document.getElementById("hoteltable");
             var rows = table.getElementsByTagName("tr");
             for (i = 0; i < rows.length; i++) {
                    var currentRow = table.rows[i];
                    var createClickHandler = function(row) {
                           return function() {
                                 document.getElementById("hId").value = row
                                               .getElementsByTagName("td")[0].innerHTML;
                                 document.getElementById("hName").value = row
                                               .getElementsByTagName("td")[1].innerHTML;
                                 document.getElementById("hArea").value = row
                                               .getElementsByTagName("td")[2].innerHTML;
                                 document.getElementById("hNumOfRooms").value = row
                                               .getElementsByTagName("td")[3].innerHTML;
                                 document.getElementById("hImgUrl").value = row
                                               .getElementsByTagName("td")[4].innerHTML;
                           };
                    };
                    currentRow.onclick = createClickHandler(currentRow);
                    hideButton();
                    showDelete();
                    showEdit();
             }

       }

       function showDelete() {
             var x = document.getElementById("btn3");
             x.style.display = "block";

       }

       function showEdit() {
             var x = document.getElementById("btn2");
             x.style.display = "block";

       }

       function hideButton() {
             var x = document.getElementById("btn1");

             x.style.display = "none";
       }

       function resetfield() {
             document.getElementById("hId").value = 0;
             document.getElementById("hName").value = "";
             document.getElementById("hArea").value = "";
             document.getElementById("hNumOfRooms").value = "";
             document.getElementById("hImgUrl").value = "";
       }
       function showButton() {
             resetfield()
             var x = document.getElementById("btn1");
             var y = document.getElementById("btn3");
             var z = document.getElementById("btn2");
             x.style.display = "inline";
             y.style.display = "none";
             z.style.display = "none";
       }
</script>
</head>
<body>
       <h2>Welcome to Admin Page</h2>
       <div id="sub-left">
             <form:form action="hotelaction" method="post" modelAttribute="hotel"
                    id="adminForm">
                    <table>
                           <tr>
                                 <td><form:input id="hId" path="hotelId" hidden="true"></form:input></td>
                           </tr>

                           <tr>
                                 <td>hotelName:</td>
                                 <td><form:input id="hName" path="hotelName"></form:input></td>
                                 <td><form:errors path="hotelName" cssClass="error"></form:errors></td>

                           </tr>

                           <tr>
                                 <td>hotelArea:</td>
                                 <td><form:select id="hArea" path="hotelArea">
                        <option value="">~~Select~~</option>
                                               <form:option value="Marthalli">Marathalli</form:option>
                                               <form:option value="SilkBoard">SilkBoard</form:option>
                                        </form:select></td>
                                 <td><form:errors path="hotelArea" cssClass="error"></form:errors></td>

                           </tr>

                           <tr>
                                 <td>hotelNumberOfRooms:</td>
                                 <td><form:input id="hNumOfRooms" path="hotelNumOfRooms"></form:input></td>
                                 <td><form:errors path="hotelNumOfRooms" cssClass="error"></form:errors></td>
                           </tr>

                           <tr>
                                 <td>hotelImgUrl:</td>
                                 <td><form:input id="hImgUrl" path="hotelImgUrl"></form:input></td>
                                 <td><form:errors path="hotelImgUrl" cssClass="error"></form:errors></td>

                           </tr>

                    </table>



                    <div id="sub-right">

                           <input type="submit" value="Add" name="action" id="btn1"/> <br>
                           <br> <input type="submit" value="Edit" name="action" id="btn2"
                                 hidden /><br> <br> <input type="submit" value="Delete"
                                 name="action" id="btn3" hidden></input><br> <br> <input
                                 type="button" name="reset" value="Reset" onclick="showButton();" />

                    </div>

             </form:form>
       </div>



       <div class="myTable">
             <table id="hoteltable" border="1" width=100%>
                    <tr>
                           <td><h4>hotelId</h4></td>
                           <td><h4>hotelName</h4></td>
                           <td><h4>hotelArea</h4></td>
                           <td><h4>hotelNumOfRooms</h4></td>
                           <td><h4>hotelImageUrl</h4></td>
                    </tr>
                    <c:forEach var="hotels" items="${hotelList}">
                           <tr onclick="onRowClick()">
                                 <td>${hotels.hotelId}</td>
                                 <td>${hotels.hotelName}</td>
                                 <td>${hotels.hotelArea}</td>
                                 <td>${hotels.hotelNumOfRooms}</td>
                                 <td><img src="${hotels.hotelImgUrl}"/></td>
                           </tr>
                    </c:forEach>
             </table>
       </div>
</body>
</html>
