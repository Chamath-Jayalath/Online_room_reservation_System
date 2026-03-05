<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.online_room_reservation_system.model.Reservation" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Reservations</title>

    <style>
        body{
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg,#e3f2fd,#f4f6f9);
            margin:0;
            padding:30px;
        }

        .container{
            max-width:1000px;
            margin:auto;
            background:white;
            padding:25px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.15);
            animation: fadeIn 0.4s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity:0; transform: translateY(10px);}
            to {opacity:1; transform: translateY(0);}
        }

        h2{
            text-align:center;
            color:#0a4d68;
            margin-bottom:20px;
        }

        .top-bar{
            display:flex;
            justify-content:space-between;
            align-items:center;
            margin-bottom:15px;
        }

        .btn{
            padding:10px 18px;
            background: linear-gradient(45deg,#27ae60,#2ecc71);
            color:white;
            text-decoration:none;
            border-radius:8px;
            font-weight:bold;
            transition:0.3s;
        }

        .btn:hover{
            transform:scale(1.05);
            box-shadow:0 4px 12px rgba(0,0,0,0.2);
        }

        .back{
            background:#0a4d68;
        }

        table{
            width:100%;
            border-collapse:collapse;
            margin-top:10px;
        }

        th{
            background: linear-gradient(45deg,#0a4d68,#088395);
            color:white;
            padding:12px;
            font-size:14px;
        }

        td{
            padding:12px;
            text-align:center;
            border-bottom:1px solid #eee;
        }

        tr:hover{
            background:#f2fbff;
        }

        .delete-btn{
            background:#e74c3c;
            color:white;
            padding:6px 12px;
            border-radius:6px;
            text-decoration:none;
            font-size:13px;
            transition:0.2s;
        }

        .delete-btn:hover{
            background:#c0392b;
        }

        .empty{
            text-align:center;
            padding:20px;
            color:#888;
            font-weight:bold;
        }

        .footer{
            text-align:center;
            margin-top:15px;
            font-size:12px;
            color:#777;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>All Reservations</h2>

    <div class="top-bar">
        <a href="dashboard.jsp" class="btn back">← Dashboard</a>
        <a href="addReservation.jsp" class="btn">+ Add Reservation</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Guest</th>
            <th>Contact</th>
            <th>Room</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Action</th>
        </tr>

        <%
            List<Reservation> list = (List<Reservation>) request.getAttribute("reservations");

            if(list != null && !list.isEmpty()){
                for(Reservation r : list){
        %>
        <tr>
            <td><%= r.getReservationNumber() %></td>
            <td><%= r.getGuestName() %></td>
            <td><%= r.getContactNumber() %></td>
            <td><%= r.getRoomType() %></td>
            <td><%= r.getCheckIn() %></td>
            <td><%= r.getCheckOut() %></td>
            <td>
                <a class="delete-btn"
                   href="deleteReservation?id=<%= r.getReservationNumber() %>"
                   onclick="return confirm('Are you sure you want to delete this reservation?');">
                    Delete
                </a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="empty">No reservations found</td>
        </tr>
        <%
            }
        %>

    </table>

    <div class="footer">
        Ocean View Resort Management System © 2026
    </div>

</div>

</body>
</html>