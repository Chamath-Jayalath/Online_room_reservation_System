package com.example.online_room_reservation_system.servlet;

import com.example.online_room_reservation_system.dao.ReservationDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/checkAvailability")
public class CheckAvailabilityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Date checkIn = Date.valueOf(request.getParameter("checkIn"));
        Date checkOut = Date.valueOf(request.getParameter("checkOut"));

        ReservationDAO dao = new ReservationDAO();
        List<String> rooms = dao.getAvailableRooms(checkIn, checkOut);

        response.setContentType("text/html");

        if (rooms.isEmpty()) {
            response.getWriter().println("<p style='color:red;'>No rooms available!</p>");
        } else {
            response.getWriter().println("<b>Available Rooms:</b><br>");
            for (String r : rooms) {
                response.getWriter().println(r + "<br>");
            }
        }
    }
}