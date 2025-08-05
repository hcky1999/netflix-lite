import React, { useEffect, useState } from 'react'
import './App.css'

const API_URL = import.meta.env.VITE_API_URL

function App() {
  const [videos, setVideos] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    fetch(`${API_URL}/videos`)
      .then(res => {
        if (!res.ok) throw new Error('Failed to fetch videos')
        return res.json()
      })
      .then(data => {
        setVideos(Array.isArray(data) ? data : [])
        setLoading(false)
      })
      .catch(err => {
        setError(err.message)
        setLoading(false)
      })
  }, [])

  if (loading) {
    return (
      <div className="container mt-5 text-center">
        <div className="spinner-border text-danger" role="status">
          <span className="visually-hidden">Loading...</span>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="container mt-5">
        <div className="alert alert-danger" role="alert">
          Error: {error}
        </div>
      </div>
    )
  }

  return (
    <div className="netflix-app">
      <nav className="navbar navbar-dark bg-dark">
        <div className="container">
          <span className="navbar-brand mb-0 h1 text-danger">NETFLIX LITE</span>
        </div>
      </nav>
      
      <div className="container mt-4">
        <h2 className="text-white mb-4">Popular Movies</h2>
        
        {videos.length === 0 ? (
          <div className="text-center text-white">
            <p>No videos available. Add some videos to your DynamoDB table!</p>
          </div>
        ) : (
          <div className="row">
            {videos.map(video => (
              <div className="col-lg-3 col-md-4 col-sm-6 mb-4" key={video.id}>
                <div className="video-card">
                  <img 
                    src={video.thumbnail || 'https://via.placeholder.com/300x450/333/fff?text=No+Image'} 
                    className="video-thumbnail" 
                    alt={video.title} 
                  />
                  <div className="video-info">
                    <h6 className="video-title">{video.title}</h6>
                    {video.description && (
                      <p className="video-description">{video.description}</p>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}

export default App
