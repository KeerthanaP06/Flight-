<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="Login.FlightBooking" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Details</title>
    <style>
        body {
            background-image: url('Availability.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }

        /* Style for the pop-up container */
        .popup-container {
            position: absolute;
            top: 50px; /* Adjust the top position as needed */
            right: 50px; /* Adjust the right position as needed */
            width: 300px;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* Style for the form inside the pop-up container */
        .popup-form {
            display: flex;
            flex-direction: column;
        }

        /* Style for the "Calculate" button */
        .calculate-button {
            margin-top: 10px;
            align-self: flex-end;
        }
    </style>
</head>
<body>
    <h1>Flight Details</h1>
    <p>These are the flights availability we have  </p>
    <% 
       try {
           String flightDetails = FlightBooking.getFlightDetails();
    %>
           <%= flightDetails %>
    <%
       } catch (Exception e) {
           out.println("An error occurred: " + e.getMessage());
       }
    %>
   <p>Do you want to continue Booking, Click on continueButton</p>
    <form action="NextPage" method="post">
        <input type="submit" value="continueButton">
    </form>

    <!-- Pop-up container for city_from and destination form -->
<div class="popup-container">
    <h2>Calculate Shortest Path</h2>
    <form class="popup-form" action="CalculateShortestPath" method="post">
        <label for="city_from">City From:</label>
        <input type="text" id="city_from" name="city_from" required><br>

        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination" required><br>

        <input type="submit" class="calculate-button" value="Calculate">
        
    </form>
    
    <!-- Add a div to display the shortest distance result below the form -->
    <div id="shortestDistanceResult"></div>
</div>
    

<script>
    document.querySelector('form').addEventListener('submit', function (e) {
        e.preventDefault(); // Prevent the default form submission

        // Get city_from and destination values
        var cityFrom = document.getElementById('city_from').value;
        var destination = document.getElementById('destination').value;

        // Create an XMLHttpRequest
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'CalculateShortestPath', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Define a function to handle the response
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response from the servlet
                var response = xhr.responseText;
                // Display the shortest distance in the result div
                document.getElementById('shortestDistanceResult').textContent = "Shortest Distance: " + response;
            }
        };

        // Send the XMLHttpRequest with form data
        xhr.send('city_from=' + cityFrom + '&destination=' + destination);
    });
</script>

    
    
    <script>
        document.querySelector('form').addEventListener('submit', function (e) {
            e.preventDefault(); // Prevent the default form submission

            // Create an XMLHttpRequest
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'Booking.jsp', true);

            // Define a function to handle the response
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Handle the response from the next server
                    var response = xhr.responseText;
                    alert('Response from server: ' + response);
                    // Optionally, you can navigate to the next page using JavaScript:
                    window.location.href = 'Booking.jsp';
                }
            };

            // Send the XMLHttpRequest
            xhr.send();
        });

    </script>
</body>
</html>
