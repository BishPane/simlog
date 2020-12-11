<template>
   <div>
        <div class="content">
			<div class="container-fluid">
					
				<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
				<div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
					<p class="_title0">Assign  Permission
                        
                            <Select v-model="data.id"  placeholder="Select admin type" style="width:400px" @on-change="changeAdmin">
                                 <Option :value="role.id" v-for="(role, i) in roles" :key="i" v-if="roles.length">{{ role.name }}</Option>
                            </Select>                         
                         </p>

					<div class="_overflow _table_div">
						<table class="_table">
								<!-- TABLE TITLE -->
							<tr>
                                <th>Resource</th>
								<th>Read</th>
								<th>Write</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
								<!-- TABLE TITLE -->


								<!-- ITEMS -->
							<tr v-for="(r,i) in resources" :key="i">
								<td>{{r.resourceName}}</td>
								<td> <Checkbox v-model="r.read"></Checkbox></td>
								<td> <Checkbox v-model="r.write"></Checkbox></td>
								<td> <Checkbox v-model="r.update"></Checkbox></td> 			
                                <td> <Checkbox v-model="r.delete"></Checkbox></td> 										
								
							</tr>

                            <div>
                                <Button class="center_button" type="primary" :loading="isSendingtoServer" :disabled="isSendingtoServer" @click="assignRoles">Assign</Button>
                            </div>
							
					


						</table>
					</div>
				</div>
		

					
							

			</div>
		</div>
   </div>
</template>
<script>
import { mapGetters } from 'vuex'

export default {
	data() {
		return {
			data: {
                roleName: '',
                id: null
			},
			resources: [
                  {resourceName: 'Lists', read: false, write:false, update:false, delete:false, name: 'lists', },
                {resourceName: 'Users', read: false, write:false, update:false, delete:false, name: 'users', },
                {resourceName: 'Role', read: false, write:false, update:false, delete:false, name: 'role', },
                {resourceName: 'AssignPermission', read: false, write:false, update:false, delete:false, name: 'assignPermission', },
                {resourceName: 'Home', read: false, write:false, update:false, delete:false, name: 'home', },
             {resourceName: 'Posts', read: false, write:false, update:false, delete:false, name: 'posts', },


            ],
            defaultResourcesPermission: [
                  {resourceName: 'Lists', read: false, write:false, update:false, delete:false, name: 'lists', },
                {resourceName: 'Users', read: false, write:false, update:false, delete:false, name: 'users', },
                {resourceName: 'Role', read: false, write:false, update:false, delete:false, name: 'role', },
                {resourceName: 'AssignPermission', read: false, write:false, update:false, delete:false, name: 'assignPermission', },
                {resourceName: 'Home', read: false, write:false, update:false, delete:false, name: 'home', },
             {resourceName: 'Posts', read: false, write:false, update:false, delete:false, name: 'posts', },

            ],
			roles: [
              
            ],
            isSendingtoServer: false,

			
		}
	},
  
    

	methods: {
        async assignRoles() {
            // console.log(this.resources);
            let data = JSON.stringify(this.resources);
            // console.log("JSON stringify", data);
            const res = await this.callApi('post','app/assign_roles',{'permission': data, id: this.data.id})
            if( res.status == 200) {
                this.success("Role has been assigned")
                let index = this.roles.findIndex(role => role.id == this.data.id)
                this.roles[index].permission = data

            }else{
                this.somewentwrong()
            }

        },

        changeAdmin() {
            // console.log(this.data.id);
            let index = this.roles.findIndex(role => role.id == this.data.id)
            // console.log(index);
             
            let permission = this.roles[index].permission
            if(!permission){
                this.resources = this.defaultResourcesPermission
            }else{
                    this.resources = JSON.parse(permission)
            }

           
        }
	},

	async created() {
      
        console.log(this.$route);
		const res = await this.callApi('get', 'app/get_roles')
		if (res.status == 200){
            this.roles = res.data
            if(res.data.length){
                console.log(this.data.role);
                this.data.id = res.data[0].id
                  console.log('assigned id',this.data.id);

                  if(res.data[0].permission){
                      this.resources = JSON.parse(res.data[0].permission)
                  }
            }
            
		}else{
			this.somewentwrong()
		}
	}
}
</script>