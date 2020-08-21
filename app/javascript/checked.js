function check() {
  const posts = document.getElementsByClassName("post");
  postsA = Array.from(posts);
  
  postsA.forEach(function (post) {
    if (post.getAttribute("data-load") != null) {
      return null;
    }
    post.setAttribute("data-load", "true");
    post.addEventListener("click", (e) => {
    //ここにクリックしたときに行う「何かしらの処理」を記述していく
      const postId = post.getAttribute("data-id");
      //idはURLパラメーターでサーバーにパラメーターとして送るもの
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/posts/${postId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const item = XHR.response.post;
        if (item.checked === true) {
          post.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          post.removeAttribute("data-check");
        }
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
        } else {
          return null;
        }
      }
      XHR.onerror = () => {
        alert("Request failed");
      };
    });
  });
}

setInterval(check, 1000);


