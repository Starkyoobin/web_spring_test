package com.starkyb.spring.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starkyb.spring.lesson06.bo.FavoriteBO;
import com.starkyb.spring.lesson06.model.Favorite;

@Controller
@RequestMapping("/lesson06")
public class FavoriteController {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	@PostMapping("/add_favorite")
	@ResponseBody
	public Map<String, String> Favorite(
			@RequestParam("name") String name
			, @RequestParam("url") String url) {
		int count = favoriteBO.addFavorite(name, url);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/favorite_info")
	public String favoriteInfo(Model model) {
		List<Favorite> web = favoriteBO.getFavorite();
		model.addAttribute("results", web);
		
		return "lesson06/favoriteInfo";
	}
	
	@PostMapping("/is_duplication")
	@ResponseBody
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) {
		Map<String,Boolean> result = new HashMap<>();
		
		if(favoriteBO.isDuplication(url)) {
			result.put("isDuplication", true);
		} else {
			result.put("isDuplication", false);
		}
		
		return result;
	}
	
	@GetMapping("/favorite_delete")
	@ResponseBody
	public Map<String, String> delete(@RequestParam("favoriteId") int favoriteId) {
		int count = favoriteBO.deleteFavorite(favoriteId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
