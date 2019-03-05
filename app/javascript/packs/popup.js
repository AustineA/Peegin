/* eslint no-console: 0 */

import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'

Vue.use(TurbolinksAdapter)
document.addEventListener('turbolinks:load', () => {
    const app = new Vue({
        el: '#popup',
        data: {
            download: false,
            isOpen: ''
        },
        methods: {
            close() {
                this.download = !this.download;
            },
            downloadApp() {
                localStorage.setItem('downloaded', true);
                this.isOpen = false

            },
            checkDownloadStatus() {
                if (localStorage.getItem('downloaded') === 'true') {
                    this.download = true;
                    this.isOpen = false;
                    console.log(localStorage.getItem('downloaded'));
                }
            }
        },
        created() {
            this.checkDownloadStatus();
        }
    })
})
