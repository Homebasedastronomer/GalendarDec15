<?php
require_once 'config.php';
requireSuperAdmin();

$departments = getDepartments();
$message = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['create_user'])) {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
    $email = trim($_POST['email']);
    $full_name = trim($_POST['full_name']);
    $role = $_POST['role'];
    $department_id = ($role === 'admin') ? $_POST['department_id'] : NULL;
    $require_password_change = 1;

    if (!empty($username) && !empty($password) && !empty($email) && !empty($full_name)) {
        if (!preg_match('/@umindanao\.edu\.ph$/i', $email)) {
            $error = 'Email must end with @umindanao.edu.ph';
        } else {
            try {
                $stmt = $pdo->prepare('SELECT id FROM users WHERE username = ?');
                $stmt->execute([$username]);
                if ($stmt->fetch()) {
                    $error = 'Username already exists.';
                } else {
                    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                    $stmt = $pdo->prepare('INSERT INTO users (username, password, email, role, full_name, department_id, require_password_change) VALUES (?, ?, ?, ?, ?, ?, ?)');
                    $stmt->execute([$username, $hashed_password, $email, $role, $full_name, $department_id, $require_password_change]);
                    if (function_exists('logActivity')) {
                        $details = json_encode(['username' => $username, 'email' => $email, 'role' => $role, 'department_id' => $department_id]);
                        logActivity('user_create', $details);
                    }
                    $message = 'User account created successfully! The user will be required to change their password on first login.';
                }
            } catch (Exception $e) {
                $error = 'Database error: ' . $e->getMessage();
            }
        }
    } else {
        $error = 'Please fill in all fields.';
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User - UMTC Announcement System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #7c2020ff 0%, #832222ff 100%);
        }

        .card-hover {
            transition: transform .2s ease, box-shadow .2s ease;
        }

        .card-hover:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
        }
    </style>
</head>

<body class="bg-gray-50 min-h-screen pt-0 pb-8 md:pb-12">
    <nav class="gradient-bg text-white shadow">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
            <div class="flex items-center">
                <i data-feather="user-plus" class="h-5 w-5 mr-2"></i>
                <span class="text-xl font-semibold">Create User</span>
            </div>
            <div class="flex items-center space-x-2">
                <a href="super_admin.php" class="px-3 py-2 text-sm rounded-md bg-white/10 hover:bg-white/20 transition inline-flex items-center gap-1">
                    <i data-feather="arrow-left"></i>
                    <span>Back</span>
                </a>
            </div>
        </div>
    </nav>
    <div class="max-w-3xl mx-auto bg-white rounded-lg shadow p-10 mt-6 mb-14 card-hover" data-aos="fade-up">
        <div class="flex items-center justify-between mb-6">
            <h1 class="text-xl font-semibold">Create New User</h1>
        </div>

        <?php if (!empty($message)): ?>
            <div class="mb-4 p-3 bg-green-100 text-green-700 rounded"><?php echo $message; ?></div>
        <?php endif; ?>
        <?php if (!empty($error)): ?>
            <div class="mb-4 p-3 bg-red-100 text-red-700 rounded"><?php echo $error; ?></div>
        <?php endif; ?>

        <form method="POST" class="space-y-8">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Username</label>
                    <input type="text" name="username" required class="form-input w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-red-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <div class="relative">
                        <input type="password" name="password" id="password" required class="form-input w-full border rounded px-3 py-2 pr-10 focus:outline-none focus:ring-2 focus:ring-red-500">
                        <button type="button" id="toggle_password" class="absolute right-2 top-1/2 -translate-y-1/2 text-gray-500 hover:text-gray-700"><i data-feather="eye"></i></button>
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" name="email" required pattern=".*@umindanao\.edu\.ph" title="Email must end with @umindanao.edu.ph" class="form-input w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-red-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <input type="text" name="full_name" required class="form-input w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-red-500">
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Role</label>
                    <select name="role" id="roleSelect" required class="form-select w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-red-500">
                        <option value="super_admin">Super Admin</option>
                        <option value="admin">Department Admin</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Department (for Admin only)</label>
                    <select name="department_id" id="departmentSelect" class="form-select w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-red-500">
                        <option value="">Select Department</option>
                        <?php foreach ($departments as $dept): ?>
                            <option value="<?php echo $dept['id']; ?>"><?php echo htmlspecialchars($dept['code'] . ' - ' . $dept['name']); ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="flex items-end">
                    <button type="submit" name="create_user" class="w-full px-6 py-3 rounded bg-red-600 text-white hover:bg-red-700 transition">Create User</button>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <script>
        AOS.init({
            duration: 700,
            easing: 'ease-out',
            once: true
        });
        feather.replace();
        document.getElementById('toggle_password').addEventListener('click', function() {
            const input = document.getElementById('password');
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);
            this.innerHTML = type === 'text' ? '<i data-feather="eye-off"></i>' : '<i data-feather="eye"></i>';
            feather.replace();
        });
        const roleSelect = document.getElementById('roleSelect');
        const departmentSelect = document.getElementById('departmentSelect');

        function syncDept() {
            if (roleSelect.value === 'admin') {
                departmentSelect.disabled = false;
                departmentSelect.required = true;
            } else {
                departmentSelect.disabled = true;
                departmentSelect.required = false;
                departmentSelect.value = '';
            }
        }
        roleSelect.addEventListener('change', syncDept);
        syncDept();
    </script>
</body>

</html>