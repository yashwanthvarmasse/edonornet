<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eDonorNet - Login</title>
    <style>
        /* General Theme and Background */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        /* Card Container for the Form */
        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        /* Header Styling */
        .login-header {
            color: #d62d20;
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
        /* Checkbox Area (Restored from original design) */
        .options-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            font-size: 14px;
        }
        .accept-conditions label {
            user-select: none;
            color: #555;
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
        .btn-login {
            background-color: #d62d20;
            color: white;
        }
        .btn-login:disabled {
            background-color: #e59999;
            cursor: not-allowed;
            opacity: 0.7;
        }
        .btn-link {
            background: none;
            color: #007bff;
            text-align: right;
            padding: 0;
            margin-top: 10px;
            text-decoration: none;
            border: none;
        }
        .btn-link:hover {
            text-decoration: underline;
        }
        .btn-link:focus {
            outline: none;
            box-shadow: none;
            text-decoration: underline;
        }
        .signup-option {
            margin-top: 25px;
            color: #666;
            font-size: 14px;
        }
        .signup-option a {
            color: #d62d20;
            text-decoration: none;
            font-weight: 600;
        }
        .signup-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        eDonorNet Login
    </div>
    <form action="/validate_admin" method="post">
        <div class="input-group">
            <label for="role">User Role</label>
            <select id="role" name="role" required>
                <option value="" disabled selected>Select your role</option>
                <option value="system_admin">System Admin</option>
                <option value="organization_admin">Organization Admin</option>
                <option value="blood_bank_admin">Blood Bank Admin</option>
            </select>
        </div>

        <div class="input-group">
            <label for="user_id">User ID</label>
            <input type="text" id="orgId" name="orgId" placeholder="Enter your ID" required>
        </div>

        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>

        <div style="text-align: right">
            <button type="button" class="btn-link"><a href="/admin/forgotpassword">Forget Password?</a></button>
        </div>

        <button type="submit" class="btn btn-login" id="login_btn">
            LOG IN
        </button>
    </form>

    <div class="signup-option">
        Don't have an account?
        <a href="/admin/signup">Sign Up</a>
    </div>
</div>
</body>
</html>