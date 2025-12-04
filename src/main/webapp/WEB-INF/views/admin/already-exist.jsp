<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Already Logged In - eDonor Net Admin</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 700px;
            width: 100%;
            border-left: 5px solid #009933;
            max-height: 90vh;
            overflow-y: auto;
        }

        .icon {
            color: #009933;
            font-size: 48px;
            margin-bottom: 15px;
        }

        h1 {
            color: #009933;
            margin-bottom: 10px;
            font-size: 24px;
            word-wrap: break-word;
        }

        p {
            margin-bottom: 20px;
            line-height: 1.5;
            font-size: 15px;
        }

        .message-box {
            font-weight: bold;
            color: #222;
            padding: 10px;
            background-color: #e6ffe6;
            border-radius: 4px;
            display: inline-block;
            margin-bottom: 20px;
            word-wrap: break-word;
        }

        .action-link {
            text-decoration: none;
            color: white;
            font-weight: bold;
            padding: 12px 25px;
            background-color: #007bff;
            border-radius: 4px;
            transition: background-color 0.3s;
            display: inline-block;
            width: 100%;
            max-width: 250px;
        }

        .action-link:hover {
            background-color: #0056b3;
        }

        .support-button {
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
            display: inline-block;
            margin-top: 15px;
            max-width: 250px;
        }

        .support-button:hover {
            background-color: #1e7e34;
        }

        /* Mobile optimization */
        @media (max-width: 768px) {
            .container {
                padding: 30px 25px;
            }

            h1 {
                font-size: 20px;
                margin-bottom: 8px;
            }

            p {
                font-size: 14px;
                margin-bottom: 20px;
            }

            .icon {
                font-size: 40px;
                margin-bottom: 12px;
            }

            .message-box {
                padding: 8px 10px;
                font-size: 14px;
                margin-bottom: 20px;
            }

            .action-link {
                padding: 12px 20px;
                font-size: 14px;
            }

            .support-button {
                padding: 10px 15px;
                font-size: 14px;
                width: 100%;
            }
        }

        /* Small mobile devices */
        @media (max-width: 480px) {
            body {
                padding: 15px;
            }

            .container {
                padding: 25px 20px;
                border-left-width: 4px;
            }

            h1 {
                font-size: 18px;
            }

            p {
                font-size: 13px;
                margin-bottom: 18px;
            }

            .icon {
                font-size: 36px;
            }

            .message-box {
                padding: 8px;
                font-size: 13px;
                margin-bottom: 18px;
            }

            .action-link {
                max-width: 100%;
                padding: 10px 15px;
                font-size: 14px;
            }
        }

        /* Large desktop screens */
        @media (min-width: 1200px) {
            .container {
                padding: 45px;
            }

            h1 {
                font-size: 26px;
            }

            p {
                font-size: 16px;
            }

            .icon {
                font-size: 52px;
            }

            .message-box {
                padding: 12px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="icon">
        &#10003;
    </div>

    <h1>ADMIN ACCESS GRANTED</h1>

    <div class="message-box">
        Access is already granted for this ID.
    </div>

    <p>
        Your current (Email: <strong>{email}</strong>) is already authenticated with Administrator privileges in the eDonor Net system.
    </p>

    <p>
        If you believe this is an error, please contact your system administrator or the eDonor Net support team.
    </p>

    <p>
        <a href="/admin/signin" class="action-link">Go to Admin Login</a>
    </p>

    <a href="mailto:edonornet@gmail.com" class="support-button">Contact Customer Support</a>
</div>

</body>
</html>