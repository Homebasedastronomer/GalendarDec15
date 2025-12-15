<?php
// login.php - User authentication for administrators
require_once 'config.php';

// Prevent cached login page after successful sign-in
header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
header('Pragma: no-cache');
header('Expires: 0');

if (isLoggedIn()) {
    if (isSuperAdmin()) {
        header("Location: super_admin.php");
    } else {
        header("Location: admin.php");
    }
    exit();
}

$error = '';

if (isset($_GET['status']) && $_GET['status'] === 'archived') {
    $error = 'This account has been archived. Please contact the super admin.';
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    if (!empty($username) && !empty($password)) {
        try {
            $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
            $stmt->execute([$username]);
            $user = $stmt->fetch();

            if ($user && !empty($user['is_archived'])) {
                $error = "This account has been archived. Please contact the super admin.";
            } elseif ($user && password_verify($password, $user['password'])) {
                $login_ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : null;
                $updateLogin = $pdo->prepare("UPDATE users SET last_login_at = NOW(), last_login_ip = ? WHERE id = ?");
                $updateLogin->execute([$login_ip, $user['id']]);

                session_regenerate_id(true);
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['role'] = $user['role'];
                $_SESSION['full_name'] = $user['full_name'];
                $_SESSION['department_id'] = $user['department_id'];

                // Redirect based on role
                if ($user['role'] === 'super_admin') {
                    header("Location: super_admin.php");
                } else {
                    header("Location: admin.php");
                }
                exit();
            } else {
                $error = "Invalid username or password.";
            }
        } catch (Exception $e) {
            $error = "Database error. Please try again later.";
            error_log("Login error: " . $e->getMessage());
        }
    } else {
        $error = "Please fill in all fields.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - UMTC Announcement System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js" defer></script>
    <link rel="stylesheet" href="includes/design-system.css">
    <script src="includes/app-init.js" defer></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            background: linear-gradient(135deg, #fab3b3ff 0%, #832222ff 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .image-container {
            margin-right: 250px;
        }

        img {
            height: 700px;
            width: 700px;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1rem;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            width: 100%;
            max-width: 420px;
            transition: all 0.3s ease;
            margin-right: 250px;
        }

        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.2);
        }

        .login-header {
            background: linear-gradient(135deg, #4b1818ff 0%, #bd3434ff 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .login-form {
            padding: 2rem;
        }

        .input-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #ea6666ff;
        }

        .password-toggle {
            position: absolute;
            right: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: #ea6666ff;
            cursor: pointer;
            transition: all 0.3s;
            background: transparent;
            border: none;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 2.5rem;
            height: 2.5rem;
        }

        .password-toggle:hover {
            color: #bd3434ff;
        }

        .password-toggle:focus-visible {
            outline: 2px solid #bd3434ff;
            outline-offset: 2px;
        }

        .password-toggle-icon {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .password-toggle-icon svg {
            width: 20px;
            height: 20px;
        }

        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem 3rem 0.75rem 3rem;
            border: 2px solid #e2e8f0;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.3s;
        }

        /* Hide native password reveal/clear icons so only our toggle shows */
        input[type="password"]::-ms-reveal,
        input[type="password"]::-ms-clear {
            display: none;
        }

        input[type="password"]::-webkit-textfield-decoration-container,
        input[type="password"]::-webkit-credentials-auto-fill-button {
            visibility: hidden;
            pointer-events: none;
            position: absolute;
            right: 0;
        }

        .form-input:focus {
            outline: none;
            border-color: #ff7676ff;
            box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.2);
        }

        .login-btn {
            background: linear-gradient(135deg, #4b1818ff 0%, #bd3434ff 100%);
            color: white;
            border: none;
            padding: 0.75rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
            margin-top: 1rem;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(234, 102, 102, 0.4);
        }

        .error-message {
            background-color: #fee2e2;
            color: #dc2626;
            padding: 0.75rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            font-size: 0.875rem;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            color: #e26e6eff;
            transition: all 0.3s;
        }

        .back-link:hover {
            color: #ea6666ff;
            transform: translateX(-3px);
        }

        .footer-text {
            color: #9ca3af;
            font-size: 0.875rem;
            text-align: center;
            margin-top: 2rem;
        }

        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            font-size: 1.75rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .logo-icon {
            width: 2.5rem;
            height: 2.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
        }

        @media only screen and (max-width: 1217px) {
            body {
                flex-direction: column-reverse;
                justify-content: center;
                align-items: center;
                padding: 1rem;
            }

            .image-container {
                margin: 0;
                margin-top: 20px;

            }

            img {
                height: 400px;
                width: 400px;
            }

            .login-card {
                max-width: 500px;
                margin: 0;
                margin-bottom: 100px;
            }
        }
    </style>
</head>

<body>
    <div class="login-card" data-aos="zoom-in">
        <div class="login-header">
            <div class="logo">
                <div class="logo-icon">
                    <i data-feather="calendar"></i>
                </div>
                <span>UMTC</span>
            </div>
            <p class="text-white/90">Administrator Dashboard</p>
        </div>

        <div class="login-form">
            <form method="POST" action="">
                <?php if (!empty($error)): ?>
                    <div class="error-message">
                        <i data-feather="alert-circle" class="inline mr-1"></i>
                        <?php echo $error; ?>
                    </div>
                <?php endif; ?>

                <div class="input-group">
                    <div class="input-icon">
                        <i data-feather="user"></i>
                    </div>
                    <input type="text" class="form-input" id="username" name="username" placeholder="Username" required autofocus>
                </div>

                <div class="input-group">
                    <div class="input-icon">
                        <i data-feather="lock"></i>
                    </div>
                    <button type="button" class="password-toggle" id="passwordToggle" aria-label="Toggle password visibility" aria-pressed="false">
                        <span class="sr-only">Toggle password visibility</span>
                        <span class="password-toggle-icon" aria-hidden="true">
                            <i data-feather="eye"></i>
                        </span>
                    </button>
                    <input type="password" class="form-input" id="password" name="password" placeholder="Password" required>
                </div>

                <button type="submit" class="login-btn">
                    <i data-feather="log-in" class="inline mr-2"></i>
                    Sign In
                </button>

                <div class="mt-4 text-center">
                    <a href="index.php" class="back-link">
                        <i data-feather="arrow-left" class="mr-1"></i>
                        Back to Announcements
                    </a>
                </div>

                <p class="footer-text">
                    UM Tagum College &copy; 2025
                </p>
            </form>
        </div>
    </div>
    <div class="image-container">
        <img src="GAlendar.png" alt="GAlendar">
    </div>

    <script>
        window.addEventListener('load', function() {
            if (window.AOS) {
                AOS.init({
                    duration: 800,
                    easing: 'ease-in-out',
                    once: true
                });
            }

            if (window.feather) {
                feather.replace();
            }

            const passwordToggle = document.getElementById('passwordToggle');
            const passwordInput = document.getElementById('password');

            if (passwordToggle && passwordInput) {
                const passwordToggleIcon = passwordToggle.querySelector('.password-toggle-icon');

                const renderPasswordToggleIcon = (isVisible) => {
                    if (!passwordToggleIcon) return;
                    const iconName = isVisible ? 'eye-off' : 'eye';
                    if (window.feather && feather.icons && feather.icons[iconName]) {
                        passwordToggleIcon.innerHTML = feather.icons[iconName].toSvg({
                            width: 20,
                            height: 20
                        });
                    } else {
                        passwordToggleIcon.textContent = isVisible ? 'Hide' : 'Show';
                    }
                };

                let isPasswordVisible = false;
                renderPasswordToggleIcon(isPasswordVisible);

                passwordToggle.addEventListener('click', function() {
                    isPasswordVisible = !isPasswordVisible;
                    passwordInput.setAttribute('type', isPasswordVisible ? 'text' : 'password');
                    passwordToggle.setAttribute('aria-pressed', isPasswordVisible ? 'true' : 'false');
                    renderPasswordToggleIcon(isPasswordVisible);
                    passwordInput.focus();
                });

                passwordToggle.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-50%) scale(1.1)';
                });

                passwordToggle.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(-50%) scale(1)';
                });
            }
        });
    </script>
</body>

</html>