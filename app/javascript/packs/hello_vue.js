/* eslint no-console: 0 */

import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'

Vue.use(TurbolinksAdapter)
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#hello',
    data: {
      message: "Can you say hello?",
      counter: 0,
      toggle: true
    },
    methods: {
      showEmAll(){
        var searchbar = document.getElementById('v3search');
        searchbar.style.display="inline";
        this.toggle = false;
      },

      hideEm(){
        var searchbar = document.getElementById('v3search');
        searchbar.style.display="none";
        this.toggle = true;
      }
    }
  })
})
