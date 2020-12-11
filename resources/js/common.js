export default {
    data() {
        return {

        }
    },
    methods: {
        async callApi(method, url, dataObj) {

            try {
                return await axios({
                    method: method,
                    url: url,
                    data: dataObj
                });

            } catch (error) {
                return error.response
            }



        },

        info(desc, title = "hey") {
            this.$Notice.info({
                title: title,
                desc: desc
            });
        },
        success(desc, title = "Success") {
            this.$Notice.success({
                title: title,
                desc: desc
            });
        },
        warning(desc, title = "Warning") {
            this.$Notice.warning({
                title: title,
                desc: desc
            });
        },
        error(desc, title = "Error") {
            this.$Notice.error({
                title: title,
                desc: desc
            });
        },
        somewentwrong(desc = 'Something went wrong', title = "oops") {
            this.$Notice.error({
                title: title,
                desc: desc
            });
        },
    }
}