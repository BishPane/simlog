<template>
    <div>
        <div class="container-fluid">
					
				<div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20 col-md-4">
                            <div class="login_header">
                               
                                <h3>Login</h3>
                            </div>
                            <br/><br/>
                         <Input type="email" v-model="data.email" placeholder="Email"  /><br/><br/>
					     
                    <Input  type="password" v-model="data.password" placeholder="*******"  /><br/>
<br/>
                    <div class="login_footer">
                <Button type="primary" @click="login" :disabled="isLogging" :loading="isLogging" >{{isLogging ? 'Logging' : 'Login'}}

                </Button>
                    </div>
                   

				</div>
        </div>
			
    </div>
</template>
<script>
export default {
    data(){
        return {
            data: {
                email: '',
                password: ''
            },
            isLogging: false,

        }
    },
    methods: {
        async login(){

            if( this.data.email.trim() == '' )		{		return this.error("email name is required") }
			 if( this.data.password.trim() == '' )		{		return this.error("password is required") }
             if( this.data.password.length < 6 )		{		return this.error("Incorrect login details") }
           
           //if no data obj made              
        //const res = this.callApi('post','app/admin_login',{email:this.email, password:this.password})
        this.isLogging = true
        const res = await this.callApi('post','app/user_login',this.data)
        if(res.status === 200){
            this.success(res.data.msg)
            console.log(this.data);
             window.location = '/'
        }else{
            if(res.status === 401){
                this.info(res.data.msg)
            }else if(res.status==422){
                for(let i in res.data.errors){
					 this.error(res.data.errors[i][0])
                    
                    }
                
            }
            else{
								 this.somewentwrong() 
            }
        }
        this.isLogging = false

        }
    }
}
</script>
<style scoped>
._1adminOverveiw_table_recent{
    margin: 0 auto;
    margin-top: 250px;
}
.login_footer{
    text-align: center;

}
.login_header{
    text-align: center;

}

</style>