<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit a Review for a Movie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Submit a Review for a Movie</h1>
    <form method="POST" action="submit_review.php">
        <!-- Dropdown for selecting the movie -->
        <label for="movie_title">Select Movie:</label>
        <select name="movie_title" id="movie_title" required>
            <?php
            // Establish a connection to the database
            $conn = new mysqli('localhost', 'root', '2022', 'movies');

            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Query to fetch movie titles
            $query = "SELECT title FROM movies";
            $result = $conn->query($query);

            // Populate dropdown with movie titles
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    // Add movie titles to the dropdown
                    echo "<option value='" . htmlspecialchars($row['title'], ENT_QUOTES) . "'>" 
                         . htmlspecialchars($row['title'], ENT_QUOTES) . "</option>";
                }
            } else {
                echo "<option disabled>No movies available</option>";
            }

            // Close the database connection
            $conn->close();
            ?>
        </select><br><br>

        <!-- Textbox for entering user ID -->
        <label for="user_id">User ID:</label>
        <input type="text" name="user_id" id="user_id" required><br><br>

        <!-- Textarea for entering review -->
        <label for="review">Review:</label><br>
        <textarea name="review" id="review" rows="12" cols="80" maxlength="1000" required></textarea><br><br>

        <!-- Submit button -->
        <button type="submit" name="submit_review">Submit Review</button>
    </form>
</body>
</html>
