<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed - eDonor Net Admin</title>
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
            border-top: 5px solid #ff9900;
            max-height: 90vh;
            overflow-y: auto;
        }

        .icon {
            color: #ff9900;
            font-size: 48px;
            margin-bottom: 15px;
        }

        h1 {
            color: #333;
            margin-bottom: 15px;
            font-size: 24px;
            word-wrap: break-word;
        }

        p {
            margin-bottom: 18px;
            line-height: 1.5;
            color: #666;
            font-size: 15px;
        }

        .message-box {
            font-weight: bold;
            color: #b00000;
            padding: 12px;
            background-color: #ffe0e0;
            border: 1px solid #ff9900;
            border-radius: 4px;
            margin-bottom: 20px;
            font-size: 1.1em;
            word-wrap: break-word;
        }

        .links-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        .action-link {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s;
        }

        .action-link:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        .separator {
            color: #999;
            margin: 0 5px;
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
                margin-bottom: 12px;
            }

            p {
                font-size: 14px;
                margin-bottom: 18px;
            }

            .icon {
                font-size: 40px;
                margin-bottom: 12px;
            }

            .message-box {
                padding: 10px;
                font-size: 1em;
                margin-bottom: 20px;
            }

            .links-container {
                flex-direction: column;
                gap: 15px;
            }

            .separator {
                display: none;
            }
        }

        /* Small mobile devices */
        @media (max-width: 480px) {
            body {
                padding: 15px;
            }

            .container {
                padding: 25px 20px;
                border-top-width: 4px;
            }

            h1 {
                font-size: 18px;
            }

            p {
                font-size: 13px;
                margin-bottom: 16px;
            }

            .icon {
                font-size: 36px;
            }

            .message-box {
                padding: 10px;
                font-size: 0.95em;
                margin-bottom: 18px;
            }

            .action-link {
                font-size: 14px;
            }

            .support-button {
                padding: 10px 15px;
                font-size: 14px;
                width: 100%;
                max-width: 250px;
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
                font-size: 1.15em;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="icon">
        &#128274;
    </div>

    <h1>Login Attempt Failed</h1>

    <div class="message-box">
        ERROR: The Admin ID or Password provided is incorrect.
    </div>

    <p>
        Please check your <strong>Admin ID</strong> and <strong>Password</strong> and try again. Credentials are case-sensitive.
    </p>

    <div class="links-container">
        <a href="/admin/signin" class="action-link">Try Logging In Again</a>
        <span class="separator">|</span>
        <a href="/admin/forgot-password" class="action-link">Forgot Password?</a>
    </div>

    <a href="mailto:edonornet@gmail.com" class="support-button">Contact Customer Support</a>
</div>

</body>
</html>