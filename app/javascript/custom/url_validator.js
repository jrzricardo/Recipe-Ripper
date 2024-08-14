document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('rip-recipe-form');
  const urlInput = document.getElementById('recipe-url-input');

  form.addEventListener('submit', function(event) {
    const url = urlInput.value.trim();
    if (!isValidUrl(url)) {
      event.preventDefault();
      alert('Please enter a valid URL');
    }
  });

  function isValidUrl(string) {
    try {
      new URL(string);
      return true;
    } catch (_) {
      return false;
    }
  }
});
