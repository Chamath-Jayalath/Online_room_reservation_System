package com.example.online_room_reservation_system;

import com.example.online_room_reservation_system.util.DBConnection;
import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            System.out.println("SUCCESS: Connected to DB");
        } else {
            System.out.println("FAILED: Connection error");
        }
    }
}