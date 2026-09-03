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

const quizForm = document.getElementById("quiz-form");

if (quizForm) {
    const correctAnswers = { q1: "b", q2: "a", q3: "b" };

    let timeLeft = 300; // 5 minutes in seconds
    const timerDisplay = document.getElementById("quiz-timer");

    const timerInterval = setInterval(function() {
        timeLeft--;
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        timerDisplay.textContent = "Time Left: " + minutes +
         ":" + (seconds < 10 ? '0' : '') + seconds;

         if (timeLeft <= 0) {
            clearInterval(timerInterval);
            quizForm.dispatchEvent(new Event("submit"));
         }
        }, 1000);

        quizform.addEventListener("submit", function(event) {
            event.preventDefault();
            clearInterval(timerInterval);

            let score = 0;
            for (const question in correctAnswers) {
                const selected = quizForm.querySelector('input[name="' + question +
                     '"]:checked');
                if (selected && selected.value === correctAnswers[question]) {
                    score++;
                }
            }

            const total = Object.keys(correctAnswers).length;
            document.getElementById("quiz-result").textContent = 
            "You scored " + score + " out of " + total + "!";
        });
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

const downloadBtn = document.getElementById("download-btn");

if (downloadBtn) {
    downloadBtn.addEventListener("click", function() {
        window.print();
    });
}

const loginForm = document.getElementById("login-form");

if (loginForm) {
    loginForm.addEventListener("submit", function(event) {
        event.preventDefault();

        const email = document.getElementById("email").value.trim();
        const password = document.getElementById("password").value.trim();
        const role = document.getElementById("role").value;
        const loginMessage = document.getElementById("login-message");

        if (email === "" || password === "" || role === "") {
            loginmessage.textContent = "Please fill in all fields.";
            loginMessage.style.color = "#c0392b";
            return;
        }

        // Temporary: no backend yet, so we redirect purely based on selected role.
        // Later, this whole block gets replaced by an actual API call to
        // POST /api/auth/login, and the role comes back from the server's response.
        if (role === "student") {
            window.location.href = "dashboard.html";
        } else if (role === "trainer") {
            window.location.href = "trainer-dashboard.html";
        } else if (role === "admin") {
            window.location.href = "admin-dashboard.html";
        }
    });
}

const userEditButtons = document.querySelectorAll(".user-edit-btn");
const userSuspendButtons = document.querySelectorAll(".user-suspend-btn");
const userReactivateButtons = document.querySelectorAll(".user-reactivate-btn");

userEditButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const row = button.closest("tr");
        const name = row.querySelector("td").textcontent;
        alert("Edit user: " + name);
    });
});

userSuspendButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const row = button.closest("tr");
        const name = row.querySelector("td").textContent;
        const statusCell = row.querySelector(".status-badge");
        statusCell.textContent = "Suspended";
        statusCell.classList.remove("status-published");
        statusCell.classList.add("status-pending");
        alert(name + " has been suspended.");
    });
});

userReactivateButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        const row = button.closest("tr");
        const name = row.querySelector("td").textContent;
        const statusCell = row.querySelector(".status-badge");
        statusCell.textContent = "Active";
        statusCell.classList.remove("status-pending");
        statusCell.classList.add("status-published");
        alert(name + " has been reactivated.");
    });
});

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

    const categoryForm = document.getElementById("category-form");

    if (categoryForm) {
        const categoryList = document.getElementById("category-list");

        categoryForm.addEventListener("submit", function(event) {
            event.preventDefault();

            const nameInput = document.getElementById("category-name");
            const name = nameInput.value.trim();

            if (name === "") return;

            const newRow = document.createElement("tr");
            newRow.innerHTML = "<td>" + name + "</td>" + "<td>0</td>" + "<td><button class='category-delete-btn'>Delete</button></td>";
            categoryList.appendChild(newRow);
            attachCategoryDeleteEvent(newRow.querySelector(".category-delete-btn"));

            nameInput.value = "";
        });

        function attachCategoryDeleteEvent(button) {
            button.addEventListener("click", function() {
                button.closest("tr").remove();
            });
        }

        document.querySelectorAll(".category-delete-btn").forEach(attachCategoryDeleteEvent);
    }