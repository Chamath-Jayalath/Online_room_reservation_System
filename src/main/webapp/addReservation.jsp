<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Reservation</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg,#e3f2fd,#f2f6f9);
            margin:0;
        }

        .container {
            width: 420px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity:0; transform: translateY(20px);}
            to {opacity:1; transform: translateY(0);}
        }

        .logo {
            text-align:center;
            margin-bottom:10px;
        }

        .logo img{
            width:90px;
        }

        h2 {
            text-align: center;
            color: #0a4d68;
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            color:#333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: 0.2s;
            font-size:14px;
        }

        input:focus, select:focus {
            border-color: #0a4d68;
            box-shadow: 0 0 5px rgba(10,77,104,0.3);
            outline: none;
        }

        .btn {
            background: linear-gradient(45deg,#0a4d68,#088395);
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            font-weight: bold;
        }

        .btn:hover {
            transform: scale(1.03);
            box-shadow: 0 5px 12px rgba(0,0,0,0.2);
        }

        .check-btn {
            background: #27ae60;
            color: white;
            border: none;
            padding: 9px;
            width: 100%;
            border-radius: 8px;
            cursor: pointer;
            margin-bottom: 10px;
            font-weight:bold;
            transition:0.2s;
        }

        .check-btn:hover {
            background: #1e8449;
        }

        .availability {
            margin-bottom: 15px;
            font-weight: bold;
            text-align:center;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight:bold;
        }

        .footer {
            text-align:center;
            font-size:12px;
            color:#777;
            margin-top:15px;
        }
    </style>
</head>
<body>

<div class="container">

    <!-- LOGO -->
    <div class="logo">
        <img src="images/logo.png" alt="Ocean View Resort">
    </div>

    <h2>Ocean View Resort</h2>

    <!-- Show error -->
    <%
        String error = (String) request.getAttribute("error");
        if(error != null){
    %>
    <div class="error"><%= error %></div>
    <%
        }
    %>

    <form action="addReservation" method="post">

        <label>Guest Name</label>
        <input type="text" name="guestName" required>

        <label>Address</label>
        <input type="text" name="address">

        <label>Contact Number</label>
        <input type="text" name="contact" required>

        <label>Room Type</label>
        <select name="roomType">
            <option value="Standard">Standard</option>
            <option value="Deluxe">Deluxe</option>
            <option value="Suite">Suite</option>
        </select>

        <label>Check-in Date</label>
        <input type="date" name="checkIn" required>

        <label>Check-out Date</label>
        <input type="date" name="checkOut" required>

        <button type="button" class="check-btn" onclick="checkRooms()">
            Check Available Rooms
        </button>

        <div id="availabilityResult" class="availability"></div>

        <input type="submit" value="Save Reservation & Print Bill" class="btn">

    </form>

    <div class="footer">
        Ocean View Resort © 2026
    </div>

</div>

<script>
    function checkRooms() {

        const checkIn = document.querySelector('[name="checkIn"]').value;
        const checkOut = document.querySelector('[name="checkOut"]').value;

        if(!checkIn || !checkOut){
            alert("Please select dates first");
            return;
        }

        fetch("checkAvailability", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: "checkIn=" + checkIn + "&checkOut=" + checkOut
        })
            .then(res => res.text())
            .then(data => {
                document.getElementById("availabilityResult").innerHTML = data;
            });
    }
</script>

</body>
</html>