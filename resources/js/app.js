require('./bootstrap');

window.Vue = require('vue')
import ViewUI from 'view-design';
import 'view-design/dist/styles/iview.css';
Vue.use(ViewUI);
import store from './store'

import router from './router'
import common from './common'
Vue.mixin(common)

Vue.component('mainapp', require('./components/mainapp.vue').default);


const app = new Vue({
    el: '#app ',
    router,
    store
});