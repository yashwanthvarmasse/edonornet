<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary: #e53935;
            --secondary: #1976d2;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px 0;
        }

        .auth-container {
            width: 100%;
            /* --- EDITED --- */
            /* Was 1000px, now smaller to fit just the form */
            max-width: 550px;
            margin: auto;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }


        .auth-form {
            background-color: white;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: 500px; /* You can adjust this min-height if you like */
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        .btn-primary:hover {
            background-color: #c62828;
            border-color: #c62828;
        }

    </style>
</head>
<body>

<div class="container auth-container">
    <div class="auth-form">

        <h3 class="mb-3 text-center">Forgot Your Password?</h3>
        <p class="text-muted mb-4 text-center">
            No problem!!!
            Enter your email address below and we will send you a link to reset it.
        </p>

        <form action="/passwordreset" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Your Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="example@email.com" required>
            </div>

            <button type="submit" class="btn btn-primary w-100 py-2 mt-3">
                Send Reset Link
            </button>
        </form>

        <div class="text-center mt-4">
            <p class="text-muted">
                Remembered your password?
                <a href="/user/signin">Back to Login</a>
            </p>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>