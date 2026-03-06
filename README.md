# 🏨 Ocean View Resort Room Reservation System

A web-based **Room Reservation Management System** developed using **Java Servlets, JSP, and MySQL**.
This system allows administrators to manage hotel reservations, check room availability, and monitor booking activities through an interactive dashboard.

---

## 🚀 Features

* 🔐 Secure Admin Login System
* ➕ Add New Room Reservations
* 🛏 Check Room Availability
* 📋 View All Reservations
* 🔎 Search Reservations by Contact Number
* ❌ Delete Reservations
* 📊 Dashboard Statistics (Total bookings, Check-ins, Check-outs)
* 🧾 Reservation Receipt Generation
* 📖 Help Guide for System Users

---

## 🛠 Technologies Used

* ☕ Java
* 🌐 JSP
* ⚙️ Java Servlets
* 🗄 MySQL
* 🔗 JDBC
* 🧩 Apache Tomcat
* 🎨 HTML / CSS
* 🧠 JavaScript

---

## 🏗 System Architecture

The system follows **MVC (Model-View-Controller) Architecture**.

**Model**

* Reservation.java

**View**

* login.jsp
* dashboard.jsp
* addReservation.jsp
* viewReservations.jsp

**Controller**

* LoginServlet
* ReservationServlet
* DashboardServlet

The project also uses the **DAO (Data Access Object) Design Pattern** to separate database operations from business logic.

---

## 📊 System Modules

### 🔐 Authentication

* Admin login verification
* Session management
* Secure logout

### 🛎 Reservation Management

* Add reservation
* Check room availability
* Delete reservation

### 📊 Dashboard

* Total reservations
* Today's check-ins
* Today's check-outs
* Available rooms

---

## 📂 Project Structure

Online_room_reservation_System

src/main/java
├── dao
│   └── ReservationDAO.java
├── model
│   └── Reservation.java
├── servlet
│   ├── LoginServlet.java
│   ├── AddReservationServlet.java
│   ├── ViewReservationsServlet.java
│   └── DashboardServlet.java
└── util
    └── DBConnection.java

webapp
├── login.jsp
├── dashboard.jsp
├── addReservation.jsp
├── viewReservations.jsp
└── help.jsp

pom.xml

---

## ⚙️ How to Run the Project

1. Clone the repository

git clone
https://github.com/Chamath-Jayalath/Online_room_reservation_System.git

2. Import project into **IntelliJ IDEA or Eclipse**

3. Configure MySQL Database

Database name:

ocean_view_resort

4. Run the project using **Apache Tomcat Server**

5. Open browser

http://localhost:8080

---

## 📸 System Screenshots

* Login Page
* Dashboard
* Add Reservation Page
* Reservation List

(Screenshots are included in the project documentation.)

---

## 🔄 Version Control

This project uses **Git and GitHub** for version control.

Key Git features used:

* Repository creation
* Multiple commits
* Version updates
* Source code tracking

Repository Link:
https://github.com/Chamath-Jayalath/Online_room_reservation_System

---

## 🎓 Academic Project

This project was developed for the module:

**CIS6003 – Advanced Programming**
BSc (Hons) Software Engineering
Cardiff Metropolitan University

---

## 👨‍💻 Author

Chamath Rashmika Jayalath
Student ID: CL/BSCSD/33/42

---

## ⭐ Future Improvements

* Online customer booking system
* Payment gateway integration
* Email reservation confirmation
* Mobile application support

---

## 📄 License

This project is developed for **educational purposes only**.
