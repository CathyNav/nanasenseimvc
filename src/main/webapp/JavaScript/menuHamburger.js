document.addEventListener('DOMContentLoaded', function() {
    const burgerMenu = document.querySelector('.burger-menu');
    const nav = document.querySelector('.navigation ul');

    burgerMenu.addEventListener('click', function() {
        nav.classList.toggle('active');
    });
});