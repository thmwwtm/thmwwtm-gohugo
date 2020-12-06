const cookieContainer = document.querySelector(".cookie-container");
const cookieButton = document.querySelector(".cookie-btn");

window.doNotTrack = true;

cookieButton.addEventListener("click", () => {
  cookieContainer.classList.remove("active");
  localStorage.setItem("cookieBannerAccepted", "true");
});

setTimeout(() => {
  if (!localStorage.getItem("cookieBannerAccepted")) {
    cookieContainer.classList.add("active");
    window.doNotTrack = false;
  }
}, 2000);
