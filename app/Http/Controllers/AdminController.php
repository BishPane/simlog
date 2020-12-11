<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class AdminController extends Controller
{
    
    public function index(Request $request){

        // check if logged in and admin/editor
        // return Auth::check(); returns 1 if logged in else nothing 
      
        if(!Auth::check() && $request->path() != 'login'){
            return redirect('/login');
        }
        if(!Auth::check() && $request->path() == 'login'){
            return view('welcome');
        }
        // u are already logged in check if u are admin user
        $user = Auth::user();
        $roles = $user->roles;

        // foreach($roles as $role){
        //     $rolename = $role->name;  
        //     $permission = $role->permission;

        // }
       
        //  return  $roles[0]->permission;
        // if($roles == 'User'){
        //     return redirect('/login');
        // }
        if($request->path() == 'login'){
            return redirect('/');

        }
        // return $this->checkForPermission($roles, $request);

          return view('welcome');

        //  return $request->path();
       
    }

    // public function checkForPermission($roles, Request $request){

    //     $permission = json_decode($roles[0]->permission);
    //     $hasPermission = false;
    //     if (!$permission)  return view('welcome');
    //     foreach($permission as $p) {
    //         if($p->name == $request->path() ){
    //             if($p->read){
    //                 $hasPermission = true;
    //             }
    //         }
    //     }

    //     if ($hasPermission)  return view('welcome');
    //     return 'error';


    // }

        function userLogin(Request $request){

            $this->validate($request, [
                'email' => 'bail|required|email',
                'password' => 'bail|required|min:6',
    
            ]);
    
                 if(Auth::attempt(['email'=> $request->email, 'password' => $request->password]))
                 {
                      
                    $user = Auth::user();
                    // $roles = $user->Roles;

                //   $f =  $roles[0] -> name;
                //   $s =  $roles[1] -> name;
                //   return $f.'  '.$s;
                    // foreach($roles as $role){
                    //     return $role;

                    // 
                    //   return $roles;
                    // return $user->role;
                    // Log::info($user->role);
                     
                    // foreach($roles as $role){
                    //     // echo $role->name;
                    //     if($role->name == "Admin" || $role->name == "Editor" || $role->name == "User"){
                        
                        
                   
                   
                   
                        return  response()->json([
                                            'msg' => 'You are logged in',
                                           
                                            'user' => $user
                                        ]);




                        //             }
                        //  }
                        
                        // Auth::logout();
                        // return response()->json([
                        //     'msg' => 'Incorrect login',
                        //     'test' => 'Test message'
                        // ], 401);
                    
                    // check if the roles is of user
                    // if($roles[0]->name == "User")
                        
                    //     {
                    //     Auth::logout();
                    //     return response()->json([
                    //         'msg' => 'Incorrect login',
                    //     ], 401);
                    // }
    
                    // return  response()->json([
                    //         'msg' => 'You are logged in',
                    //         'user' => $user
                    //     ]);
             
             // check if user has admin or editor role
            //  if(in_array("Admin",$roles) || in_array("Editor",$roles)){
            //     return  response()->json([
            //             'msg' => 'You are logged in',
            //             'user' => $user
            //         ]);
            //     }else{
            //         Auth::logout();
            //             return response()->json([
            //                 'msg' => 'Sorry you are a user not admin or editor',
            //             ], 401);

            //     }

             
             
                    }else{
                    return response()->json([
                        'msg' => 'No such email',
                    ], 401);
                }
    
    
    
        }
         
    
        public function logout(){

            Auth::logout();
            Session::flush();
          
            return redirect('/');
        }
               
        
        
        public function addUser(Request $request){
                    $this->validate($request, [
          
                        'userName' => 'required',
                        'email' => 'bail|required|email|unique:users',
                        'password' => 'bail|required|min:6',
                        'role_id' => 'required',
            
            
                    ]);
                    $password = bcrypt($request->password);
                    $role_id = $request->role_id;
                    // return $role_id[0];
                     $user = User::create([
                        'name' => $request->userName,
                        'email' => $request->email,
                        'password' => $password,
                        
                
                
                        ]) ;
                 
                  $role =Role::find($role_id);
                    $user->roles()->attach($role);
                        
                    return $user;

                }


                public function getUsers(){
                    return User::all();
                 }

                 function getRoles(){
                    return Role::all();
                }


                function assignPermission(Request $request){
                    $this->validate($request, [
                        'permission' => 'required',
                        'id' => 'required'
                    ]);
            
                    return Role::where('id', $request->id)->update([
                        'permission' => $request->permission 
                    ]);
                }
 }
