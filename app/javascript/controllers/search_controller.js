import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["query", "posts"]

  connect() {
    console.log("hello from stimulus")
  }

  submit() {
    const value = this.queryTarget.value;
    
    Rails.ajax({
      type: "GET",
      url: `/?query=${value}`,
      success: (_data, _status, xhr) => {
        this.element.outerHTML = xhr.response
      }
    })
  //   fetch(`/?query=${value}`, {
  //     headers: { accept: 'application/json'}
  //   }).then((response) => response.json())
  //   .then(data => { 
  //    var postHTML, postArray ="";
  //    var postArray = Object.values(data)[0];

  //    postArray.forEach(cocktail => {
  //     postHTML += this.postTemplate(cocktail)
  //   });
  //    this.postsTarget.innerHTML = postHTML;
  //  });  
  }

  postTemplate(post) {
    return `<div>
      <h4>${post.name}</h4>
      <p>${post.description}</p>
    </div>`
  }
}
