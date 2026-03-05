package com.example.online_room_reservation_system.dao;

import com.example.online_room_reservation_system.model.Reservation;
import com.example.online_room_reservation_system.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    // ==============================
    // ✅ CHECK ROOM AVAILABILITY
    // ==============================
    public boolean isRoomAvailable(String roomType, Date checkIn, Date checkOut) {

        boolean available = true;

        String sql = "SELECT 1 FROM reservations " +
                "WHERE room_type = ? " +
                "AND (check_in < ? AND check_out > ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, roomType);
            ps.setDate(2, checkOut);
            ps.setDate(3, checkIn);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                available = false; // conflict exists
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return available;
    }

    // ==============================
    // ✅ GET AVAILABLE ROOM TYPES
    // ==============================
    public List<String> getAvailableRooms(Date checkIn, Date checkOut) {

        List<String> availableRooms = new ArrayList<>();

        String[] roomTypes = {"Standard", "Deluxe", "Suite"};

        for (String room : roomTypes) {
            if (isRoomAvailable(room, checkIn, checkOut)) {
                availableRooms.add(room);
            }
        }

        return availableRooms;
    }

    // ==============================
    // ✅ ADD RESERVATION
    // ==============================
    public boolean addReservation(Reservation r) {

        boolean status = false;

        if (!isRoomAvailable(r.getRoomType(), r.getCheckIn(), r.getCheckOut())) {
            return false; // prevent double booking
        }

        String sql = "INSERT INTO reservations " +
                "(guest_name, address, contact_no, room_type, check_in, check_out) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getContactNumber());
            ps.setString(4, r.getRoomType());
            ps.setDate(5, r.getCheckIn());
            ps.setDate(6, r.getCheckOut());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ==============================
    // ✅ VIEW ALL RESERVATIONS
    // ==============================
    public List<Reservation> getAllReservations() {

        List<Reservation> list = new ArrayList<>();

        String sql = "SELECT * FROM reservations ORDER BY check_in";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Reservation r = new Reservation();

                r.setReservationNumber(rs.getInt("reservation_no"));
                r.setGuestName(rs.getString("guest_name"));
                r.setAddress(rs.getString("address"));
                r.setContactNumber(rs.getString("contact_no"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckIn(rs.getDate("check_in"));
                r.setCheckOut(rs.getDate("check_out"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ==============================
    // ✅ GET RESERVATION BY ID
    // ==============================
    public Reservation getReservationById(int id) {

        Reservation r = null;

        String sql = "SELECT * FROM reservations WHERE reservation_no = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = new Reservation();

                r.setReservationNumber(rs.getInt("reservation_no"));
                r.setGuestName(rs.getString("guest_name"));
                r.setAddress(rs.getString("address"));
                r.setContactNumber(rs.getString("contact_no"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckIn(rs.getDate("check_in"));
                r.setCheckOut(rs.getDate("check_out"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    // ==============================
    // ✅ SEARCH BY CONTACT
    // ==============================
    public Reservation searchByContact(String contact) {

        Reservation r = null;

        String sql = "SELECT * FROM reservations WHERE contact_no = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, contact);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                r = new Reservation();

                r.setReservationNumber(rs.getInt("reservation_no"));
                r.setGuestName(rs.getString("guest_name"));
                r.setAddress(rs.getString("address"));
                r.setContactNumber(rs.getString("contact_no"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckIn(rs.getDate("check_in"));
                r.setCheckOut(rs.getDate("check_out"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    // ==============================
    // ✅ DELETE RESERVATION
    // ==============================
    public boolean deleteReservation(int id) {

        boolean status = false;

        String sql = "DELETE FROM reservations WHERE reservation_no = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ==============================
    // ⭐ DASHBOARD STATISTICS
    // ==============================

    public int getTotalReservations() {
        return getCount("SELECT COUNT(*) FROM reservations");
    }

    public int getTodayCheckIns() {
        return getCount("SELECT COUNT(*) FROM reservations WHERE check_in = CURDATE()");
    }

    public int getTodayCheckOuts() {
        return getCount("SELECT COUNT(*) FROM reservations WHERE check_out = CURDATE()");
    }

    public int getAvailableRoomsToday() {

        int totalRooms = 30; // 🔥 change to match your hotel
        int booked = getCount(
                "SELECT COUNT(*) FROM reservations " +
                        "WHERE CURDATE() BETWEEN check_in AND check_out");

        return totalRooms - booked;
    }

    // helper method
    private int getCount(String sql) {
        int count = 0;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) count = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}