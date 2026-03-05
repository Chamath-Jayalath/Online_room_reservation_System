<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background:#eef2f5;
            padding:30px;
        }

        .receipt{
            width:450px;
            margin:auto;
            background:white;
            padding:25px;
            border-radius:10px;
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
        }

        .logo{
            text-align:center;
        }

        .logo img{
            width:80px;
            margin-bottom:5px;
        }

        .hotel-name{
            text-align:center;
            font-size:22px;
            font-weight:bold;
            color:#0a4d68;
        }

        .subtitle{
            text-align:center;
            font-size:13px;
            color:gray;
            margin-bottom:15px;
        }

        hr{
            border:none;
            border-top:1px dashed #ccc;
            margin:15px 0;
        }

        .row{
            display:flex;
            justify-content:space-between;
            margin:6px 0;
        }

        .label{
            font-weight:bold;
        }

        .total{
            text-align:center;
            font-size:22px;
            font-weight:bold;
            color:#27ae60;
            margin-top:15px;
        }

        .footer{
            text-align:center;
            margin-top:15px;
            font-size:12px;
            color:#777;
        }

        .btn{
            margin-top:15px;
            width:100%;
            padding:10px;
            border:none;
            border-radius:6px;
            cursor:pointer;
            font-size:15px;
        }

        .print-btn{
            background:#0a4d68;
            color:white;
        }

        .print-btn:hover{
            background:#088395;
        }

        .dashboard-btn{
            background:#27ae60;
            color:white;
            text-decoration:none;
            display:block;
            text-align:center;
        }

        .dashboard-btn:hover{
            background:#1e8449;
        }

        @media print {
            .no-print {
                display:none;
            }
        }
    </style>
</head>
<body>

<div class="receipt">

    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png">
    </div>

    <div class="hotel-name">Ocean View Resort</div>
    <div class="subtitle">
        Negombo, Sri Lanka<br>
        Phone: 077-1234567
    </div>

    <hr>

    <div class="row">
        <span class="label">Receipt No:</span>
        <span>#<%= System.currentTimeMillis() %></span>
    </div>

    <div class="row">
        <span class="label">Date:</span>
        <span><%= LocalDateTime.now().toLocalDate() %></span>
    </div>

    <hr>

    <div class="row">
        <span class="label">Guest:</span>
        <span>${guestName}</span>
    </div>

    <div class="row">
        <span class="label">Contact:</span>
        <span>${contact}</span>
    </div>

    <div class="row">
        <span class="label">Room:</span>
        <span>${roomType}</span>
    </div>

    <div class="row">
        <span class="label">Check In:</span>
        <span>${checkIn}</span>
    </div>

    <div class="row">
        <span class="label">Check Out:</span>
        <span>${checkOut}</span>
    </div>

    <div class="row">
        <span class="label">Nights:</span>
        <span>${nights}</span>
    </div>

    <hr>

    <div class="total">
        Total: Rs. ${total}
    </div>

    <!-- Buttons -->
    <button class="btn print-btn no-print" onclick="window.print()">Print Receipt</button>

    <a href="dashboard.jsp" class="btn dashboard-btn no-print">
        ← Back to Dashboard
    </a>

    <div class="footer">
        Thank you for choosing Ocean View Resort!
    </div>

</div>

</body>
</html>