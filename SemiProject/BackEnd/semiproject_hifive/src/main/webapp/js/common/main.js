// 이밴트 베너 부분
const nextBtn = document.querySelector('.nextBtn');
const slide = document.querySelector('.slide');
const slideLength = document.querySelectorAll('.slide li').length;
let currentSlide = 1;
const IMAGE_WIDTH = 1000;

// 다음 버튼 클릭
nextBtn.addEventListener('click', next);
function next() {
    console.log(currentSlide);

    if (currentSlide >= slideLength) {
        currentSlide = 0;
    }
    slide.style.transform = `translateX(-${IMAGE_WIDTH * currentSlide}px)`;
    currentSlide++;
}

const prevBtn = document.querySelector(".prevBtn");
// 이전 버튼 클릭
prevBtn.addEventListener('click', prev);
function prev() {
    if (currentSlide === 1) {
        currentSlide = slideLength;
    } else {
        currentSlide--;
    }
    slide.style.transform = `translateX(-${IMAGE_WIDTH * (currentSlide - 1)}px)`;
}