package com.example.online_room_reservation_system.servlet;

import com.example.online_room_reservation_system.dao.ReservationDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReservationDAO dao = new ReservationDAO();

        request.setAttribute("totalReservations", dao.getTotalReservations());
        request.setAttribute("todayCheckIns", dao.getTodayCheckIns());
        request.setAttribute("todayCheckOuts", dao.getTodayCheckOuts());
        request.setAttribute("availableRooms", dao.getAvailableRoomsToday());

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}