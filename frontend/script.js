if (window.location.pathname.includes("course-details.html")) {

    const params = new URLSearchParams(window.location.search);
    const courseId = params.get("course");

    const courseData = {
        python: {
            title: "Introduction to Python",
            category: "Programming",
            rating: "4.5 / 5",
            description: "Learn the basics of Python Programming from Scratch."
        },
        webdesign: {
            title: "Web Design Basics",
            category: "Design",
            rating: "4.2 / 5",
            description: "Understand HTML, CSS and Design Fundamentals for the web."
        },
        datastructures: {
            title: "Data Structures",
            category: "Programming",
            rating: "4.8 / 5",
            description: "Master arrays, linked lists, trees and more."
        }
    };
    const course = courseData[courseId];

    if (course) {
        document.getElementById("course-title").textContent = course.title;
        document.getElementById("course-category").textContent = "Category : " + 
        course.category;
        document.getElementById("course-rating").textContent = "Rating : " +
        course.rating;
        document.getElementById("course-description").textContent = course.description;
    }
}

const searchBox = document.getElementById("search-box");

if (searchBox) {
    searchBox.addEventListener("input", function() {
        const searchTerm = searchBox.value.toLowerCase();
        const cards = document.querySelectorAll(".course-card");

        cards.forEach(function(card) {
            const title = card.querySelector("h3").textContent.toLowerCase();

            if (title.includes(searchTerm)) {
                card.style.display = "block";
            } else {
                card.style.display = "none";
            }
        });
    });
}

const approveButtons = document.querySelectorAll(".approve-btn");
const rejectButtons = document.querySelectorAll(".reject-btn");

approveButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const item = button.closest(".approval-item");
        alert(item.querySelector("h3").textContent.trim() + " Approved!");
        item.remove();
    });
});

rejectButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const item = button.closest(".approval-item");
        alert(item.querySelector("h3").textContent.trim() + " Rejected!");
    });
});

const courseForm = document.getElementById("create-course-form");

if (courseForm) {
    const formMessage = document.getElementById("form-message");

    courseForm.addEventListener("submit", function(event) {
        event.preventDefault();
        formMessage.textContent = "Course saved as Draft!";
        formMessage.style.color = "#27ae60";
    });

    const submitApprovalBtn = document.querySelector(".submit-approval-btn");

    submitApprovalBtn.addEventListener("click", function() {
        const title = document.getElementById("course-title").value.trim();
        const category = document.getElementById("course-category").value;
        const description = document.getElementById("course-description").value.trim();

        if (title === "" || category === "" || description === "") {
            formMessage.textContent = "Please fill in Title, Category and Description before submitting for approval.";
            formMessage.style.color = "#c0392b";
        } else {
            formMessage.textContent = "Course Submitted for Admin Approval!";
            formMessage.style.color = "#27ae60";
        }
    });
}

const evalButtons = document.querySelectorAll(".eval-submit-btn");

evalButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const studentName = button.dataset.student;
        alert("Evaluation submitted for " + studentName + "!");
    });
});

const API_BASE_URL = "http://127.0.0.1:5000";

const quizForm = document.getElementById("quiz-form");
const startQuizButton = document.getElementById("start-quiz-btn");

if (quizForm && startQuizButton) {
    const token = localStorage.getItem("access_token");

    const params = new URLSearchParams(window.location.search);
    const quizId = params.get("quiz_id") || params.get("quiz");

    const quizTitle = document.getElementById("quiz-title");
    const quizDescription = document.getElementById("quiz-description");
    const quizMessage = document.getElementById("quiz-message");
    const quizTimer = document.getElementById("quiz-timer");
    const questionsContainer =
        document.getElementById("questions-container");
    const submitQuizButton =
        document.getElementById("submit-quiz-btn");
    const quizResult =
        document.getElementById("quiz-result");

    let quizData = null;
    let attemptId = null;
    let timerInterval = null;
    let isSubmitting = false;

    function showMessage(message, color = "#c0392b") {
        quizMessage.textContent = message;
        quizMessage.style.color = color;
    }

    async function apiRequest(url, options = {}) {
        const requestOptions = {
            ...options,
            headers: {
                ...(options.body
                    ? { "Content-Type": "application/json" }
                    : {}),
                "Authorization": "Bearer " + token,
                ...(options.headers || {})
            }
        };

        const response = await fetch(
            API_BASE_URL + url,
            requestOptions
        );

        const data = await response.json().catch(function() {
            return {};
        });

        if (!response.ok) {
            throw new Error(
                data.message || "Request failed with status " + response.status
            );
        }

        return data;
    }

    function renderQuestions(questions) {
        questionsContainer.innerHTML = "";

        questions.forEach(function(question, index) {
            const questionBlock = document.createElement("div");
            questionBlock.className = "quiz-question";

            const heading = document.createElement("h3");
            heading.textContent =
                (index + 1) + ". " + question.question_text;

            questionBlock.appendChild(heading);

            const options = [
                ["A", question.option_a],
                ["B", question.option_b],
                ["C", question.option_c],
                ["D", question.option_d]
            ];

            options.forEach(function(option) {
                const label = document.createElement("label");
                label.style.display = "block";
                label.style.marginBottom = "8px";

                const input = document.createElement("input");
                input.type = "radio";
                input.name = "question-" + question.question_id;
                input.value = option[0];
                input.dataset.questionId = question.question_id;

                label.appendChild(input);
                label.appendChild(
                    document.createTextNode(
                        " " + option[0] + ". " + option[1]
                    )
                );

                questionBlock.appendChild(label);
            });

            questionsContainer.appendChild(questionBlock);
        });
    }

    function startTimer(minutes) {
        let remainingSeconds = Number(minutes) * 60;

        function updateTimer() {
            const displayMinutes =
                Math.floor(remainingSeconds / 60);

            const displaySeconds =
                remainingSeconds % 60;

            quizTimer.textContent =
                "Time left: " +
                displayMinutes +
                ":" +
                String(displaySeconds).padStart(2, "0");
        }

        updateTimer();

        timerInterval = setInterval(function() {
            remainingSeconds--;

            updateTimer();

            if (remainingSeconds <= 0) {
                clearInterval(timerInterval);
                showMessage(
                    "Time is over. Your quiz is being submitted.",
                    "#c0392b"
                );
                submitQuiz();
            }
        }, 1000);
    }

    function collectAnswers() {
        const answers = [];

        quizData.questions.forEach(function(question) {
            const selected = document.querySelector(
                "input[name='question-" +
                question.question_id +
                "']:checked"
            );

            if (selected) {
                answers.push({
                    question_id: Number(question.question_id),
                    selected_answer: selected.value
                });
            }
        });

        return answers;
    }

    async function submitQuiz() {
        if (isSubmitting) {
            return;
        }

        isSubmitting = true;
        clearInterval(timerInterval);
        submitQuizButton.disabled = true;

        const answers = collectAnswers();

        try {
            const result = await apiRequest(
                "/api/quiz-attempts/" +
                attemptId +
                "/submit",
                {
                    method: "POST",
                    body: JSON.stringify({
                        answers: answers
                    })
                }
            );

            const score = result.data.score;
            const passed = result.data.passed;

            quizResult.textContent =
                "Your score: " +
                score +
                "%. " +
                (passed ? "Quiz Passed!" : "Quiz Failed.");

            quizResult.style.color =
                passed ? "#27ae60" : "#c0392b";

            showMessage(
                "Quiz submitted successfully.",
                "#27ae60"
            );
        } catch (error) {
            isSubmitting = false;
            submitQuizButton.disabled = false;

            showMessage(error.message);
        }
    }

    async function loadQuiz() {
        if (!token) {
            showMessage("Please log in before attempting the quiz.");
            startQuizButton.disabled = true;
            return;
        }

        if (!quizId) {
            showMessage(
                "Quiz ID is missing. Open the quiz from the course details page."
            );
            startQuizButton.disabled = true;
            return;
        }

        try {
            const result = await apiRequest(
                "/api/quizzes/" + quizId
            );

            quizData = result.data;

            quizTitle.textContent = quizData.title;
            quizDescription.textContent =
                quizData.description || "";

            renderQuestions(quizData.questions);

            showMessage(
                "Quiz loaded. Click Start Quiz.",
                "#27ae60"
            );
        } catch (error) {
            showMessage(error.message);
            startQuizButton.disabled = true;
        }
    }

    startQuizButton.addEventListener("click", async function() {
        startQuizButton.disabled = true;
        showMessage("Starting quiz...", "#5B6472");

        try {
            const result = await apiRequest(
                "/api/quizzes/" + quizId + "/attempts",
                {
                    method: "POST"
                }
            );

            attemptId = result.data.attempt_id;

            startQuizButton.hidden = true;
            quizForm.hidden = false;

            showMessage(
                "Quiz started. Good luck!",
                "#27ae60"
            );

            startTimer(quizData.time_limit);
        } catch (error) {
            startQuizButton.disabled = false;
            showMessage(error.message);
        }
    });

    quizForm.addEventListener("submit", function(event) {
        event.preventDefault();
        submitQuiz();
    });

    loadQuiz();
}

const assignmentForm = document.getElementById("assignment-form");

if (assignmentForm) {
    assignmentForm.addEventListener("submit", function(event) {
        event.preventDefault();

        const fileInput = document.getElementById("submission-file");
        const message = document.getElementById("submission-message");

        if (fileInput.files.length === 0) {
            message.textContent = "Please choose a file before submitting.";
            message.style.color = "#c0392b";
        } else {
            const fileName = fileInput.files[0].name;
            message.textContent = "Submitted: " + fileName + "- awaiting evaluation.";
            message.style.color = "#27ae60";
        }
    });
}

const downloadBtn = document.getElementById("download-cert-btn");

if (downloadBtn) {
    downloadBtn.addEventListener("click", function() {
        window.print();
    });
}

const loginForm = document.getElementById("login-form");

if (loginForm) {
    loginForm.addEventListener("submit", async function(event) {
        event.preventDefault();

        const email = document.getElementById("email").value.trim();
        const password = document.getElementById("password").value.trim();
        const loginMessage = document.getElementById("login-message");

        if (email === "" || password === "") {
            loginMessage.textContent = "Please fill in all fields.";
            loginMessage.style.color = "#c0392b";
            return;
        }

        try {
            const response = await fetch("http://127.0.0.1:5000/api/auth/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    email: email,
                    password: password
                })
            });

            const data = await response.json();

            if (response.ok) {
                localStorage.setItem("access_token", data.access_token);
                localStorage.setItem("user_full_name", data.user.full_name);
                localStorage.setItem("user_role", data.user.role);

                loginMessage.textContent = "Login successful! Redirecting...";
                loginMessage.style.color = "#27ae60";

                const role = data.user.role;

                if (role === "Student") {
                    window.location.href = "dashboard.html";
                } else if (role === "Trainer") {
                    window.location.href = "trainer-dashboard.html";
                } else if (role === "Administrator") {
                    window.location.href = "admin-dashboard.html";
                }
            } else {
                loginMessage.textContent = data.message || "Login failed. Please try again.";
                loginMessage.style.color = "#c0392b";
            }
        } catch (error) {
            loginMessage.textContent = "Could not reach the server. Is the backend running?";
            loginMessage.style.color = "#c0392b";
        }
    });
}

const usersTableBody = document.getElementById("users-table-body");

if (usersTableBody) {
    const token = localStorage.getItem("access_token");

    if (!token) {
        window.location.href = "index.html";
    }

    function statusClass(status) {
        if (status === "ACTIVE") return "status-published";
        if (status === "SUSPENDED") return "status-pending";
        return "status-draft";
    }

    function renderUsers(users) {
        usersTableBody.innerHTML = "";

        users.forEach(function(user) {
            const row = document.createElement("tr");
            row.dataset.userId = user.user_id;

            const toggleLabel = user.status === "ACTIVE" ? "Suspend" : "Reactivate";
            const toggleClass = user.status === "ACTIVE" ? "user-suspend-btn" : "user-reactivate-btn";

            row.innerHTML =
            "<td>" + user.full_name + "</td>" +
            "<td>" + user.email + "</td>" +
            "<td>" + user.role + "</td>" +
            "<td><span class='status-badge " + statusClass(user.status) + "'>" + user.status + "</span></td>" +
            "<td>" +
                "<button class='user-edit-btn'>Edit</button> " +
                "<button class='" + toggleClass + "'>" + toggleLabel + "</button>" +
            "</td>";

            usersTableBody.appendChild(row);
        });
        attachUserButtonEvents();
    }

    async function loadUsers() {
        try {
            const response = await fetch("http://127.0.0.1:5000/api/users", {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token
                }
            });

            const data = await response.json();

            if (response.ok) {
                renderUsers(data.users);
            } else {
                usersTableBody.innerHTML = "<tr><td> colspan='5'>" + (data.message || "Could not load users.") + "</td></tr>";
            }
        } catch (error) {
            usersTableBody.innerHTML = "<tr><td colspan='5'>Could not reach the server.</td></tr>";
        }
    }

    async function updateUserStatus(userId, newStatus) {
        try {
            const response = await fetch("http://127.0.0.1:5000/api/users/" + userId, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer " + token
                },
                body: JSON.stringify({ status: newStatus})
            });

            const data = await response.json();

            if (response.ok) {
                loadUsers();
            } else {
                alert(data.message || "Update failed.");
            }
        } catch (error) {
            alert("Could not reach the server.");
        }
    }

    function attachUserButtonEvents() {
        document.querySelectorAll(".user-edit-btn").forEach(function(button) {
            button.addEventListener("click", function() {
                const row = button.closest("tr");
                const userId = row.dataset.userId;
                const currentName = row.children[0].textContent;
                const currentEmail = row.children[1].textContent;

                const newName = prompt("FUll Name:", currentName);
                if (newName === null) return;

                const newEmail = prompt("Email:", currentEmail);
                if (newEmail === null) return;

                fetch("http://127.0.0.1:5000/api/users/" + userId, {
                    method: "PUT",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": "Bearer " + token
                    },
                    body: JSON.stringify({full_name: newName, email: newEmail })
                })
                .then(function(response) { return response.json(); })
                .then(function() { loadUsers(); });
            });
        });

        document.querySelectorAll(".user-suspend-btn").forEach(function(button) {
            button.addEventListener("click", function() {
                const userId = button.closest("tr").dataset.userId;
                updateUserStatus(userId, "SUSPENDED");
            });
        });

        document.querySelectorAll(".user-reactivate-btn").forEach(function(button) {
            button.addEventListener("click", function(){
                const userId = button.closest("tr").dataset.userId;
                updateUserStatus(userId, "ACTIVE");
            });
        });
    }
    loadUsers();
}

const courseEditButtons = document.querySelectorAll(".course-edit-btn");
const courseDeleteButtons = document.querySelectorAll(".course-delete-btn");

courseEditButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const item = button.closest(".trainer-course-item");
        const courseName = item.querySelector("h3").textContent;
        alert("Edit course: " + courseName);
        // Later: this will redirect to create-course.html pre-filled with this course's data
    });
});

courseDeleteButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const item = button.closest(".trainer-course-item");
        const courseName = item.querySelector("h3").textContent;

        const confirmation = confirm("Are you sure you want to delete \"" 
            + courseName + "\"?");
        if (confirmation) {
            item.remove();
        }
    });
});

const verifyBtn = document.getElementById("verify-btn");

if (verifyBtn) {
    // Fake certificate database — later replaced by a real API call
    // to something like GET /api/certificates/verify/:certNumber
    const validCertificates = {
        "LMS-2026-00143": {student: "Student Name ", course: "Introduction to Python",
            date: "10 Sept 2026"}
        };
        verifyBtn.addEventListener("click", function() {
            const certNumber = document.getElementById("cert-input").value.trim();
            const result = document.getElementById("verify-result");
            const certificate = validCertificates[certNumber];

            if (certificate) {
                result.innerHTML =
                "<p style='color: #27ae60; font-weight: bold;'>&#10003; Valid Certificate</p>" +
                "<p>Student: " + certificate.student + "</p>" +
                "<p>Course: " + certificate.course + "</p>" +
                "<p>Issued on: " + certificate.date + "</p>";
            } else {
                result.innerHTML =
                "<p style='color: #c0392b; font-weight: bold;'>&#10007; Invalid Certificate Number</p>";
            }
        });
}

    const reviewForm = document.getElementById("review-form");

    if (reviewForm) {
        reviewForm.addEventListener("submit", function(event) {
            event.preventDefault();

            const rating = document.getElementById("review-rating").value;
            const text = document.getElementById("review-text").value.trim();

            if (rating === "" || text === "") {
                alert("Please Select a Rating and Write a Review.");
                return;
            }
            const stars = "\u2605".repeat(rating) + "\u2606".repeat(5 - rating);

            const newReview = document.createElement("div");
            newReview.className = "review-item";
            newReview.innerHTML = "<p><strong>You</strong> - " + stars +
             "</p><p>" + text + "</p>";

             reviewForm.parentElement.insertBefore(newReview, 
                reviewForm.parentElement.querySelector("h3"));

                reviewForm.reset();
        });
    }

    const categoryList = document.getElementById("category-list");

    if (categoryList) {
        const token = localStorage.getItem("access_token");
        const categoryForm = document.getElementById("category-form");
        const categoryMessage = document.getElementById("category-message");

        function renderCategories(categories) {
            categoryList.innerHTML = "";

            categories.forEach(function(category) {
                const row = document.createElement("tr");
                row.dataset.categoryId = category.category_id;

                row.innerHTML = 
                "<td>" + category.category_name + "</td>" +
                "<td>" + (category.description || "-") + "</td>" +
                "<td>" +
                    "<button class='category-edit-btn'>Edit</button> " +
                    "<button class='category-delete-btn'>Delete</button> " +
                "</td>";

                categoryList.appendChild(row);
            });
            attachCategoryButtonEvents();
        }

        async function loadCategories() {
            try {
                const response = await fetch("http://127.0.0.1:5000/api/categories");
                const data = await response.json();

                if (response.ok) {
                    renderCategories(data.categories);
                } else {
                    categoryList.innerHTML = "<tr><td> colspan='3'>Could not load categories.</td></tr>";
                }
            } catch (error) {
                categoryList.innerHTML = "<tr><td colspan='3'>Could not reach the server.</td></tr>";
            }
        }

        function attachCategoryButtonEvents() {
            document.querySelectorAll(".category-edit-btn").forEach(function(button) {
                button.addEventListener("click", async function() {
                    const row = button.closest("tr");
                    const categoryId = row.dataset.categoryId;
                    const currentName = row.children[0].textContent;
                    const currentDescription = row.children[1].textContent;

                    const newName = prompt("Category Name:", currentName);
                    if (newName === null) return;

                    const newDescription = prompt("Description:", currentDescription === "-" ? "" : currentDescription);
                    if (newDescription === null) return;

                    try {
                        const response = await fetch("http://127.0.0.1:5000/api/categories/" + categoryId, {
                            method: "PUT",
                            headers: {
                                "Content-Type": "application/json",
                                "Authorization": "Bearer " + token
                            },
                            body: JSON.stringify({
                                category_name: newName,
                                description: newDescription
                            })
                        });

                        const data = await response.json();

                        if (response.ok) {
                            loadCategories();
                        } else {
                            alert(data.message || "Update failed.");
                        }
                    } catch (error) {
                        alert("Could not reach the server.");
                    }
                });
            });

            document.querySelectorAll(".category-delete-btn").forEach(function(button) {
                button.addEventListener("click", async function() {
                    const row = button.closest("tr");
                    const categoryId = row.dataset.categoryId;
                    const categoryName = row.children[0].textContent;

                    const confirmed = confirm("Delete category \"" + categoryName + "\"?");
                    if (!confirmed) return;

                    try {
                        const response = await fetch("http://127.0.0.1:5000/api/categories/" + categoryId, {
                            method: "DELETE",
                            headers: {
                                "Authorization": "Bearer " + token
                            }
                        });

                        const data = await response.json();

                        if (response.ok) {
                            loadCategories();
                        } else {
                            alert(data.message || "Delete failed.");
                        }
                    } catch (error) {
                        alert ("Could not reach the server.");
                    }
                });
            });
        }

        categoryForm.addEventListener("submit", async function(event) {
            event.preventDefault();

            const nameInput = document.getElementById("category-name");
            const descriptionInput = document.getElementById("category-description");
            const name = nameInput.value.trim();
            const description = descriptionInput.value.trim();

            if (name === "") return;

            try {
                const response = await fetch("http://127.0.0.1:5000/api/categories", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": "Bearer " + token
                    },
                    body: JSON.stringify({
                        category_name: name,
                        description: description
                    })
                });

                const data = await response.json();

                if (response.ok) {
                    nameInput.value = "";
                    descriptionInput.value = "";
                    categoryMessage.textContent = "";
                    loadCategories();
                } else {
                    categoryMessage.textContent = data.message || "Could not create category.";
                    categoryMessage.style.color = "#c0392b";
                }
            } catch (error) {
                categoryMessage.textContent = "Could not reach the server.";
                categoryMessage.style.color = "#c0392b";
            }
        });
        loadCategories();
    }

    const registerForm = document.getElementById("register-form");

    if (registerForm) {
        registerForm.addEventListener("submit", async function(event) {
            event.preventDefault();

            const fullName = document.getElementById("full-name").value.trim();
            const email = document.getElementById("reg-email").value.trim();
            const password = document.getElementById("reg-password").value;
            const confirmPassword = document.getElementById("confirm-password").value;
            const role = document.getElementById("reg-role").value;
            const registerMessage = document.getElementById("register-message");

            if (fullName === "" || email === "" || password === "" || role === "") {
                registerMessage.textContent = "Please fill in all required fields.";
                registerMessage.style.color = "#c0392b";
                return;
            }

            if (password !== confirmPassword) {
                registerMessage.textContent = "Passwords do not match.";
                registerMessage.style.color = "#c0392b";
                return;
            }

            try {
                const response = await fetch("http://127.0.0.1:5000/api/auth/register", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        full_name: fullName,
                        email: email,
                        password: password,
                        confirm_password: confirmPassword,
                        role: role.charAt(0).toUpperCase() + role.slice(1)
                    })
                });

                const data = await response.json();

                if (response.ok) {
                    registerMessage.textContent = "Registration successful! You can now Log in.";
                    registerMessage.style.color = "#27ae60";
                    setTimeout(function () {
                        window.location.href = "index.html";
                    }, 2000);
                } else {
                    registerMessage.textContent = data.message || "Registration failed. Please try again.";
                    registerMessage.style.color = "#c0392b";
                }
            } catch (error) {
                registerMessage.textContent = "Could not reach the server. Is the backend running?";
                registerMessage.style.color = "#c0392b";
            }
        });
    }

const toggleButtons = document.querySelectorAll(".toggle-password");

toggleButtons.forEach(function(toggle) {
    toggle.addEventListener("click", function() {
        const targetId = toggle.dataset.target;
        const input = document.getElementById(targetId);

        if (input.type === "password") {
            input.type = "text";
            toggle.textContent = "Hide";
        } else {
            input.type = "password";
            toggle.textContent = "Show";
        }
    });
});

const profileForm = document.getElementById("profile-form");

if (profileForm) {
    const token = localStorage.getItem("access_token");

    if (!token) {
        window.location.href = "index.html";
    } else {
        // Load the real profile data when the page opens
        (async function loadProfile() {
            try {
                const response = await fetch("http://127.0.0.1:5000/api/auth/profile", {
                    method: "GET",
                    headers: {
                        "Authorization": "Bearer " + token
                    }
                });

                const data = await response.json();

                if (response.ok) {
                    document.getElementById("profile-name").value = data.user.full_name;
                    document.getElementById("profile-email").value = data.user.email;
                    document.getElementById("profile-role").value = data.user.role;
                }
            } catch (error) {
                console.log("Could not load Profile: ", error);
            }
        })();
    }
    profileForm.addEventListener("submit", async function(event) {
        event.preventDefault();

        const fullName = document.getElementById("profile-name").value.trim();
        const email = document.getElementById("profile-email").value.trim();
        const profileMessage = document.getElementById("profile-message");

        try {
            const response = await fetch("http://127.0.0.1:5000/api/auth/profile", {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer " + token
                },
                body: JSON.stringify({
                    full_name: fullName,
                    email: email
                })
            });

            const data = await response.json();

            if (response.ok) {
                profileMessage.textContent = "Profile updated Successfully!";
                profileMessage.style.color = "#27ae60";
                localStorage.setItem("user_full_name", data.user.full_name);
            } else {
                profileMessage.textContent = data.message || "Update failed.";
                profileMessage.style.color = "#c0392b";
            }
        } catch (error) {
            profileMessage.textContent = "Could not reach the server.";
            profileMessage.style.color = "#c0392b";
        }
    });
}

const profilePicInput = document.getElementById("profile-pic-input");

if (profilePicInput) {
    profilePicInput.addEventListener("change", function() {
        const file = profilePicInput.files[0];

        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                const preview = document.getElementById("profile-pic-preview");
                const placeholder = document.getElementById("profile-pic-placeholder");
                preview.src = event.target.result;
                preview.style.display = "block";
                placeholder.style.display = "none";
            };
            reader.readAsDataURL(file);
        }
    });
}

const addModuleForm = document.getElementById("add-module-form");

if (addModuleForm) {
    const moduleList = document.getElementById("module-list");

    // Adding a new lesson to a module (works for existing AND newly-added modules)
    function attachAddLessonEvent(button) {
        button.addEventListener("click", function() {
            const moduleBlock = button.closest(".module-block");
            const input = moduleBlock.querySelector(".new-lesson-input");
            const lessonName = input.value.trim();

            if (lessonName === "") return;

            const newLesson = document.createElement("li");
            newLesson.innerHTML = lessonName + " <button class='delete-lesson-btn'>Remove</button>";

            moduleBlock.querySelector(".lesson-list").appendChild(newLesson);
            attachDeleteLessonEvent(newLesson.querySelector(".delete-lesson-btn"));

            input.value = "";
        });
    }

    // Deleting a single lesson
    function attachDeleteLessonEvent(button) {
        button.addEventListener("click", function() {
            button.closest("li").remove();
        });
    }

    // Deleting an entire module
    function attachDeleteModuleEvent(button) {
        button.addEventListener("click", function() {
            const moduleBlock = button.closest(".module-block");
            const confirmed = confirm("Delete this entire module and all its lessons?");
            if (confirmed) {
                moduleBlock.remove();
            }
        });
    }

    // Wire up all buttons that already exist on page load
    document.querySelectorAll(".add-lesson-btn").forEach(attachAddLessonEvent);
    document.querySelectorAll(".delete-lesson-btn").forEach(attachDeleteLessonEvent);
    document.querySelectorAll(".delete-module-btn").forEach(attachDeleteModuleEvent);

    // Adding a brand new module
    addModuleForm.addEventListener("submit", function(event) {
        event.preventDefault();

        const moduleNameInput = document.getElementById("module-name");
        const moduleName = moduleNameInput.value.trim();

        if (moduleName === "") return;

        const moduleCount = document.querySelectorAll(".module-block").length + 1;

        const newModule = document.createElement("div");
        newModule.className = "module-block";
        newModule.innerHTML =
            "<div class='module-header'>" +
                "<h3>Module " + moduleCount + ": " + moduleName + "</h3>" +
                "<button class='delete-module-btn'>Delete Module</button>" +
            "</div>" +
            "<ul class='lesson-list'></ul>" +
            "<div class='add-lesson-row'>" +
                "<input type='text' class='new-lesson-input' placeholder='New lesson name'>" +
                "<button class='add-lesson-btn'>Add Lesson</button>" +
            "</div>";

        moduleList.appendChild(newModule);

        attachAddLessonEvent(newModule.querySelector(".add-lesson-btn"));
        attachDeleteModuleEvent(newModule.querySelector(".delete-module-btn"));

        moduleNameInput.value = "";
    });
}

const addQuestionBtn = document.getElementById("add-question-btn");

if (addQuestionBtn) {
    const token = localStorage.getItem("access_token");
    const courseId = 1; // Temporary: same hardcoded course as assignments

    const questionList = document.getElementById("question-list");

    function attachRemoveQuestionEvent(button) {
        button.addEventListener("click", function() {
            const totalQuestions = document.querySelectorAll(".question-block").length;
            if (totalQuestions <= 1) {
                alert("A quiz must have at least one question.");
                return;
            }
            button.closest(".question-block").remove();
        });
    }

    document.querySelectorAll(".remove-question-btn").forEach(attachRemoveQuestionEvent);

    addQuestionBtn.addEventListener("click", function() {
        const newQuestion = document.createElement("div");
        newQuestion.className = "question-block";
        newQuestion.innerHTML =
            "<div class='form-group'>" +
                "<label>Question Text</label>" +
                "<input type='text' class='question-text' placeholder='Enter the question'>" +
            "</div>" +
            "<div class='options-grid'>" +
                "<input type='text' class='option-input' placeholder='Option A'>" +
                "<input type='text' class='option-input' placeholder='Option B'>" +
                "<input type='text' class='option-input' placeholder='Option C'>" +
                "<input type='text' class='option-input' placeholder='Option D'>" +
            "</div>" +
            "<div class='quiz-settings-row'>" +
                "<div class='form-group'>" +
                    "<label>Correct Option</label>" +
                    "<select class='correct-option'>" +
                        "<option value='A'>A</option>" +
                        "<option value='B'>B</option>" +
                        "<option value='C'>C</option>" +
                        "<option value='D'>D</option>" +
                    "</select>" +
                "</div>" +
                "<div class='form-group'>" +
                    "<label>Marks</label>" +
                    "<input type='number' class='question-marks' value='5' min='1'>" +
                "</div>" +
            "</div>" +
            "<button class='remove-question-btn'>Remove Question</button>";

        questionList.appendChild(newQuestion);
        attachRemoveQuestionEvent(newQuestion.querySelector(".remove-question-btn"));
    });

    const saveQuizBtn = document.getElementById("save-quiz-btn");
    const quizMessage = document.getElementById("quiz-save-message");

    saveQuizBtn.addEventListener("click", async function() {
        const quizTitle = document.getElementById("quiz-title").value.trim();
        const moduleId = document.getElementById("quiz-module").value;
        const timeLimit = document.getElementById("quiz-time-limit").value;
        const maxAttempts = document.getElementById("quiz-max-attempts").value;
        const passingScore = document.getElementById("quiz-passing-score").value;

        if (quizTitle === "") {
            quizMessage.textContent = "Please enter a quiz title.";
            quizMessage.style.color = "#c0392b";
            return;
        }

        const questionBlocks = document.querySelectorAll(".question-block");
        let allQuestionsFilled = true;

        questionBlocks.forEach(function(block) {
            const questionText = block.querySelector(".question-text").value.trim();
            const options = block.querySelectorAll(".option-input");
            let optionsFilled = true;

            options.forEach(function(option) {
                if (option.value.trim() === "") optionsFilled = false;
            });

            if (questionText === "" || !optionsFilled) {
                allQuestionsFilled = false;
            }
        });

        if (!allQuestionsFilled) {
            quizMessage.textContent = "Please fill in all questions and their 4 options before saving.";
            quizMessage.style.color = "#c0392b";
            return;
        }

        quizMessage.textContent = "Saving quiz...";
        quizMessage.style.color = "#5B6472";

        try {
            // Step 1: create the quiz itself
            const quizResponse = await fetch("http://127.0.0.1:5000/api/courses/" + courseId + "/quizzes", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer " + token
                },
                body: JSON.stringify({
                    module_id: moduleId === "" ? null : parseInt(moduleId),
                    title: quizTitle,
                    time_limit: parseInt(timeLimit),
                    maximum_attempts: parseInt(maxAttempts),
                    passing_score: parseFloat(passingScore)
                })
            });

            const quizData = await quizResponse.json();

            if (!quizResponse.ok) {
                quizMessage.textContent = quizData.message || "Could not create quiz.";
                quizMessage.style.color = "#c0392b";
                return;
            }

            const newQuizId = quizData.data.quiz_id;

            // Step 2: create each question, one request per question
            for (const block of questionBlocks) {
                const options = block.querySelectorAll(".option-input");

                const questionResponse = await fetch("http://127.0.0.1:5000/api/quizzes/" + newQuizId + "/questions", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": "Bearer " + token
                    },
                    body: JSON.stringify({
                        question_text: block.querySelector(".question-text").value.trim(),
                        option_a: options[0].value.trim(),
                        option_b: options[1].value.trim(),
                        option_c: options[2].value.trim(),
                        option_d: options[3].value.trim(),
                        correct_option: block.querySelector(".correct-option").value,
                        marks: parseFloat(block.querySelector(".question-marks").value)
                    })
                });

                if (!questionResponse.ok) {
                    const questionData = await questionResponse.json();
                    quizMessage.textContent = "Quiz created, but a question failed: " + (questionData.message || "unknown error");
                    quizMessage.style.color = "#c0392b";
                    return;
                }
            }

            quizMessage.textContent = "Quiz saved successfully with " + questionBlocks.length + " question(s)!";
            quizMessage.style.color = "#27ae60";
        } catch (error) {
            quizMessage.textContent = "Could not reach the server.";
            quizMessage.style.color = "#c0392b";
        }
    });
}

if (window.location.pathname.includes("course-details.html")) {
    const API_BASE_URL = "http://127.0.0.1:5000";
    const params = new URLSearchParams(window.location.search);
    const courseKey = params.get("course");
    const token = localStorage.getItem("access_token");

    const courseIds = {
        python: 1,
        webdesign: 2,
        datastructures: 3
    };

    const backendCourseId = courseIds[courseKey];
    const takeQuizLink = document.getElementById("take-quiz-link");
    const quizLinkMessage =
        document.getElementById("quiz-link-message");

    async function loadCourseQuizLink() {
        if (!takeQuizLink || !quizLinkMessage) {
            return;
        }

        if (!token) {
            takeQuizLink.style.display = "none";
            quizLinkMessage.textContent =
                "Please log in to view quizzes.";
            return;
        }

        if (!backendCourseId) {
            takeQuizLink.style.display = "none";
            quizLinkMessage.textContent =
                "Course ID was not found.";
            return;
        }

        try {
            const response = await fetch(
                API_BASE_URL +
                "/api/courses/" +
                backendCourseId +
                "/quizzes",
                {
                    method: "GET",
                    headers: {
                        "Authorization": "Bearer " + token
                    }
                }
            );

            const result = await response.json();

            if (!response.ok) {
                takeQuizLink.style.display = "none";
                quizLinkMessage.textContent =
                    result.message || "Could not load quizzes.";
                return;
            }

            const quizzes = result.data || [];

            if (quizzes.length === 0) {
                takeQuizLink.style.display = "none";
                quizLinkMessage.textContent =
                    "No quiz is available for this course.";
                return;
            }

            const firstQuizId = quizzes[0].quiz_id;

            takeQuizLink.href =
                "quiz.html?quiz_id=" + firstQuizId;

            quizLinkMessage.textContent =
                quizzes[0].title || "Quiz available";
            quizLinkMessage.style.color = "#27ae60";
        } catch (error) {
            takeQuizLink.style.display = "none";
            quizLinkMessage.textContent =
                "Could not load the course quiz.";
        }
    }

    loadCourseQuizLink();
}

const createAssignmentForm = document.getElementById("create-assignment-form");

if (createAssignmentForm) {
    const token = localStorage.getItem("access_token");
    const courseId = 1; // Temporary: hardcoded until a real course-selection page exists

    createAssignmentForm.addEventListener("submit", async function(event) {
        event.preventDefault();

        const title = document.getElementById("assignment-title").value.trim();
        const moduleId = document.getElementById("assignment-module").value;
        const description = document.getElementById("assignment-description").value.trim();
        const maxMarks = document.getElementById("assignment-max-marks").value;
        const rawDeadline = document.getElementById("assignment-deadline").value;
        const fileTypes = document.getElementById("assignment-file-types").value.trim();
        const message = document.getElementById("assignment-create-message");

        if (title === "" || moduleId === "" || description === "" || rawDeadline === "") {
            message.textContent = "Please fill in all required fields.";
            message.style.color = "#c0392b";
            return;
        }

        const deadlineDate = new Date(rawDeadline);
        if(deadlineDate <= new Date()) {
            message.textContent = "Deadline must be a future date and time.";
            message.style.color = "#c0392b";
            return;
        }

        try {
            const response = await fetch ("http://127.0.0.1:5000/api/courses/" + courseId + "/assignments", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer " + token
                },
                body: JSON.stringify({
                    module_id: parseInt(moduleId),
                    title: title,
                    description: description,
                    maximum_marks: parseFloat(maxMarks),
                    deadline: rawDeadline.replace("T", " ") + ":00",
                    allowed_file_types: fileTypes
                })
            });

            const data = await response.json();

            if (response.ok) {
                message.textContent = "Assignment \"" + data.data.title + "\" created successfully!";
                message.style.color = "#27ae60";
                createAssignmentForm.reset();
            } else {
                message.textContent = data.message || "Could not create assignment.";
                message.style.color = "#c0392b";
            }
        } catch (error) {
            message.textContent = "Could not reach the server.";
            message.style.color = "#c0392b";
        }
    });
}

const forgetPasswordForm = document.getElementById("forget-password-form");

if (forgetPasswordForm) {
    forgetPasswordForm.addEventListener("submit", function(event) {
        event.preventDefault();

        const email = document.getElementById("forget-email").value.trim();
        const message = document.getElementById("forget-password-message");

        if (email === "") {
            message.textContent = "Please Enter Your Email";
            message.style.color = "#c0392b";
            return;
        }

        message.textContent = "If that email is registered, a reset link has been sent.";
        message.style.color = "#27ae60";
    });
}