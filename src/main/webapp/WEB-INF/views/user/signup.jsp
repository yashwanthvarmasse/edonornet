<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5; /* Light grey background */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh; /* Full viewport height */
            padding: 20px; /* Padding around the main container */
            margin: 0;
        }

        /* Main Auth Container - Holds both left and right sides */
        .auth-container {
            width: 100%;
            max-width: 1000px; /* Reduced max-width for smaller overall size */
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden; /* Ensures rounded corners are respected */
            display: flex; /* Use flexbox for side-by-side layout */
            min-height: 600px; /* Minimum height for the entire box */
            max-height: 80vh; /* Max height to fit within viewport, enables scrolling if needed */
            margin: auto;
        }

        /* Back Button Styling (positioned relative to the body) */
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 10;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: #333;
            transition: background-color 0.2s;
        }
        .back-button:hover {
            background-color: #f8f9fa;
        }

        /* Left Side: Image and Text Container */
        .auth-image-container {
            background: linear-gradient(rgba(229, 57, 53, 0.8), rgba(229, 57, 53, 0.8)),
            url('https://images.unsplash.com/photo-1576091160550-2173dba999ef');
            background-size: cover;
            background-position: center;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
            width: 100%;
            max-width: 500px;
        }

        .auth-image-container img {
            position: absolute;
            bottom: -50px; /* Adjust as needed to show desired part of the image */
            left: 50%;
            transform: translateX(-50%);
            max-width: 120%; /* Image can be slightly larger to fill space */
            height: auto;
            opacity: 0.8; /* Slightly transparent */
            filter: grayscale(20%); /* Subtle grayscale */


        }

        .auth-image-container h1, .auth-image-container p, .auth-image-container .icon-group {
            position: relative; /* Bring text/icons above the image */
            z-index: 2;
            text-shadow: 0 2px 5px rgba(0,0,0,0.3);
        }

        .auth-image-container .icon-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 0.95rem; /* Slightly smaller text for features */
            max-width: 250px; /* Constrain width for better readability */
            text-align: left;
        }
        .auth-image-container .icon-group i {
            font-size: 1.2rem; /* Smaller icons */
            margin-right: 10px;
            min-width: 25px; /* Ensure icon doesn't shrink */
        }

        /* Right Side: Form Container */
        .auth-form-container {
            flex: 1; /* Takes equal space with the image container */
            padding: 30px; /* Reduced padding for smaller size */
            background-color: #ffffff;
            overflow-y: auto; /* Enable vertical scrolling for the form */
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Pushes footer text to bottom */
        }

        .form-title {
            font-weight: 700;
            color: #333;
            margin-bottom: 1.5rem; /* Reduced margin */
            text-align: center;
        }

        .auth-toggle {
            font-weight: 600;
            color: #e53935;
            text-decoration: none;
        }
        .auth-toggle:hover {
            text-decoration: underline;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .auth-image-container {
                display: none; /* Hide image on smaller screens */
            }
            .auth-form-container {
                flex-basis: 100%; /* Form takes full width */
                padding: 25px;
            }
            .auth-container {
                max-height: 95vh; /* Allow more vertical space on mobile */
                min-height: unset; /* Remove min-height restriction */
            }
        }
        @media (max-width: 768px) {
            .back-button {
                top: 10px;
                left: 10px;
            }
            .auth-container {
                margin: 10px;
                max-width: 450px; /* Even smaller for mobile */
            }
            .auth-form-container {
                padding: 20px;
            }
            .form-title {
                margin-bottom: 1rem;
            }
        }
    </style>
</head>

<body>

<button class="back-button" onclick="window.location.href='/'">
    <i class="fas fa-arrow-left"></i>
</button>

<div class="auth-container">

    <div class="auth-image-container d-none d-lg-flex">
        <img src="https://cdni.iconscout.com/illustration/premium/thumb/blood-donation-2139686-1804193.png" alt="Blood Donation">
        <h1 class="display-4 fw-bold">Become a Life-Saver</h1>
        <p class="lead">Join our community of blood donors and help save lives today.</p>
        <div class="mt-4">
            <div class="icon-group">
                <i class="fas fa-check-circle"></i>
                <span>Quick and easy registration</span>
            </div>
            <div class="icon-group">
                <i class="fas fa-user-friends"></i>
                <span>Get matched with patients in need</span>
            </div>
            <div class="icon-group">
                <i class="fas fa-hand-holding-heart"></i>
                <span>Make a difference in your community</span>
            </div>
        </div>
    </div>

    <div class="auth-form-container">
        <div> <h2 class="form-title">Create Account</h2>

            <form id="registerUserForm" action="/create_user" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstname" name="firstname" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastname" name="lastname" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="signupEmail" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="signupEmail" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required>
                </div>

                <div class="mb-3">
                    <label for="signupPassword" class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="signupPassword" name="password"
                               required>
                        <button class="btn btn-outline-secondary" type="button" id="toggleSignupPassword">
                            <i class="far fa-eye"></i>
                        </button>
                    </div>
                    <small class="form-text d-block mt-2">
                        <a href="#" class="text-danger" data-bs-toggle="modal"
                           data-bs-target="#passwordPolicyModal"> password policies</a>
                    </small>
                    <small id="passwordPolicyError" class="text-danger d-none">Password does not meet policy requirements</small>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="confirmPassword"
                               name="confirmpassword" required>
                        <button class="btn btn-outline-secondary" type="button" id="toggleConfirmPassword">
                            <i class="far fa-eye"></i>
                        </button>
                    </div>
                    <small id="passwordMatchError" class="text-danger d-none">Passwords don't match</small>
                </div>

                <div class="mb-3">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" name="dob" required>
                </div>

                <div class="mb-3">
                    <label for="bloodGroupSelect" class="form-label">Blood Group</label>
                    <select class="form-select" id="bloodGroupSelect" name="blood" required>
                        <option value="" selected disabled>Select Your Blood Group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                    <label class="form-check-label" for="agreeTerms">
                        I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
                    </label>
                </div>
                <button type="submit" id="createAccountBtn" class="btn btn-danger w-100 py-2 mb-3"
                        disabled>Create Account</button>
            </form>
        </div>

        <p class="text-center mt-3">Already have an account?
            <a href="/user/signin" class="auth-toggle">Sign in</a>
        </p>
    </div>
</div>


<div class="modal fade" id="passwordPolicyModal" tabindex="-1" aria-labelledby="passwordPolicyModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="passwordPolicyModalLabel">Password Policies</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul>
                    <li id="modal-policy-length">Min 8 characters</li>
                    <li id="modal-policy-capital">At least one capital letter (A-Z)</li>
                    <li id="modal-policy-small">At least one small letter (a-z)</li>
                    <li id="modal-policy-number">At least one number (0-9)</li>
                    <li id="modal-policy-special">At least one special character (e.g., !@#$%^&*)</li>
                </ul>
                <p class="text-muted">Your password must meet all these criteria.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Got It</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function checkFormValidity() {
        const firstName = document.getElementById('firstname').value;
        const lastName = document.getElementById('lastname').value;
        const email = document.getElementById('signupEmail').value;
        const phone = document.getElementById('phone').value;
        const password = document.getElementById('signupPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const dob = document.getElementById('dob').value;
        const bloodGroupSelected = document.getElementById('bloodGroupSelect').value;
        const termsChecked = document.getElementById('agreeTerms').checked;

        const matchErrorElement = document.getElementById('passwordMatchError');
        const policyErrorElement = document.getElementById('passwordPolicyError');
        const submitBtn = document.getElementById('createAccountBtn');

        const requiredFieldsFilled = firstName && lastName && email && phone && dob;

        const hasLength = password.length >= 8;
        const hasCapital = /[A-Z]/.test(password);
        const hasSmall = /[a-z]/.test(password);
        const hasNumber = /[0-9]/.test(password);
        const hasSpecial = /[^A-Za-z0-9]/.test(password);
        const isPolicyMet = hasLength && hasCapital && hasSmall && hasNumber && hasSpecial;

        const passwordsMatch = password === confirmPassword;

        const bloodGroupIsValid = bloodGroupSelected !== "";

        if (password.length > 0 && !isPolicyMet) {
            policyErrorElement.classList.remove('d-none');
        } else {
            policyErrorElement.classList.add('d-none');
        }

        if (confirmPassword.length > 0 && !passwordsMatch) {
            matchErrorElement.classList.remove('d-none');
        } else {
            matchErrorElement.classList.add('d-none');
        }

        const allConditionsMet =
            requiredFieldsFilled &&
            isPolicyMet &&
            passwordsMatch &&
            bloodGroupIsValid &&
            termsChecked;

        submitBtn.disabled = !allConditionsMet;
    }

    function setupPasswordToggle(toggleId, inputId) {
        const toggle = document.getElementById(toggleId);
        const input = document.getElementById(inputId);
        const icon = toggle.querySelector('i');

        toggle.addEventListener('click', function () {
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);
            icon.classList.toggle('fa-eye');
            icon.classList.toggle('fa-eye-slash');
            input.focus();
        });
    }

    document.addEventListener('DOMContentLoaded', function () {

        if (document.getElementById('toggleSignupPassword')) {
            setupPasswordToggle('toggleSignupPassword', 'signupPassword');
            setupPasswordToggle('toggleConfirmPassword', 'confirmPassword');
        }

        document.getElementById('firstname').addEventListener('input', checkFormValidity);
        document.getElementById('lastname').addEventListener('input', checkFormValidity);
        document.getElementById('signupEmail').addEventListener('input', checkFormValidity);
        document.getElementById('phone').addEventListener('input', checkFormValidity);
        document.getElementById('signupPassword').addEventListener('input', checkFormValidity);
        document.getElementById('confirmPassword').addEventListener('input', checkFormValidity);
        document.getElementById('dob').addEventListener('change', checkFormValidity);
        document.getElementById('agreeTerms').addEventListener('change', checkFormValidity);
        document.getElementById('bloodGroupSelect').addEventListener('change', checkFormValidity);

        checkFormValidity();
    });
</script>
</body>

</html>