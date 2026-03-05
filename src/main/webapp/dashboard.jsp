<%@ page session="true" %>
<%
  if(session.getAttribute("admin")==null){
    response.sendRedirect("login.jsp");
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Dashboard</title>

  <!-- ✅ FONT AWESOME ICONS -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
    body{margin:0;font-family:'Segoe UI', Arial;background:#f4f8fb;}

    .sidebar{
      width:220px;height:100vh;position:fixed;
      background:linear-gradient(180deg,#0a4d68,#088395);
      color:white;padding-top:20px;
    }
    .sidebar h2{text-align:center;margin-bottom:30px;}
    .sidebar a{
      display:block;color:white;text-decoration:none;
      padding:14px 20px;transition:0.3s;
    }
    .sidebar a:hover{
      background:rgba(255,255,255,0.15);
      padding-left:25px;
    }

    .main{margin-left:220px;padding:20px 40px;}

    .header{
      display:flex;justify-content:space-between;align-items:center;
    }

    .status{
      background:#2ecc71;color:white;
      padding:5px 10px;border-radius:6px;font-size:12px;
    }

    .logout{
      text-decoration:none;background:#ff6b6b;
      color:white;padding:6px 12px;border-radius:6px;
    }

    .welcome{font-size:26px;color:#0a4d68;font-weight:bold;}
    .clock{color:#555;}

    .stats{
      display:flex;gap:20px;margin-top:25px;flex-wrap:wrap;
    }

    .stat-card{
      background:white;padding:20px;flex:1;min-width:180px;
      border-radius:12px;box-shadow:0 6px 15px rgba(0,0,0,0.15);
      text-align:center;
    }

    .stat-card h3{
      margin:0;color:#0a4d68;font-size:30px;
    }

    .stat-card p{margin-top:5px;color:#777;}

    .cards{
      display:flex;gap:20px;flex-wrap:wrap;margin-top:30px;
    }

    .card{
      background:white;width:200px;padding:25px;
      border-radius:15px;text-align:center;
      box-shadow:0 8px 18px rgba(0,0,0,0.15);
      transition:0.3s;
    }

    .card:hover{transform:translateY(-6px);}

    .icon i{
      font-size:34px;
      color:#0a4d68;
      margin-bottom:10px;
    }

    .card a{
      text-decoration:none;color:#0a4d68;font-weight:bold;
    }

    footer{
      margin-top:40px;text-align:center;color:#777;
    }
  </style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
  <h2>Ocean View</h2>
  <a href="dashboard"><i class="fa fa-house"></i> Dashboard</a>
  <a href="addReservation.jsp"><i class="fa fa-plus"></i> Add Reservation</a>
  <a href="viewReservations"><i class="fa fa-list"></i> View Reservations</a>
  <a href="searchReservation.jsp"><i class="fa fa-search"></i> Search</a>
  <a href="help.jsp"><i class="fa fa-circle-question"></i> Help</a>
</div>

<div class="main">

  <!-- HEADER -->
  <div class="header">
    <div>
      <div class="welcome">Welcome, <%= session.getAttribute("admin") %></div>
      <div class="clock" id="clock"></div>
    </div>

    <div>
      <span class="status">System Online</span>
      <a href="logout" class="logout">Logout</a>
    </div>
  </div>

  <!-- LIVE STATISTICS -->
  <div class="stats">
    <div class="stat-card">
      <h3 id="totalReservations">${totalReservations}</h3>
      <p>Total Reservations</p>
    </div>

    <div class="stat-card">
      <h3 id="todayCheckIns">${todayCheckIns}</h3>
      <p>Today Check-ins</p>
    </div>

    <div class="stat-card">
      <h3 id="todayCheckOuts">${todayCheckOuts}</h3>
      <p>Today Check-outs</p>
    </div>

    <div class="stat-card">
      <h3 id="availableRooms">${availableRooms}</h3>
      <p>Available Rooms</p>
    </div>
  </div>

  <!-- QUICK ACTION -->
  <div class="cards">

    <div class="card">
      <div class="icon"><i class="fa fa-plus"></i></div>
      <a href="addReservation.jsp">Add Reservation</a>
    </div>

    <div class="card">
      <div class="icon"><i class="fa fa-list"></i></div>
      <a href="viewReservations">View Reservations</a>
    </div>

    <div class="card">
      <div class="icon"><i class="fa fa-search"></i></div>
      <a href="searchReservation.jsp">Search</a>
    </div>



    <div class="card">
      <div class="icon"><i class="fa fa-circle-question"></i></div>
      <a href="help.jsp">Help Guide</a>
    </div>

  </div>

  <footer>
    Ocean View Resort Management System  2026
  </footer>

</div>

<script>
  // CLOCK
  function updateClock(){
    document.getElementById("clock").innerHTML =
            new Date().toLocaleString();
  }
  setInterval(updateClock,1000);
  updateClock();

  // REAL-TIME DASHBOARD UPDATE
  function refreshDashboard(){
    fetch('dashboardData')
            .then(res => res.json())
            .then(data => {
              document.getElementById("totalReservations").innerText = data.totalReservations;
              document.getElementById("todayCheckIns").innerText = data.todayCheckIns;
              document.getElementById("todayCheckOuts").innerText = data.todayCheckOuts;
              document.getElementById("availableRooms").innerText = data.availableRooms;
            });
  }

  // refresh every 5 seconds
  setInterval(refreshDashboard, 5000);
</script>

</body>
</html>