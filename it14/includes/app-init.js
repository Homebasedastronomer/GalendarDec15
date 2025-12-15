document.addEventListener('DOMContentLoaded',function(){
  if(window.feather){try{feather.replace();}catch(e){}}
  if(window.AOS){try{AOS.init({duration:700,easing:'ease-out',once:true});}catch(e){}}
  // ESC to close any .modal.active
  document.addEventListener('keydown',function(e){
    if(e.key==='Escape'){
      document.querySelectorAll('.modal.active').forEach(function(m){m.classList.remove('active');});
    }
  });
});