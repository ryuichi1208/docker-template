<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Docker LAMP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <ul>
    <?php
        $ip = 'db'; // docker-composeのサービス名
        $user = 'tamayan';
        $pass = '_Password123';
        $dbName = 'lamp_database';

        // Connect
        $mysql = new mysqli($ip, $user, $pass, $dbName);

        // Show Error
        if ($mysql->connect_error) {
            echo "Error：".$mysql->connect_error;
            // Close DB
            $mysql->close();
            exit();
        }

        $sql = 'SELECT * FROM m_user';

        // Show Result
        if ($result = $mysql->query($sql)) {
            while ($row = $result->fetch_assoc()) {
                echo "<li>".$row['id']."：".$row['name']."</li>";
            }
            $result->close();
        }
        $mysql->close();
    ?>
    </ul>
</body>

</html>
