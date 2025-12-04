<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eDonorNet - Sign Up</title>
    <style>
        /* General Theme and Background */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6; /* Light, clean background */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        /* Card Container for the Form */
        .signup-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px; /* Slightly wider for more fields */
            text-align: center;
        }
        /* Header Styling */
        .signup-header {
            color: #d62d20; /* A strong red for a blood bank theme */
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 600;
        }
        /* Input Field Styling */
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: 500;
        }
        .input-group input, .input-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        .input-group input:focus, .input-group select:focus {
            border-color: #d62d20;
            outline: none;
        }
        /* Button Styling */
        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s, opacity 0.3s;
            width: 100%;
            margin-top: 10px;
        }
        .btn-signup {
            background-color: #d62d20; /* Primary button - Red */
            color: white;
        }
        .login-option {
            margin-top: 25px;
            color: #666;
            font-size: 14px;
        }
        .login-option a {
            color: #d62d20;
            text-decoration: none;
            font-weight: 600;
        }
        .login-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="signup-container">
    <div class="signup-header">
        eDonorNet Sign Up
    </div>
    <form action="/create_admin" method="post">
        <div class="input-group">
            <label for="org_name">Organization/Blood Bank Name</label>
            <input type="text" id="name" name="name" required>
        </div>

        <div class="input-group">
            <label for="email">Contact Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="input-group">
            <label for="role">Desired Admin Role</label>
            <select id="role" name="role" required>
                <option value="" disabled selected>Select your role</option>
                <option value="system_admin">System Admin</option>
                <option value="organization_admin">Organization Admin</option>
                <option value="blood_bank_admin">Blood Bank Admin</option>
            </select>
        </div>

        <div class="input-group">
            <label for="new_password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>

        <div class="input-group">
            <label for="confirm_password">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirm_password" required>
        </div>
        <div class="options-group">
            <div class="accept-conditions" style="text-align: left">
                <input type="checkbox" id="accept_conditions" name="accept_conditions" required>
                <label for="accept_conditions">I accept the conditions</label>
            </div>
        </div>

        <button type="submit" class="btn btn-signup">
            CREATE ACCOUNT
        </button>
    </form>

    <div class="login-option">
        Already have an account?
        <a href="/admin/signin">Log In</a>
    </div>
</div>
</body>
</html>