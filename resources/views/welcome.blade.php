<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

       <link rel="stylesheet" href="/css/all.css" />
      
    </head>
    <body>
      

    <div id="app">
    <h2>WELCOME</h2>

    @if(Auth::check())
    <mainapp :user="{{Auth::user()}}" :permission="{{ Auth::user()->roles[0]->permission }}"></mainapp>
    @else
    <mainapp :user="false"></mainapp>
    @endif
    </div>
      
    </body>
    <script src="{{mix('/js/app.js')}}"></script>
</html>
