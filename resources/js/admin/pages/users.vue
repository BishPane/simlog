<template>
	<div>
		<div class="content">
			<div class="container-fluid">
				
				<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
				<div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
					
    <p class="_title0">Users <Button @click="addModal=true"><Icon type="md-add"  />Add User</Button></p>
					<div class="_overflow _table_div">
						<table class="_table">
								<!-- TABLE TITLE -->
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Role</th>
								<th>Email</th>
								<th>Action</th>
							</tr>
								<!-- TABLE TITLE -->


								<!-- ITEMS -->
									<tr v-for="(user,i) in users" :key="i" v-if="users.length">
								<td>{{user.id}}</td>
								<td class="_table_name">{{user.fullName}}</td>
                                <td>{{user.email}}</td>
                                <td>{{user.userType}}</td>
								<td>{{user.created_at}}</td>
								<td>
									    <Button type="info" size="small" >Edit</Button>
										<Button type="error" size="small" >Delete</Button>

									
								</td>
							</tr>
								<!-- ITEMS -->



						</table>
					</div>
				
		</div>
                        <!-- ADD MODAL -->
                        <Modal
                            v-model="addModal"
                            title="Add user"
                            :mask-closable='false'
                            :closabel="false"
                           >

                                   <Input v-model="data.userName" type="text" placeholder="Fullname"  /><br>
                                  
					  <Input v-model="data.email" type="email" placeholder="Email"  /><br>
					     
                    <Input v-model="data.password" type="password" placeholder="Password"  /><br>
                           
                         <!-- <Select v-model="data.role_id"  placeholder="Select admin type">
                                 <Option :value="role.id" v-for="(role, i) in roles" :key="i" v-if="roles.length">{{ role.name }}</Option>
                            </Select>   -->

        <table>
            <tr  v-for="(role, i) in roles" :key="i" v-if="roles.length">
                  <td>{{role.name}}</td> <input v-model="data.role_id" type="checkbox"  :value="role.id">
            </tr>
        </table>
         
  
      
        	                				
								



                                    <div slot="footer">
                                         <Button type="default" @click="addModal=false" >Close</Button>
                                        <Button type="primary" @click="add" :loading="isAdding" :disabled="isAdding">
                                            {{isAdding ? "Adding" : "Add user"}}
                                            </Button> 
                                     </div>
                        </Modal>
    </div>
		</div>
	</div>
</template>
<script>
export default {
    data() {
        return {
            data : {
                userName: '',
                email: '',
                password: '',
                role_id:[]

            },
            addModal: false,
            isAdding: false,
            roles: [],
            	users: [],
        }
    },

    methods: {
       
      async  add() {
          console.log("Role ids are: ", this.data.role_id);
            if(this.data.userName.trim() == '') return this.info("Name is required")
            if(this.data.email.trim() == '') return this.info("Email is required")
            if(this.data.password.trim() == '') return this.info("Password is required")

            const res = await this.callApi('post', '/app/create_user', this.data);
            if(res.status === 201) {
                this.success("User added succesfully");
                this.clear;
                this.addModal=false;
                
            }


        }
    },
    async created() {
      const [res, resRole] = await Promise.all([
			this.callApi('get', 'app/get_users'),
			this.callApi('get', 'app/get_roles')
		]);

		// const res = await this.callApi('get', 'app/get_users')
		if (res.status == 200){
			this.users = res.data
		}else{
			this.somewentwrong()
		}

		if (resRole.status == 200){
            this.roles = resRole.data
           
            
		}else{
			this.somewentwrong()
		}
    },
    computed:{
        clear() {
            this.data.userName = '';
            this.data.email= '';
            this.data.password= '';

        }
    }
}
</script>




			