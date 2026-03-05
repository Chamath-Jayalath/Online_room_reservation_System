<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help Guide</title>

    <style>
        body{
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg,#e3f2fd,#f4f6f9);
            margin:0;
            padding:30px;
        }

        .container{
            max-width:900px;
            margin:auto;
            background:white;
            padding:30px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.15);
        }

        h1{
            text-align:center;
            color:#0a4d68;
        }

        h3{
            color:#0a4d68;
            margin-top:25px;
        }

        p{
            color:#444;
            line-height:1.6;
        }

        ul{
            margin-top:8px;
            padding-left:20px;
        }

        li{
            margin-bottom:8px;
        }

        .tip{
            background:#e8f8f5;
            border-left:5px solid #27ae60;
            padding:10px;
            margin-top:15px;
            border-radius:6px;
        }

        .back-btn{
            display:inline-block;
            margin-top:20px;
            padding:10px 18px;
            background:#0a4d68;
            color:white;
            text-decoration:none;
            border-radius:8px;
        }

        .back-btn:hover{
            background:#088395;
        }
    </style>
</head>
<body>

<div class="container">

    <h1>Ocean View Resort</h1>
    <h1>User Help Guide</h1>

    <p>
        This system helps staff manage room reservations efficiently and avoid booking conflicts.
        Follow the instructions below to use the system correctly.
    </p>

    <h3>🔐 1. Login to the System</h3>
    <ul>
        <li>Enter your username and password.</li>
        <li>Click the <b>Login</b> button.</li>
        <li>If login fails, contact the administrator.</li>
    </ul>

    <h3>➕ 2. Add New Reservation</h3>
    <ul>
        <li>Click <b>Add Reservation</b> from the dashboard.</li>
        <li>Enter guest details and stay dates.</li>
        <li>Select room type.</li>
        <li>Click <b>Check Available Rooms</b>.</li>
        <li>Click <b>Save Reservation</b> to confirm.</li>
    </ul>

    <h3>📋 3. View Reservations</h3>
    <ul>
        <li>Click <b>View Reservations</b> from dashboard.</li>
        <li>See all current bookings.</li>
        <li>Use delete button to remove incorrect entries.</li>
    </ul>

    <h3>🔍 4. Search Reservation</h3>
    <ul>
        <li>Use contact number to find booking details.</li>
        <li>Ensure correct number format.</li>
    </ul>

    <h3>🧾 5. Print Bill / Receipt</h3>
    <ul>
        <li>After saving reservation, the bill is displayed.</li>
        <li>Provide the total amount to the guest.</li>
        <li>Use the print option if needed.</li>
    </ul>

    <h3>⚠ Important Notes</h3>
    <div class="tip">
        ✔ Always check room availability before saving.<br>
        ✔ Verify check-in and check-out dates.<br>
        ✔ Avoid duplicate bookings.<br>
        ✔ Keep guest contact details accurate.
    </div>

    <a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>

</div>

</body>
</html>