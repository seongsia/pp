youtube-viewer/
├── index.html
├── styles.css
└── script.js
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>YouTube Video Viewer</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <div class="container">
    <h1>YouTube Video Viewer</h1>
    <input type="text" id="search-input" placeholder="Enter YouTube video ID or URL">
    <button id="search-button">Display Video</button>
    <div id="video-container"></div>
  </div>
  <script src="script.js"></script>
</body>
</html>
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.container {
  text-align: center;
}

#video-container {
  margin-top: 20px;
}
document.getElementById('search-button').addEventListener('click', () => {
  const input = document.getElementById('search-input').value;
  const videoId = getVideoId(input);
  if (videoId) {
    displayVideo(videoId);
  } else {
    alert('Invalid YouTube video ID or URL');
  }
});

function getVideoId(url) {
  const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=|\/v=)([^#\&\?]*).*/;
  const match = url.match(regExp);
  return (match && match[2].length === 11) ? match[2] : null;
}

function displayVideo(videoId) {
  const videoContainer = document.getElementById('video-container');
  videoContainer.innerHTML = `
    <iframe width="560" height="315" src="https://www.youtube.com/embed/${videoId}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  `;
}


