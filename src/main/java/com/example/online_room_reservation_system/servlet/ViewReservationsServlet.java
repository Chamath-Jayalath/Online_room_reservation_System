package com.example.online_room_reservation_system.servlet;

import com.example.online_room_reservation_system.dao.ReservationDAO;
import com.example.online_room_reservation_system.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewReservations")
public class ViewReservationsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReservationDAO dao = new ReservationDAO();
        List<Reservation> list = dao.getAllReservations();

        request.setAttribute("reservations", list);
        request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
    }
}