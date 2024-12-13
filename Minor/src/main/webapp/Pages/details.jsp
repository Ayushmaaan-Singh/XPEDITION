<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profiles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            margin-top: 50px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        table th {
            background-color: #4CAF50;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        table tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Profiles</h1>
        <table id="userTable">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Number</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Date of Birth</th>
                </tr>
            </thead>
            <tbody>
                <!-- Content will be populated dynamically -->
            </tbody>
        </table>
    </div>
    <script>
        // Fetch user data from the servlet and populate the table
        fetch('/users')
            .then(response => response.json())
            .then(data => {
                const tableBody = document.querySelector('#userTable tbody');
                tableBody.innerHTML = ''; // Clear any existing rows

                data.forEach(user => {
                    const row = document.createElement('tr');
                    const dob = user.dob !== "N/A" ? new Date(user.dob).toLocaleDateString() : 'N/A';

                    row.innerHTML = "
                        <td>${user.name}</td>
                        <td>${user.number}</td>
                        <td>${user.email}</td>
                        <td>${user.address}</td>
                        <td>${dob}</td>
                    ";
                    tableBody.appendChild(row);
                });
            })
            .catch(error => console.error('Error fetching user data:', error));
    </script>
</body>
</html>
