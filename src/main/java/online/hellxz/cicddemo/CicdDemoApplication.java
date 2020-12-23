package online.hellxz.cicddemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class CicdDemoApplication {

	@GetMapping("/test")
	public String test(){
		return "Deploy Success!";
	}

	public static void main(String[] args) {
		SpringApplication.run(CicdDemoApplication.class, args);
	}

}
