<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort</title>

    <style>
        body{
            margin:0;
            font-family: Arial, sans-serif;
            background:#f4fbff;
            color:#083344;
        }

        .header{
            background: linear-gradient(90deg,#0a4d68,#088395);
            padding:25px;
            text-align:center;
            color:white;
        }

        .logo{
            width:90px;
            margin-bottom:10px;
        }

        .container{
            text-align:center;
            padding:40px 20px;
        }

        .welcome{
            font-size:34px;
            margin-bottom:10px;
            color:#0a4d68;
        }

        .tagline{
            font-size:18px;
            color:#555;
            margin-bottom:30px;
        }

        .details{
            max-width:600px;
            margin:auto;
            background:white;
            padding:25px;
            border-radius:10px;
            box-shadow:0 4px 12px rgba(0,0,0,0.1);
            line-height:1.6;
        }

        .login-btn{
            margin-top:30px;
            background:#0a4d68;
            color:white;
            padding:14px 30px;
            border:none;
            border-radius:6px;
            font-size:18px;
            cursor:pointer;
        }

        .login-btn:hover{
            background:#088395;
        }

        footer{
            text-align:center;
            margin-top:40px;
            color:#777;
            font-size:14px;
        }
    </style>
</head>
<body>

<div class="header">
    <img src="images/logo.png" class="logo">
    <h1>Ocean View Resort</h1>
    <p>Luxury • Comfort • Ocean Breeze Experience</p>
</div>

<div class="container">

    <div class="welcome">Welcome to Ocean View Resort</div>

    <div class="tagline">
        Experience world-class hospitality and breathtaking ocean views.
    </div>

    <div class="details">
        🌴 Located on Sri Lanka’s beautiful coastline <br>
        🏨 Luxury rooms & suites with sea view <br>
        🍽 Fine dining & international cuisine <br>
        🏊 Swimming pool & spa facilities <br>
        🚐 Airport pickup & tour arrangements <br>
        📞 24/7 customer service
    </div>

    <form action="login.jsp">
        <button class="login-btn">Login to Management System</button>
    </form>

</div>

<footer>
    © 2026 Ocean View Resort | Negombo, Sri Lanka
</footer>

</body>
</html>