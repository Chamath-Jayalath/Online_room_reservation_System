package com.example.online_room_reservation_system.servlet;

import com.example.online_room_reservation_system.dao.ReservationDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboardData")
public class DashboardDataServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        ReservationDAO dao = new ReservationDAO();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String json = "{"
                + "\"totalReservations\":" + dao.getTotalReservations() + ","
                + "\"todayCheckIns\":" + dao.getTodayCheckIns() + ","
                + "\"todayCheckOuts\":" + dao.getTodayCheckOuts() + ","
                + "\"availableRooms\":" + dao.getAvailableRoomsToday()
                + "}";

        response.getWriter().write(json);
    }
}