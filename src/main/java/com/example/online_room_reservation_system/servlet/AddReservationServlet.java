package com.example.online_room_reservation_system.servlet;

import com.example.online_room_reservation_system.dao.ReservationDAO;
import com.example.online_room_reservation_system.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.time.temporal.ChronoUnit;

@WebServlet("/addReservation")
public class AddReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String guestName = request.getParameter("guestName");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String roomType = request.getParameter("roomType");

            Date checkIn = Date.valueOf(request.getParameter("checkIn"));
            Date checkOut = Date.valueOf(request.getParameter("checkOut"));

            // ✅ Validate dates
            long nights = ChronoUnit.DAYS.between(checkIn.toLocalDate(), checkOut.toLocalDate());

            if (nights <= 0) {
                request.setAttribute("error", "Check-out date must be after check-in date!");
                request.getRequestDispatcher("addReservation.jsp").forward(request, response);
                return;
            }

            ReservationDAO dao = new ReservationDAO();

            // ✅ Prevent double booking
            if (!dao.isRoomAvailable(roomType, checkIn, checkOut)) {
                request.setAttribute("error", "Room already booked for selected dates!");
                request.getRequestDispatcher("addReservation.jsp").forward(request, response);
                return;
            }

            // ✅ Room rates
            double rate = 0;

            if (roomType.equals("Standard")) rate = 8000;
            else if (roomType.equals("Deluxe")) rate = 12000;
            else if (roomType.equals("Suite")) rate = 18000;

            double total = nights * rate;

            // ✅ Save reservation
            Reservation r = new Reservation();
            r.setGuestName(guestName);
            r.setAddress(address);
            r.setContactNumber(contact);
            r.setRoomType(roomType);
            r.setCheckIn(checkIn);
            r.setCheckOut(checkOut);

            dao.addReservation(r);

            // ✅ Send data to receipt page
            request.setAttribute("guestName", guestName);
            request.setAttribute("contact", contact);
            request.setAttribute("roomType", roomType);
            request.setAttribute("checkIn", checkIn);
            request.setAttribute("checkOut", checkOut);
            request.setAttribute("nights", nights);
            request.setAttribute("total", total);

            request.getRequestDispatcher("receipt.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("System Error!");
        }
    }
}