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