<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.online_room_reservation_system.model.Reservation" %>

<%
    Reservation r = (Reservation) request.getAttribute("reservation");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Result</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg,#e3f2fd,#f4f6f9);
            margin: 0;
        }

        .container {
            width: 420px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            animation: fadeIn 0.4s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity:0; transform: translateY(15px);}
            to {opacity:1; transform: translateY(0);}
        }

        .logo{
            text-align:center;
        }

        .logo img{
            width: 80px;
            margin-bottom: 10px;
        }

        h2 {
            text-align:center;
            color: #0a4d68;
            margin-bottom: 20px;
        }

        .details {
            background:#f9fcff;
            padding:15px;
            border-radius:10px;
            margin-bottom:15px;
            line-height:1.8;
        }

        .details span {
            font-weight:bold;
            color:#0a4d68;
        }

        .notfound {
            text-align:center;
            color:red;
            font-weight:bold;
            margin:20px 0;
        }

        .back {
            display:block;
            text-align:center;
            margin-top:15px;
            text-decoration:none;
            color:#0a4d68;
            font-weight:bold;
        }

        .back:hover {
            color:#088395;
        }

        .footer {
            text-align:center;
            margin-top:10px;
            font-size:12px;
            color:#777;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="logo">
        <img src="images/logo.png" alt="Ocean View Resort">
    </div>

    <h2>Reservation Details</h2>

    <% if(r != null){ %>

    <div class="details">
        <span>Reservation No:</span> <%= r.getReservationNumber() %><br>
        <span>Guest Name:</span> <%= r.getGuestName() %><br>
        <span>Contact:</span> <%= r.getContactNumber() %><br>
        <span>Room Type:</span> <%= r.getRoomType() %><br>
        <span>Check In:</span> <%= r.getCheckIn() %><br>
        <span>Check Out:</span> <%= r.getCheckOut() %>
    </div>

    <% } else { %>

    <div class="notfound">
        ❌ No reservation found!
    </div>

    <% } %>

    <a href="searchReservation.jsp" class="back">🔍 Search Again</a>
    <a href="dashboard.jsp" class="back">← Back to Dashboard</a>

    <div class="footer">
        Ocean View Resort © 2026
    </div>

</div>

</body>
</html>