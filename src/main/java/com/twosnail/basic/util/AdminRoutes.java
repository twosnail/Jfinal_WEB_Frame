package com.twosnail.basic.util;

import com.jfinal.config.Routes;
import com.twosnail.basic.controller.IndexController;
import com.twosnail.basic.controller.UserController;

public class AdminRoutes extends Routes {

	@Override
	public void config() {
		add( "/" , IndexController.class  ) ;
		add( "/sys/user" , UserController.class  ) ;
	}

}