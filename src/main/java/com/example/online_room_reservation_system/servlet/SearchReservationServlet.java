package com.example.online_room_reservation_system.servlet;

import com.example.online_room_reservation_system.dao.ReservationDAO;
import com.example.online_room_reservation_system.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/searchReservation")
public class SearchReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String contact = request.getParameter("contact");

        ReservationDAO dao = new ReservationDAO();
        Reservation r = dao.searchByContact(contact);

        request.setAttribute("reservation", r);
        request.getRequestDispatcher("searchResult.jsp").forward(request, response);
    }
}