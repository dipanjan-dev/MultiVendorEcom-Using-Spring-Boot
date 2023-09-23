package com.snaphunt.seller.Config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cloudinary.Cloudinary;

@Configuration
public class ProjectBean {
    

    @Bean
    public Cloudinary getCloudinary(){

        Map map= new HashMap();
        map.put("cloud_name", "dqptayy2x");
        map.put("api_key", "625756243449158");
        map.put("api_secret", "gzDfcRyQNLSxVNmwtf1WLon0vMI");
        map.put("secure", true);

        return new Cloudinary(map);
    }
}
