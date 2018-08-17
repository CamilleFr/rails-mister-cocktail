import Typed from 'typed.js';

function dynamicTitle(){
  new Typed("#main_title", {
    strings: ["Change your life, learn to drink"],
    typeSpeed: 40,
    loop: true
  })
}

export {dynamicTitle};
