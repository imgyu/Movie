const images = document.querySelectorAll('.image-wrapper img');
const texts = document.querySelectorAll('.Slidefont h1');

let currentIndex = 0;

function showImage(index) {
  images.forEach((img, i) => {
    if (i === index) {
      img.style.display = 'block';
    } else {
      img.style.display = 'none';
    }
  });
  texts.forEach(text => text.classList.remove('active'));
  texts[index].classList.add('active');
}

function nextSlide() {
  currentIndex = (currentIndex + 1) % images.length;
  showImage(currentIndex);
}
// 최초 슬라이드 표시
showImage(currentIndex);
// 자동으로 다음 슬라이드로 넘어가기
setInterval(nextSlide, 8000); // 5000 밀리초(5초)마다 넘어감


// 이미지 슬라이드
document.addEventListener("DOMContentLoaded", function () {
  var slideMenu1 = document.querySelector(".SlideMenu1");
  var slideItems = document.querySelectorAll(".SlideMenu1 li");
  var totalSlides = slideItems.length;
  var currentIndex = 0;
  var slideWidth = slideItems[0].offsetWidth;

  // 초기 슬라이드 복제 및 추가
  for (var i = 0; i < totalSlides * 2; i++) {
    slideMenu1.appendChild(slideItems[i % totalSlides].cloneNode(true));
  }

  // '이전' 버튼 클릭 이벤트
  document.getElementById("prevBtn").addEventListener("click", function () {
    currentIndex--;
    updateSlidePosition();
  });

  // '다음' 버튼 클릭 이벤트
  document.getElementById("nextBtn").addEventListener("click", function () {
    currentIndex++;
    updateSlidePosition();
  });

  // 슬라이드 위치 업데이트 함수
  function updateSlidePosition() {
    var translateValue = -currentIndex * slideWidth;

    // 무한 롤링을 위해 transitions를 사용하지 않고 바로 위치를 조정
    slideMenu1.style.transition = "none";
    slideMenu1.style.transform = "translateX(" + translateValue + "px)";

    // 슬라이드가 끝까지 이동했을 때 초기 위치로 이동
    if (currentIndex >= totalSlides) {
      currentIndex = 0;
      setTimeout(function () {
        // transitions를 다시 적용하여 부드럽게 이동하도록 함
        slideMenu1.style.transition = "transform 0.4s ease-in-out";
        updateSlidePosition();
      }, 0);
    }

    // 슬라이드가 처음으로 이동했을 때 초기 위치로 이동
    else if (currentIndex < 0) {
      currentIndex = totalSlides - 1;
      setTimeout(function () {
        // transitions를 다시 적용하여 부드럽게 이동하도록 함
        slideMenu1.style.transition = "transform 0.4s ease-in-out";
        updateSlidePosition();
      }, 0);
    }
  }

  // 초기화 함수
  function initialize() {
    // 슬라이드 총 너비 설정
    slideMenu1.style.width = totalSlides * slideWidth + "px";

    // 초기 위치로 이동
    updateSlidePosition();
  }

  // 최초 초기화
  initialize();
});