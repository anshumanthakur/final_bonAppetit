<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	var x;
	var name = "anshu";
	function myNewFunction() {
		var foodDetail = document.getElementById("foodName").value;
		var slashIndex = foodDetail.indexOf("/");
		var hashIndex= foodDetail.indexOf("#");
		var foodId=foodDetail.substring(slashIndex + 1,hashIndex);
		document.getElementById("foodId").value = foodId;
		var price;
		price=foodDetail.substring(0,slashIndex);
		document.getElementById("foodPrice").value=parseInt(price);
		var foodName=foodDetail.substring(hashIndex+1);
		document.getElementById("food_name").value=foodName;
	}

	function onRowClick() {
		var table = document.getElementById("orderDetailTable");
		var rows = table.getElementsByTagName("tr");
		for (i = 0; i < rows.length; i++) {
			var currentRow = table.rows[i];
			var createClickHandler = function(row) {
				return function() {
					var id=row.getElementsByTagName("td")[1].innerHTML;
					var price=row.getElementsByTagName("td")[4].innerHTML;
					var name=row.getElementsByTagName("td")[2].innerHTML;
					document.getElementById("foodName").value = price+"/"+id+"#"+name;
					document.getElementById("quantity").value = row
							.getElementsByTagName("td")[3].innerHTML;
					document.getElementById("comment").value = row
					.getElementsByTagName("td")[6].innerHTML;
					
					document.getElementById("update").value=1;
					document.getElementById("orderId").value=row.getElementsByTagName("td")[0].innerHTML;;
				};
			};
			currentRow.onclick = createClickHandler(currentRow);
		}
	}
	function onStart() {
		document.getElementById("orderId").value=0;
		document.getElementById("update").value=0;
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
<body onLoad="onStart()">

	<form:form action="/SpringMVC_sample/success " method="post"
		modelAttribute="order">

		<table>

			<tr>
				<td>Food name:</td>
				<td><select name="foodName" id="foodName"
					onchange="myNewFunction();">
						<c:forEach items="${FoodMenu}" var="FoodMenu">
							<option value="${FoodMenu.foodItemPrice}/${FoodMenu.foodItemId}#${FoodMenu.foodItemName}">${FoodMenu.foodItemName}</option>
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
				<td><form:input path="foodItemName" id="food_name" /></td>
			</tr>
			<tr>
				<td><form:input path="foodItemId" id="foodId" /></td>
			</tr>
			<tr>
				<td><input name="foodPrice" id="foodPrice" /></td>
			</tr>
			<tr>
				<td><input name="update" id="update" /></td>
			</tr>
			<tr>
				<td><input name="orderId" id="orderId" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Add" onclick="myNewFunction()"></td>
			</tr>
		</table>

	</form:form>

	<p id="total"></p>
	<br>
	<br>
	<p id="name"></p>

	<table id="orderDetailTable" align="center" border="1" width=100%>
		<tr>
			<td>Order Id</td>
			<td>food item id</td>
			<td>Food Name</td>
			<td>quantity</td>
			<td>price</td>
			<td>total amount</td>
			<td>comment</td>
		</tr>
		<c:forEach items="${orderList}" var="orderList">
			<tr>

				<td>${orderList.orderId}</td>
				<td>${orderList.foodItemId}</td>
				<td>${orderList.foodItemName}</td>
				<td>${orderList.quantity}</td>
				<td>${orderList.foodItemPrice}</td>
				<td>${orderList.amount}</td>
				<td>${orderList.comment}</td>
				<td onclick="onRowClick()">update</td>
				<td><a href="<c:url value='/delete/${orderList.orderId}' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>

	<button align="center"
		onclick="window.location.href = '/SpringMVC_sample/bill';"
		type="button" value="submit">submit</button>


</body>
</html>
