<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $movie_title = $_POST['movie_title'];
    $user_id = $_POST['user_id'];
    $review = $_POST['review'];

    // Establish database connection
    $conn = new mysqli('localhost', 'root', '2022', 'movies');

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Inline CSS for styling the messages
    echo "<style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f9;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .message-container {
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                width: 50%;
                text-align: center;
            }

            .message-container h2 {
                color: #333;
            }

            .success {
                color: #27ae60;
                background-color: #eaf7ec;
                border: 1px solid #27ae60;
                padding: 15px;
                border-radius: 5px;
                font-size: 18px;
            }

            .error {
                color: #e74c3c;
                background-color: #f8d7da;
                border: 1px solid #e74c3c;
                padding: 20px;
                border-radius: 5px;
                font-size: 18px;
                font-weight: bold;
            }

            .error p {
                font-size: 16px;
                font-weight: normal;
            }

            .button {
                background-color: #3498db;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }

            .button:hover {
                background-color: #2980b9;
            }

            .button:focus {
                outline: none;
            }
        </style>";

    // Step 1: Check if the review already exists
    $check_query = "SELECT * FROM reviews WHERE title = ? AND user = ?";
    if ($stmt_check = $conn->prepare($check_query)) {
        $stmt_check->bind_param("ss", $movie_title, $user_id);
        $stmt_check->execute();
        $result_check = $stmt_check->get_result();

        if ($result_check->num_rows > 0) {
            // Review already exists for this movie and user, show a message
            echo "<div class='message-container'>
                    <div class='error'>
                        <h2>Error: Duplicate Review</h2>
                        <p>You have already submitted a review for the movie <strong>'$movie_title'</strong> with the same User ID. Please submit a different review or modify your existing review.</p>
                    </div>
                    <button class='button' onclick='window.history.back()'>Go Back</button>
                  </div>";
        } else {
            // Step 2: If no existing review, insert the new review
            $stmt = $conn->prepare("INSERT INTO reviews (title, user, review) VALUES (?, ?, ?)");
            if ($stmt) {
                $stmt->bind_param("sss", $movie_title, $user_id, $review);
                if ($stmt->execute()) {
                    echo "<div class='message-container'>
                            <div class='success'>
                                <h2>Review Submitted</h2>
                                <p>Your review has been submitted successfully!</p>
                            </div>
                            <button class='button' onclick='window.history.back()'>Go Back</button>
                          </div>";
                } else {
                    echo "<div class='message-container'>
                            <div class='error'>
                                <h2>Error Submitting Review</h2>
                                <p>There was an issue with your submission. Please try again later. If the problem persists, contact support.</p>
                            </div>
                            <button class='button' onclick='window.history.back()'>Go Back</button>
                          </div>";
                }
                $stmt->close();
            } else {
                echo "<div class='message-container'>
                        <div class='error'>
                            <h2>Error: Failed to Prepare Insert Statement</h2>
                            <p>There was an error preparing the insert statement. Please try again later.</p>
                        </div>
                        <button class='button' onclick='window.history.back()'>Go Back</button>
                      </div>";
            }
        }

        // Close the check statement
        $stmt_check->close();
    } else {
        echo "<div class='message-container'>
                <div class='error'>
                    <h2>Error: Failed to Prepare Check Statement</h2>
                    <p>There was an error preparing the check statement. Please try again later.</p>
                </div>
                <button class='button' onclick='window.history.back()'>Go Back</button>
              </div>";
    }

    // Close the database connection
    $conn->close();
}
?>
