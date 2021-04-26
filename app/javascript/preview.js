document.addEventListener('DOMContentLoaded',function(){
  if (document.getElementById('movie_video_top')){
  const VideoList =document.getElementById('video_list');
  
 
    const createVideoHTML = (blob) =>{

    const VideoElement = document.createElement('div');

    const blobVideo = document.createElement('video');
    blobVideo.setAttribute('src',blob);

    VideoElement.appendChild(blobVideo);
    VideoList.appendChild(VideoElement);
  };

  document.getElementById('movie_video_top').addEventListener('change',function(e){

    const videoContent=document.querySelector('video');
    if(videoContent){
      videoContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createVideoHTML(blob);
    
    });
  }
});