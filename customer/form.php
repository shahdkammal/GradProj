<?php
ob_start(); // Start output buffering
define('MYSITE', true);
include './../db/dbconnect.php';

$title = 'Main';
$css_directory = '../css/main.min.css';
$css_directory2 = '../css/main.min.css.map';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   
    $name = $_POST["name"];
    $message = $_POST["message"];
    $priority = filter_input(INPUT_POST, "priority", FILTER_VALIDATE_INT);
    $type = filter_input(INPUT_POST, "type", FILTER_VALIDATE_INT);
    $terms = filter_input(INPUT_POST, "terms", FILTER_VALIDATE_BOOL);

    $host = "localhost";
    $dbname = "hs";
    $username = "root";
    $password = "";

    $conn = mysqli_connect($host, $username, $password, $dbname);

    if (mysqli_connect_errno()) {
        die("Connection error: " . mysqli_connect_errno());
    }

    $sql = "INSERT INTO feedback (name, body, priority, type) VALUES (?, ?, ?, ?)";
    
    $stmt = mysqli_stmt_init($conn);

    if (!mysqli_stmt_prepare($stmt, $sql)) {
        die(mysqli_error($conn));
    }

    mysqli_stmt_bind_param($stmt, "ssii", $name, $message, $priority, $type);

    if (mysqli_stmt_execute($stmt)) {
        echo "Feedback submitted successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }

    mysqli_stmt_close($stmt);
    mysqli_close($conn);
}
?>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.min.css" />
    <title>contact</title>
    <meta charset="UTF-8" />
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f9;
            color: #333;
        }

        .section__title {
            font-size: 2rem;
            color: #333;
            text-align: center;
            margin-bottom: 2rem;
        }

        .feedback__container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            padding: 2rem;
            width: 1300px;
            margin: 0 auto;
            margin-left: -270px;
        }

        .feedback__card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .feedback__card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .feedback__title {
            font-size: 1.5rem;
            margin: 0.5rem 0;
            color: #0077cc;
        }

        .feedback__date {
            font-size: 0.875rem;
            color: #555;
            margin-bottom: 1rem;
        }

        .feedback__data span {
            display: block;
            font-size: 1.125rem;
            font-weight: bold;
            color: #333;
        }

        .feedback__data p {
            font-size: 1rem;
            color: #444;
        }

        .message {
            background-color: white;
            border: 0.6px #0077cc solid;
            color: black;
        }

        .send-f {
            color: #0077cc;
        }

        .priority {
            background-color: #0077cc;
        }

        .button {
            background-color: #0077cc;
            font-size: 20px;
            width: 200px;
        }

        .button:hover {
            background-color: #f4f4f9;
            color: #0077cc;
            border: 2px #0077cc solid;
        }
    </style>

<body>
    <!-- Reviews Section -->
    <section class="feedback section" id="feedback">
        <h2 class="section__title">Check our reviews</h2>
        <div class="feedback__container container">
            <article class="feedback__card">
                <div class="feedback__data">
                    <span>Noha Ahmed</span>
                    <h2 class="feedback__title">Stairs & Columns</h2>
                    <h4 class="feedback__date">7/7/2024</h4>
                    <p>Best service ever.</p>
                </div>
            </article>
            <article class="feedback__card">
                <div class="feedback__data">
                    <span>Khalid Kamal</span>
                    <h2 class="feedback__title">Cleaning and Home Organizing</h2>
                    <h4 class="feedback__date">14/7/2024</h4>
                    <p>Loyal and organized person. Special thanks to Efreshli team.</p>
                </div>
            </article>
            <article class="feedback__card">
                <div class="feedback__data">
                <i class="fa-regular fa-user"></i>
                    <span>Farida Ibrahim</span>
                    <h2 class="feedback__title">Home Reset</h2>
                    <h4 class="feedback__date">1/8/2024</h4>
                    <p>Efficient work.</p>
                </div>
            </article>
        </div>
    </section>

    <h1 class="send-f">Send feedback</h1>
    <form action="process-form.php" method="post">
        
        <label for="name">Name</label>
        <input type="text" id="name" name="name" class="message">
        <label for="message">Message</label>
        <textarea id="message" name="message" class="message"></textarea>
        <br />
        <label for="priority">Priority</label>
        <select id="priority" name="priority" class="priority">
            <option value="1">Low</option>
            <option value="2" selected>Medium</option>
            <option value="3">High</option>
        </select>
        <br />
        <fieldset>
            <legend>Type</legend>
            <label>
                <input type="radio" name="type" value="1" />
                Complaint
            </label>
            <br />
            <label>
                <input type="radio" name="type" value="2" />
                Suggestion
            </label>
            <br />
            <label>
                <input type="radio" name="type" value="3" checked />
                Positive feedback
            </label>
        </fieldset>
        <br />
        <button class="button">Send</button>
    </form>

    <!-- Back to Home Button -->
    <div class="back-home">
        <a href="customer_index.php">Back to Home</a>
    </div>
</body>
