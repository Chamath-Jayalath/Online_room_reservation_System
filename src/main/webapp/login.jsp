<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Login</title>
    <meta charset="UTF-8">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins', sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:linear-gradient(135deg,#0a4d68,#088395);
        }

        .login-box{
            background:rgba(255,255,255,0.15);
            backdrop-filter:blur(15px);
            border-radius:20px;
            padding:40px 35px;
            width:360px;
            text-align:center;
            box-shadow:0 8px 25px rgba(0,0,0,0.25);
            color:white;
        }

        .logo{
            width:90px;
            margin-bottom:10px;
        }

        .login-box h2{
            margin-bottom:20px;
            font-weight:600;
            letter-spacing:1px;
        }

        .input-group{
            position:relative;
            margin:18px 0;
        }

        .input-group i{
            position:absolute;
            left:12px;
            top:50%;
            transform:translateY(-50%);
            color:#0a4d68;
        }

        .input-group input{
            width:100%;
            padding:12px 12px 12px 38px;
            border-radius:8px;
            border:none;
            outline:none;
            font-size:15px;
        }

        .input-group input:focus{
            box-shadow:0 0 6px rgba(0,0,0,0.2);
        }

        button{
            width:100%;
            padding:12px;
            margin-top:15px;
            border:none;
            border-radius:8px;
            background:#0a4d68;
            color:white;
            font-size:16px;
            font-weight:500;
            cursor:pointer;
            transition:0.3s;
        }

        button:hover{
            background:#06394d;
            transform:translateY(-2px);
        }

        .footer-text{
            margin-top:18px;
            font-size:12px;
            opacity:0.85;
        }
    </style>
</head>
<body>

<div class="login-box">

    <!-- ⭐ LOGO -->
    <img src="images/logo.png" alt="Ocean View Logo" class="logo">

    <h2>Ocean View Resort</h2>

    <form action="login" method="post">

        <div class="input-group">
            <i class="fa fa-user"></i>
            <input type="text" name="username" placeholder="Username" required>
        </div>

        <div class="input-group">
            <i class="fa fa-lock"></i>
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <button type="submit">Login</button>

    </form>

    <div class="footer-text">
        Secure Admin Access
    </div>
</div>

</body>
</html>