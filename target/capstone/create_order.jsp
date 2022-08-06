<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://mysql-standalone:3306/water_services?sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'&jdbcCompliantTruncation=false","rahul","wipro@1234"); //create connection
	
	if(request.getParameter("btn_order")!=null) //check register button click event not null
	{
		String name,email,contact,address,brand,status;
		int quantity;
	//	id= Integer.parseInt(request.getParameter("id"));
		name=request.getParameter("name"); 
		email=request.getParameter("email"); 
		contact = request.getParameter("contact"); 
		address=request.getParameter("address");
		brand=request.getParameter("brand");
		quantity = Integer.parseInt(request.getParameter("quantity"));
		status = "Pending";
		

		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into orders(name,email,contact,address,brand,quantity,status) values(?,?,?,?,?,?,'Pending')"); //sql insert query
	         
		pstmt.setString(1,name);
		pstmt.setString(2,email);
		pstmt.setString(3,contact);
		pstmt.setString(4,address);
		pstmt.setString(5,brand);
		pstmt.setInt(6,quantity);
		//pstmt.setString(7,status);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Order has been placed successfully...!"); //register success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>


<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	<title>order</title>

		<link rel="stylesheet" href="css/order.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			 
			
			var name = document.getElementById("name"); //textbox id fname
            
            		var email = document.getElementById("email"); //textbox id email
            
			let x = document.getElementById("quantity").value;
			
			if(!first_name.test(fname.value) || name.value=='') 
           		 {
				alert("Enter Name Alphabet Only....!");
                		fname.focus();
                		fname.style.background = '#f08080';
                		return false;                    
            			}
			
			if(!email_valid.test(email.value) || email.value=='') 
            		{
				alert("Enter Valid Email....!");
                		email.focus();
                		email.style.background = '#f08080';
                		return false;                    
            			}
			
			if (isNaN(x) || x < 1 ) 
			{
				alert("Enter valid number Only....!");
				}	 
			
		}
		
	</script>	

</head>

<body>
	<div class="form-title-row">
                        <h1><b>ORDER NOW!</b></h1>
        
	
					<p style="color:green">
					<%
                                        if(request.getAttribute("successMsg")!=null)
                                        {
                                                out.println(request.getAttribute("successMsg"));
                                        }
                                        %>
                                        </p>

	</div>


<div class="container">
  <form action="" method="post" onsubmit="return validate();">
	<div class="form-register-with-email">
	<div class="form-white-background">
	
    <label for="name">Name</label>
    <input type="text" id="name" name="name" placeholder="Enter your name" required>
	
    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="Enter your email" required>
    
    <label for="contact">Contact</label>
    <input type="text" id="Contact" name="contact" pattern="[1-9]{1}[0-9]{9}" placeholder="Enter your contact number" required>
	
    <label for="address">Address</label>
    <textarea id="address" name="address" placeholder="Enter your address..." style="height:80px" required></textarea>
    
    <label for="brand">Brand</label>
                            <select id="brand" name="brand" required>
							<div class="dropdown-content">
							  <option hidden disabled selected value> --- select a brand --- </option>
							  <option value="bailley">Bailley</option>
							  <option value="bisleri">Bisleri</option>
							  <option value="oxyrich">Oxyrich</option>
							  <option value="aquafina">Aquafina</option>
							  <option value="kinley">Kinley</option>
							  <option value="ozarka">Ozarka</option>
							  <option value="dasani">Dasani</option>
							  <option value="himalayan">Himalayan</option>
							  </div>
							</select>
                        
    <label for="quantity">Quantity</label>
    <input type="text" id="quantity" name="quantity" placeholder="enter quantity" required>
    

    <input type="submit" name="btn_order" value="Order">
	</div>
	</div>
  </form>
</div>

    
</body>

</html>
