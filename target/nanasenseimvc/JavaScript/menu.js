// Wait for the DOM to be fully loaded before executing the script
document.addEventListener('DOMContentLoaded', function() {
    // Select the burger menu element
    const burgerMenu = document.querySelector('.burger-menu');
    // Select the navigation list
    const nav = document.querySelector('.navigation ul');

    // Add click event listener to the burger menu
    burgerMenu.addEventListener('click', function() {
        // Toggle 'active' class on the burger menu
        this.classList.toggle('active');
        // Toggle 'active' class on the navigation list
        nav.classList.toggle('active');
    });
});

// Wait for the DOM to be fully loaded before executing the script
document.addEventListener('DOMContentLoaded', function() {
    // Select all menu links
    const menuLinks = document.querySelectorAll('.navigation ul li a');
    
    // Get the current page path
    const currentPath = window.location.pathname;

    menuLinks.forEach(link => {
        // Get the href attribute of the link
        const href = link.getAttribute('href');
        // Check if the link's href matches the current path
        if (currentPath.includes(href) && href !== '') {
            // Add 'active' class to the parent element (li) of the matching link
            link.parentElement.classList.add('active');
        } else {
            // Remove 'active' class from other elements
            link.parentElement.classList.remove('active');
        }
    });

    // Add click event listener to each link
    // Note: This part should be inside the forEach loop to work correctly
    link.addEventListener('click', function() {
        // Remove 'active' class from all menu items
        menuLinks.forEach(item => item.parentElement.classList.remove('active'));
        // Add 'active' class to the clicked item's parent
        this.parentElement.classList.add('active');
    });
});
