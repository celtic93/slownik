show_the_answer.addEventListener('click', function() {
  spoiler.classList.add("hidden");
  show_the_answer.classList.add("hidden");
  answer.classList.remove("hidden");
  correct.classList.remove("hidden");
  wrong.classList.remove("hidden");
  document.getElementById('audio').play();
});

document.addEventListener('keydown', async function(input) {
  if (event.code === 'KeyS') {
    if (!show_the_answer.classList.contains("hidden")) show_the_answer.click();
  }
  if (event.code === 'KeyQ') {
    if (!correct.classList.contains("hidden")) correct.click();
  }
  if (event.code === 'KeyW') {
    if (!wrong.classList.contains("hidden")) wrong.click();
  }
});
