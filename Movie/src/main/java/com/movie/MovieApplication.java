package com.movie;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
@MapperScan(value = {"com.movie.mapper"} )
@MapperScan(value = {"com.movie.user.mapper"} )
@MapperScan(value = {"com.movie.board.mapper"} )
@MapperScan(value = {"com.movie.cs.mapper"} )
public class MovieApplication {
	
	
	public static void main(String[] args) {
		SpringApplication.run(MovieApplication.class, args);
	}
	
	 @Bean
	   public  SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
	      SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
	      sqlSessionFactory.setDataSource(dataSource);
	      
	      // import org.springframework.core.io.Resource;
	      Resource[] res = new PathMatchingResourcePatternResolver()
	            .getResources("classpath:mapper/*.xml");
	      sqlSessionFactory.setMapperLocations(res);
	      
	      return sqlSessionFactory.getObject();
	   }
	
	 @Bean
	    public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
	        HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
	        return filter;
	    }
	 
	 

}
