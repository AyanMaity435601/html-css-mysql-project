<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "2022";
$dbname = "movies";

// Create a connection to MySQL
$conn = new mysqli($servername, $username, $password, $dbname);

// Check for database connection error
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['search'])) {
    $searchQuery = $_POST['search_query'];

    // Query to fetch the required movie details
    $query = "
        SELECT 
            m.title AS Movie_Title,
            s.starname AS Star_Name,
            sa.role AS Role
        FROM 
            movies m
        JOIN 
            starsin sa ON m.title = sa.title
        JOIN 
            stardetails s ON sa.starname = s.starname
        WHERE
            LOWER(m.title) LIKE LOWER(?)
        ORDER BY 
            m.title ASC, s.starname ASC;
    ";

    // Prepare and bind the query
    if ($stmt = $conn->prepare($query)) {
        $searchQueryLike = "%$searchQuery%";
        $stmt->bind_param("s", $searchQueryLike);

        // Execute the query
        $stmt->execute();
        $stmt->bind_result($movie_title, $star_name, $role);

        // Start output with inline CSS
        echo "
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .empty-results td {
                text-align: center;
                font-style: italic;
                color: #999;
                background-color: #f8f8f8;
                padding: 20px;
            }
        </style>
        ";

        // Output the results
        echo "<h2>Search Results for '$searchQuery'</h2>";
        echo "<table>
                <tr>
                    <th>Movie Title</th>
                    <th>Star Name</th>
                    <th>Role</th>
                </tr>";

        $result_found = false;

        // Fetch results and populate the table rows
        while ($stmt->fetch()) {
            $result_found = true;
            echo "<tr>
                    <td>$movie_title</td>
                    <td>$star_name</td>
                    <td>$role</td>
                  </tr>";
        }

        // If no results, display an empty row with a message
        if (!$result_found) {
            echo "<tr class='empty-results'>
                    <td colspan='3'>No results found for '$searchQuery'.</td>
                  </tr>";
        }

        // End the table
        echo "</table>";

        // Close the statement
        $stmt->close();
    } else {
        // Error handling for query preparation failure
        echo "Error preparing the statement: " . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>
