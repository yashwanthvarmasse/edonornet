<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credential Support - eDonor Net Admin</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 800px;
            width: 100%;
            border-top: 5px solid #0056b3;
            max-height: 90vh;
            overflow-y: auto;
        }

        .icon {
            color: #007bff;
            font-size: 48px;
            margin-bottom: 15px;
        }

        h1 {
            color: #0056b3;
            margin-bottom: 15px;
            font-size: 24px;
            word-wrap: break-word;
        }

        h2 {
            color: #333;
            margin-top: 20px;
            margin-bottom: 8px;
            font-size: 1.1em;
        }

        p {
            margin-bottom: 15px;
            line-height: 1.5;
            font-size: 15px;
        }

        .contact-info {
            background-color: #e9f5ff;
            border: 1px solid #b3d9ff;
            padding: 15px;
            border-radius: 4px;
            text-align: left;
            margin: 15px 0;
        }

        .contact-info strong {
            display: block;
            margin-bottom: 5px;
            color: #007bff;
        }

        .contact-info p {
            margin-bottom: 10px;
        }

        .contact-info a {
            color: #007bff;
            word-wrap: break-word;
            overflow-wrap: break-word;
        }

        .action-link {
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 10px 25px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 15px;
            display: inline-block;
            width: 100%;
            max-width: 250px;
        }

        .action-link:hover {
            background-color: #1e7e34;
        }

        /* Mobile optimization */
        @media (max-width: 768px) {
            .container {
                padding: 25px 20px;
            }

            h1 {
                font-size: 20px;
                margin-bottom: 15px;
            }

            h2 {
                font-size: 1em;
                margin-top: 20px;
            }

            p {
                font-size: 14px;
                margin-bottom: 15px;
            }

            .icon {
                font-size: 40px;
                margin-bottom: 12px;
            }

            .contact-info {
                padding: 15px;
            }

            .action-link {
                padding: 12px 20px;
                font-size: 14px;
            }
        }

        /* Small mobile devices */
        @media (max-width: 480px) {
            body {
                padding: 15px;
            }

            .container {
                padding: 20px 15px;
                border-top-width: 4px;
            }

            h1 {
                font-size: 18px;
            }

            h2 {
                font-size: 0.95em;
            }

            p {
                font-size: 13px;
            }

            .icon {
                font-size: 36px;
            }

            .contact-info {
                padding: 12px;
                font-size: 13px;
            }

            .action-link {
                max-width: 100%;
                padding: 10px 15px;
            }
        }

        /* Large desktop screens */
        @media (min-width: 1200px) {
            .container {
                padding: 40px;
            }

            h1 {
                font-size: 26px;
            }

            p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="icon">
        &#128222;
    </div>

    <h1>ADMIN CREDENTIAL SUPPORT</h1>

    <p>
        For security and compliance reasons within the <strong>eDonor Net</strong>, all Admin ID credential changes (including password resets) must be processed through the designated <strong>System Administration Team</strong>.
    </p>

    <h2>Forgot Password or ID?</h2>
    <p>
        If you have forgotten your password or ID, please initiate the request by contacting our support team directly. For security, we do not allow self-service password resets for Admin accounts.
    </p>

    <h2>Need to Change Your Current Password?</h2>
    <p>
        If you are currently logged in and wish to change your password, please use the dedicated <strong>User Profile</strong> area within the admin dashboard, or contact the appropriate team if required by policy.
    </p>

    <div class="contact-info">
        <strong>eDonor Net Admin Support:</strong>
        <p>
            <strong>Email:</strong> <a href="mailto:edonornet@gmail.com">edonornet@gmail.com</a>
            <strong>Phone:</strong> +91 9030726301 (Internal Admin Line)
            <strong>Hours:</strong> 24/7 Support
        </p>
    </div>

    <p>
        <a href="/admin/signin" class="action-link">Return to Login Page</a>
    </p>
</div>

</body>
</html>