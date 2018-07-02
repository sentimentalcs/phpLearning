<?php 


Auth::guard()将会返回对应的guard实例
	1. Illuminate\Auth\AuthManager上的__call方法，并调用内部的guard()方法，$this->guard()->{$method}(...$parameters); //返回配置文件中设置的guard 一般为tokenGauard 或者seesionGuard
	2. guard()方法内部 会获取name参数来获取guard,没有则用config.auth.defaults.guard中的设置的guardName(默认一般是web)
		(1).如果Guard类型是Session则返回 Illuminate\Auth\SessionGuard
		(2).如果是token,则返回Illuminate\Auth\tokenGuard 
	以下是createSessionDriver的方法实现 （会返回sessionGuard或者TokenGuard）	
	3. 然后去获取config.auth.guard.guardName中的 $config = ['driver' => 'session','provider' => 'users'],
	4. 然后去调用 create{driver首字母大写(Session)}Driver 并将参数 $config和guardName传递给该函数;//CreateSeeionDriver方法
	5. CreateSeeionDriver方法内部就会去调用createUserProvder()方法，并以$config中的provider中的Provider为provider这里为users,
	   createUserProvder()方法会调用Illuminate\Auth\CreatesUserProviders::createUserProvder($provider)方法
	   	在该方法内部会去配置文件中找到auth.providers.users的配置$config2=['driver' => 'eloquent','model' => App\User::class]
	   	该驱动默认只有两个 一个是database,一个是eloquent，对应的方法分别是createDatabaseProvider，createEloquentProvider，并将上部得到的$config2传递给该方法。
	6.以其中的Eolquent为例：new EloquentUserProvider($this->app['hash'], $config2['model']);   	
	7.在该eloquentUserProvider内部 createModel()方法中会去实例化该$config2['model'];
	  并配合一些常用的方法
	  retrieveById()根据主键获取用户名
	  retrieveByToken()
	  updateRememberToken()
	  retrieveByCredentials()验证除了密码的字段 where条件过滤 返回用户model


	1  Illuminate\Auth\EloquentUserProvider 实现了 Illuminate\Contracts\Auth\UserProvider接口
	2. \app\User默认的auth类
			(1)implements  Illuminate\Contracts\Auth\Authenticatable
			(2)implements  Illuminate\Contracts\Auth\Access\Authorizable
			(3)implements  Illuminate\Contracts\Auth\CanResetPassword
			使用了(1)Illuminate\Auth\Authenticatable
				  (2)Illuminate\Foundation\Auth\Access\Authorizable	
				  (3)Illuminate\Auth\Passwords\CanResetPassword
    3. Guard中使用的provider是 eloquentUserProvider的实例				  



    Auth::方法名 调用 Illuminate\Auth\AuthManager不存在的方法将会调用__call()方法 并 调用自身的guard()->方法名 以下都是 调用guard中的方法名
     Auth::attempt()
     	其实这里面并没有验证字段  只是根据字段去查询用户 并将传递过来的密码与查出来的那个用户的密码进行匹配并返回匹配值
     	  0. 触发 fireAttemptEvent事件(用户可自定义)
          1. 调用 credentials数组 和 是否记住密码的参数
          $user = Guard调用provider中的retriveByCrendiental获得 provider中的一个实例 ->where($credentials)->first();
          2.检测该$user的password字段是否与传递过来的$credentials中的password字段是否相等
          3.如果成功  就调用login方法 将用户的model 存储在 Guard中的user属性上
          并发返回true,
          4.如果失败 则触发 fireFailedEvent($user, $credentials),并返回false

          $this->hasValidCredentials($user, $credentials)	
     Auth::user($id); $provider->retrieveById() ----> Illuminate\Auth\Authenticatable::getAuthIdentifierName() 调用model->getKeyName获取主键 并用where条件查出 $id=主键的 用户






      // Authentication Routes...
        $this->get('login', 'Auth\LoginController@showLoginForm')->name('login');
        $this->post('login', 'Auth\LoginController@login');
        $this->post('logout', 'Auth\LoginController@logout')->name('logout');

        // Registration Routes...
        $this->get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
        $this->post('register', 'Auth\RegisterController@register');

        // Password Reset Routes...
        $this->get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
        $this->post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
        $this->get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
        $this->post('password/reset', 'Auth\ResetPasswordController@reset');


        //用户注册的密码 默认是由
        Illuminate\Hashing\BcryptHasher 类中的make方法加密 实际上是由 password_hash()加密  
        验证密码的时候通过  Illuminate\Hashing\BcryptHasher\check方法进行验证密码 实际上是由 password_verify()方法进行验证