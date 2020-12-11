<template>
    <div class="content">
        <div>
            	<div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
			
<div v-if="!$store.state.user">	
	  <li><router-link to="/login"> <Icon type="ios-speedometer" /> Login</router-link> 
	  </li></div>
					
					<div class="_overflow _table_div">
						<table class="_table">
								<!-- TABLE TITLE -->
							<tr>
								<th>Email</th>
								<th>User Name</th>
								<th>Roles</th>
								<th>Action</th>
							</tr>
								<!-- TABLE TITLE -->


								<!-- ITEMS -->
							<tr >
								<td>{{$store.state.user.email}}</td>
								<td >{{$store.state.user.name}}</td>
								<td >
										
								<li v-for="(role,index) in $store.state.user.roles" :key="index">
									{{ role.name}}
								</li>
								</td>
								
							
								<td>	   
									 <Button type="info" >Edit</Button>
										<Button type="error" >Delete</Button>

									
								</td>
							</tr>
							
					


						</table>
					</div>
				</div>
		
        </div>
        
    </div>
</template>
<script>


export default {
	
	data() {
		return {
			
		}
	},
	created(){
		console.log("HOME",$store.state.user);
	}
	
}
</script>