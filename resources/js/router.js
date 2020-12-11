import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import home from './components/pages/home'
import users from './admin/pages/users'
import login from './admin/pages/login'
import assignPermission from './admin/pages/assignPermission'
const routes = [





    {
        path: '/home',
        component: home,
        name: "home"
    },
    {
        path: '/users',
        component: users,
        name: "users"
    },
    {
        path: '/login',
        component: login,
        name: 'login'

    },
    {
        path: '/assignPermission',
        component: assignPermission,
        name: 'assignPermission'

    },





]

export default new Router({
    mode: 'history',
    routes
})