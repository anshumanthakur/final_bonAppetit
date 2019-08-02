<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<link href="<c:url value="/resources/css/style_order.css" />" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
	var x = 135;
	var name = "anshu";
	var temp = sel.options[sel.selectedIndex].text;
	;
	function myFunction() {
		x = document.getElementById("mySelect").value;

	}

	function Function() {
		var quantity = document.getElementById("quantity").value;
		document.getElementById("total").innerHTML = "Your total is: "
				+ (parseInt(quantity) * parseInt(x));

	}

	function myNewFunction(sel) {
		alert("Sas");
		temp = sel.options[sel.selectedIndex].text;
		val foodId;
		foodId = document.getElementById("mySelect").value;
		var n = foodId.indexOf("/");
		alert(foodId.substring(n+1));
		document.getElementById("food_name").value = temp;

	}
	function addFunction() {
		//document.getElementById("food_name").value = temp;
		alert("sas");
	}
	function clickFunction() {
		alert("sas");
	}
	function onRowClick() {
		var table = document.getElementById("orderDetailTable");
		var rows = table.getElementsByTagName("tr");
		for (i = 0; i < rows.length; i++) {
			var currentRow = table.rows[i];
			var createClickHandler = function(row) {
				return function() {
					document.getElementById("comment").value = row
							.getElementsByTagName("td")[5].innerHTML;
					document.getElementById("mySelect").value = row
							.getElementsByTagName("td")[1].innerHTML;

				};
			};
			currentRow.onclick = createClickHandler(currentRow);
		}
	}
</script>
<style type="text/css">
body {
    background-color: lightblue;
}

h2 {
    color: Blue;
    text-align: left;
}

p {
    font-family: verdana;
    font-size: 20px;
    font-color: Red;
}
</style>
</head>
<body>

	<form:form action="/SpringMVC_sample/success " method="post"
		modelAttribute="order">

		<table>

			<tr>
				<td>Food name:</td>
				<td><select name="foodItemPrice" id="mySelect"
						onchange="myNewFunction(this);">
						<c:forEach items="${FoodMenu}" var="FoodMenu">
							<option id="name" value="${FoodMenu.foodItemPrice}/${FoodMenu.foodItemId}">${FoodMenu.foodItemName}</option>
						</c:forEach>
					</select></td>

			</tr>
			<tr>
				<td>quantity:</td>
				<td><form:select path="quantity" id="quantity"
						onchange="Function()">
						<%
							for (int i = 1; i < 10; i += 1) {
						%>
						<option value="<%=i%>">
							<%
								out.print(i);
							%>
						</option>
						<%
							}
						%>
					</form:select></td>

			</tr>

			<tr>
				<td>Comment:</td>
				<td><form:input path="comment" name="email" id="comment" /></td>
			</tr>
			<tr>
				<td><form:input type="hidden" path="foodItemName" id="food_name" /></td>
			</tr>
			<tr>
				<td><form:input type="hidden" path="foodItemId" id="foodId" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Add" onclick="addFunction()"></td>
			</tr>
			<tr>
				<td><input type="button" value="sample" onclick="clickFunction()"></td>
			</tr>
		</table>

	</</form:form>

	<p id="total"></p>
	<br>
	<br>
	<p id="name"></p>

	<table id="orderDetailTable" align="center" border="1" width=100%>
		<tr>
			<td>Order Id</td>
			<td>Food Name</td>
			<td>quantity</td>
			<td>price</td>
			<td>total amount</td>
			<td>comment</td>
		</tr>
		<c:forEach items="${orderList}" var="orderList">
			<tr>

				<td>${orderList.orderId}</td>
				<td>${orderList.foodItemName}</td>
				<td>${orderList.quantity}</td>
				<td>${orderList.foodItemPrice}</td>
				<td>${orderList.amount}</td>
				<td>${orderList.comment}</td>
				<td onclick="onRowClick()"><a href="">update</a></td>
				<td><a href="<c:url value='/delete/${orderList.id}' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>

	<button align="center"
		onclick="window.location.href = '/SpringMVC_sample/bill';"
		type="button" value="submit">submit</button>


</body>
</html>
