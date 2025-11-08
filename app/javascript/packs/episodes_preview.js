document.addEventListener("turbo:load", () => {
  document.querySelectorAll(".episode-card").forEach(card => {
    const preview = card.querySelector(".episode-preview");
    card.addEventListener("mouseenter", () => {
      preview.style.display = "block";
    });
    card.addEventListener("mouseleave", () => {
      preview.style.display = "none";
    });
  });
});
