<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Harideep Tailors Home Page</title>
    <link rel="icon" href="images/kkfunda.jpg">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: #007acc;
            color: white;
            padding: 30px 0;
            text-align: center;
        }

        .tabs {
            display: flex;
            justify-content: center;
            background-color: #e9ecef;
            padding: 10px 0;
        }

        .tab {
            padding: 12px 25px;
            cursor: pointer;
            margin: 0 5px;
            background-color: #dee2e6;
            border-radius: 5px 5px 0 0;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .tab:hover,
        .tab.active {
            background-color: #ffffff;
            border-bottom: 2px solid #007acc;
        }

        .tab-content {
            text-align: center;
            padding: 30px;
            border: 1px solid #dee2e6;
            border-top: none;
            background-color: #ffffff;
        }

        .machine-img {
            width: 250px;
            height: auto;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .info {
            text-align: center;
            margin-top: 30px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #007acc;
            color: white;
        }
    </style>

    <script>
        function showTab(tabName) {
            var tabs = document.getElementsByClassName("tab");
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].classList.remove("active");
            }

            var contents = document.getElementsByClassName("tab-content");
            for (var i = 0; i < contents.length; i++) {
                contents[i].style.display = "none";
            }

            document.getElementById(tabName).style.display = "block";
            document.getElementById("tab-" + tabName).classList.add("active");
        }

        window.onload = function () {
            showTab("Shiela");
        };
    </script>
</head>

<body>

<header>
    <h1>Welcome to Harideep Tailors</h1>
</header>

<!-- Tabs -->
<div class="tabs">
    <div class="tab" id="tab-Shiela" onclick="showTab('Shiela')">Shiela</div>
    <div class="tab" id="tab-Vidya" onclick="showTab('Vidya')">Vidya</div>
    <div class="tab" id="tab-Everest" onclick="showTab('Everest')">Everest</div>
    <div class="tab" id="tab-Jack" onclick="showTab('Jack')">Jack</div>
</div>

<!-- Tab Content -->
<div id="Shiela" class="tab-content">
    <h2>Shiela Machine</h2>
    <img src="images/shiela.jpg" alt="Shiela" class="machine-img">
</div>

<div id="Vidya" class="tab-content" style="display:none">
    <h2>Vidya Machine</h2>
    <img src="images/vidya.jpg" alt="Vidya" class="machine-img">
</div>

<div id="Everest" class="tab-content" style="display:none">
    <h2>Everest Machine</h2>
    <img src="images/everest.jpg" alt="Everest" class="machine-img">
</div>

<div id="Jack" class="tab-content" style="display:none">
    <h2>Jack Machine</h2>
    <img src="images/jack.jpg" alt="Jack" class="machine-img">
</div>

<!-- Server & Client Info -->
<div class="info">
    <h3>Server & Client Info</h3>
    <%
        InetAddress inetAddress = InetAddress.getLocalHost();
        String ip = inetAddress.getHostAddress();
        out.println("Server Host Name: " + inetAddress.getHostName() + "<br>");
        out.println("Server IP Address: " + ip + "<br>");
        out.println("Client IP Address: " + request.getRemoteAddr() + "<br>");
        out.println("Client Host Name: " + request.getRemoteHost());
    %>
    <p style="margin-top: 20px;"><a href="services/employee/getEmployeeDetails">➤ Get Employee Details</a></p>
</div>

<!-- Footer -->
<footer>
    <p>Harideep Tailors, Sewing Machine Sales and Service.</p>
    <small>&copy; 2025 Harideep Tailors | <a href="mailto:Tailors@gmail.com" style="color: #fff;">Contact Us</a></small>
</footer>

</body>
</html>
