# 🍔 InstantFood

> A full-stack food delivery web application inspired by Zomato and Swiggy, built using Java Servlets, JSP, JDBC, MySQL, and Maven.

---

## 📌 Overview

InstantFood is a full-stack food ordering application that enables users to browse restaurants, explore menus, manage carts, and place orders through a responsive and user-friendly interface.

---

## ✨ Features

- 🔐 User Registration & Login
- 🍽️ Browse Restaurants & Menus
- 🔎 Live Restaurant Search
- 🛒 Shopping Cart Management
- 💳 Checkout (COD & UPI)
- 📦 Order History & Status Tracking
- 👤 User Profile & Session Management
- 🎨 Responsive Dark-Themed UI

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | JSP, HTML, CSS, JavaScript |
| Backend | Java Servlets |
| Database | MySQL |
| Architecture | MVC + DAO Pattern |
| Build Tool | Maven |
| Server | Apache Tomcat 10 |

---

## 📂 Project Structure

```
InstantFood
├── src/main/java
│   ├── controller
│   ├── dao
│   ├── daoimpl
│   ├── model
│   └── util
├── src/main/webapp
│   ├── assets
│   └── WEB-INF/views
└── pom.xml
```

---

## 🚀 How to Run

1. Clone the repository

```bash
git clone https://github.com/Deekshith06452/InstantFood.git
```

2. Create the MySQL database.

3. Update database credentials in `DBConnection.java`.

4. Build the project

```bash
mvn clean install
```

5. Deploy on Apache Tomcat 10 and open:

```
http://localhost:8080/InstantFood/home
```

---

## 👨‍💻 Author

**Deekshith Gowda S**

- 💻 Java Full Stack Developer
- GitHub: https://github.com/Deekshith06452
