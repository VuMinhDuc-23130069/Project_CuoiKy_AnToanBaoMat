/////////////////////////////////////////////////////////////
// Trình chiếu ảnh
document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".slide");
    const dotsContainer = document.querySelector(".dots");
    let current = 0;

    // Tạo ul mới
    const ul = document.createElement('ul');
    ul.classList.add('slick-dots');
    dotsContainer.appendChild(ul);

    // Tạo <li> cho từng slide
    slides.forEach((_, index) => {
        const li = document.createElement('li');
        li.setAttribute('role', 'presentation');
        li.addEventListener('click', () => showSlide(index));
        ul.appendChild(li);
    });

    const dots = ul.querySelectorAll('li');

    // Hiển thị slide theo index
    function showSlide(index) {
        slides[current].classList.remove('active');
        dots[current].classList.remove('slick-active');

        current = (index + slides.length) % slides.length;

        slides[current].classList.add('active');
        dots[current].classList.add('slick-active');
    }

    // Sự kiện click cho nút điều hướng
    document.querySelector(".next-btn").addEventListener("click", () => showSlide(current + 1));
    document.querySelector(".prev-btn").addEventListener("click", () => showSlide(current - 1));

    // Khởi tạo slide đầu tiên
    showSlide(0);
});

/////////////////////////////////////////////////////////////


// Tự động đánh dấu menu active theo URL hiện tại
document.addEventListener('DOMContentLoaded', function () {
    const currentPath = window.location.pathname.replace(/\/+$/, ''); // loại bỏ trailing slash
    document.querySelectorAll('.main-nav a').forEach(link => {
        try {
            // Tạo URL đầy đủ từ href (để so sánh chính xác)
            const linkPath = new URL(link.getAttribute('href'), window.location.href).pathname.replace(/\/+$/, '');
            if (linkPath === currentPath || (linkPath === '' && currentPath === '/')) {
                // Đánh dấu active
                link.classList.add('active');
                link.setAttribute('aria-current', 'page'); // accessibility


                // Nếu  muốn đánh dấu <li> thay vì <a>:
                if (link.parentElement) link.parentElement.classList.add('active');
            }
        } catch (e) {
            // bỏ qua các hrefs không hợp lệ (mailto:, tel:, javascript:,...)
        }
    });
});
