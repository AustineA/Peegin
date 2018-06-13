/* eslint no-console: 0 */

import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

Vue.use(TurbolinksAdapter)
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#hello',
    data: {
      message: "Can you say hello?",
      counter: 0,
      toggle: true
    },
    components: { App },
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
