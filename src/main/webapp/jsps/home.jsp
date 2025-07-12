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
            font-family: Arial, sans-serif;
            background: #f4f7f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        h1, h3 {
            margin: 10px 0;
        }
        hr {
            border: 0;
            height: 1px;
            background: #ccc;
        }
        .content {
            padding: 30px;
            text-align: center;
        }
        .machine-select {
            margin-top: 20px;
        }
        select {
            padding: 10px;
            font-size: 16px;
        }
        .machine-image {
            margin-top: 20px;
        }
        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 40px;
        }
        img.machine {
            width: 200px;
            height: auto;
            margin-top: 10px;
        }
    </style>
    <script>
        function showMachineImage() {
            var selected = document.getElementById("machineType").value;
            var img = document.getElementById("machineImg");

            switch (selected) {
                case "Shiela":
                    img.src = "images/shiela.jpg";
                    break;
                case "Vidya":
                    img.src = "images/vidya.jpg";
                    break;
                case "Everest":
                    img.src = "images/everest.jpg";
                    break;
                case "Jack":
                    img.src = "images/jack.jpg";
                    break;
                default:
                    img.src = "";
            }
        }
    </script>
</head>
<body>

<header>
    <h1>Welcome to Harideep Tailors</h1>
</header>

<div class="content">
    <h3>Server Side IP Address</h3>
    <%
        InetAddress inetAddress = InetAddress.getLocalHost();
        String ip = inetAddress.getHostAddress();
        out.println("Server Host Name: " + inetAddress.getHostName() + "<br>");
        out.println("Server IP Address: " + ip);
    %>

    <h3>Client Side IP Address</h3>
    <%
        out.println("Client IP Address: " + request.getRemoteAddr() + "<br>");
        out.println("Client Name Host: " + request.getRemoteHost());
    %>

    <div style="margin-top: 30px;">
        <img src="images/kkfunda.jpg" alt="Logo" width="100">
        <p><strong>Harideep Tailors,<br>Thirumalagiri, Suryapet<br>+91-123456789<br>
        <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></strong></p>
    </div>

    <div class="machine-select">
        <h3>Select Machine Type</h3>
        <select id="machineType" onchange="showMachineImage()">
            <option value="">-- Choose a Machine --</option>
            <option value="Shiela">Shiela</option>
            <option value="Vidya">Vidya</option>
            <option value="Everest">Everest</option>
            <option value="Jack">Jack</option>
        </select>

        <div class="machine-image">
            <img id="machineImg" class="machine" src="" alt="Machine Image">
        </div>
    </div>

    <hr>
    <h3>Service</h3>
    <p><a href="services/employee/getEmployeeDetails">Get Employee Details</a></p>
</div>

<div class="footer">
    <p>Harideep Tailors, Sewing Machine Sales and Service.</p>
    <small>© 2025 <a href="https://google.com/" style="color: #ecf0f1;">Harideep Tailors</a></small>
</div>

</body>
</html>
