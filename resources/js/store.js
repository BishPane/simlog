import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
export default new Vuex.Store({
    state: {
        user: false,
        userPermission: null
    },
    getters: {
        getLoggedInUser(state) {
            return state.user

        }
    },
    mutations: {
        setUpdateUser(state, data) {
            state.user = data
        },
        setUserPermission(state, data) {
            state.userPermission = data
        },

        logoutUser(state, data) {
            state.user = data
        }
    }

});