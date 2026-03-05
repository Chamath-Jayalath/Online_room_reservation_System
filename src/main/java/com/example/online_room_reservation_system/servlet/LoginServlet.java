package com.example.online_room_reservation_system.servlet;

import com.example.online_room_reservation_system.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Basic validation
        if(username == null || password == null ||
                username.isEmpty() || password.isEmpty()) {

            request.setAttribute("errorMessage", "Please enter username and password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT username FROM admin_users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // ✅ create session
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);

                // session timeout (30 mins)
                session.setMaxInactiveInterval(30 * 60);

                // redirect to dashboard
                response.sendRedirect("dashboard.jsp");

            } else {
                request.setAttribute("errorMessage", "Invalid Username or Password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "System error. Try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}