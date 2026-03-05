<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Reservation</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg,#e3f2fd,#f4f6f9);
            margin: 0;
        }

        .container {
            width: 420px;
            margin: 70px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            text-align: center;
            animation: fadeIn 0.4s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity:0; transform: translateY(15px);}
            to {opacity:1; transform: translateY(0);}
        }

        .logo img{
            width: 85px;
            margin-bottom: 8px;
        }

        h2 {
            color: #0a4d68;
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 100%;
            padding: 11px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 10px;
            margin-bottom: 18px;
            font-size: 14px;
            transition: 0.2s;
        }

        input[type="text"]:focus {
            border-color: #0a4d68;
            box-shadow: 0 0 6px rgba(10,77,104,0.3);
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(45deg,#0a4d68,#088395);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            transform: scale(1.04);
            box-shadow: 0 5px 12px rgba(0,0,0,0.2);
        }

        .back {
            margin-top: 18px;
            display: block;
            text-decoration: none;
            color: #0a4d68;
            font-weight: bold;
        }

        .back:hover {
            color:#088395;
        }

        .footer {
            margin-top: 15px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="logo">
        <img src="images/logo.png" alt="Ocean View Resort">
    </div>

    <h2>Search Reservation</h2>

    <form action="searchReservation" method="post">

        <input type="text" name="contact"
               placeholder="Enter Contact Number"
               required>

        <input type="submit" value="Search Reservation" class="btn">

    </form>

    <a href="dashboard.jsp" class="back">← Back to Dashboard</a>

    <div class="footer">
        Ocean View Resort © 2026
    </div>

</div>

</body>
</html>