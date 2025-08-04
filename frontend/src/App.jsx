import React, { useEffect, useState } from 'react'

const API_URL = import.meta.env.VITE_API_URL

function App() {
  const [videos, setVideos] = useState([])

  useEffect(() => {
    fetch(`${API_URL}/videos`)
      .then(res => res.json())
      .then(data => setVideos(data))
  }, [])

  return (
    <div className="container mt-5">
      <h1 className="mb-4">Netflix Lite</h1>
      <div className="row">
        {videos.map(video => (
          <div className="col-md-4 mb-4" key={video.id}>
            <div className="card">
              <img src={video.thumbnail} className="card-img-top" alt={video.title} />
              <div className="card-body">
                <h5 className="card-title">{video.title}</h5>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

export default App
