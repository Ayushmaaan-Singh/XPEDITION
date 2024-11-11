
    document.addEventListener("DOMContentLoaded", function() {
        // Select all elements with the 'book-b' class
        const bookButtons = document.querySelectorAll(".book-b");

        bookButtons.forEach(button => {
            button.addEventListener("click", function() {
                // Change button text to 'BOOKED'
                button.textContent = "BOOKED";
                
                // Set the button color to match the background color
                button.style.backgroundColor = "transparent"; // Match background color as needed
                button.style.color = "grey"; // Text color to make it subtle or disappear
                button.style.border = "none"; // Remove border for cleaner look
            });
        });
    });


