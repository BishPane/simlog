<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        
        if($request->path()=='app/user_login'){
            return $next($request);

        }
        if(!Auth::check()){
            return response()->json([
                'msg' => 'Cant acess this route',
                'url' => $request->path()
            ], 403);
        }

         $user = Auth::user();
         $roles = $user->roles;
         foreach($roles as $role){
            if($role->name  == "User"){
                return response()->json([
                    'msg' => 'Cant acess this route'
                ], 403);
            }

         }
        //  if($user->roles->name == "User"){
        //      return response()->json([
        //          'msg' => 'Cant acess this route'
        //      ], 403);

        //  }

        return $next($request);
    }
}
