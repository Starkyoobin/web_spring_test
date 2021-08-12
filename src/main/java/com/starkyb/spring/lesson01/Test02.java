package com.starkyb.spring.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/test02")
@RestController
public class Test02 {
	@RequestMapping("/1")
	public List<Map<String, Object>> print() {
		List<Map<String, Object>> list = new ArrayList<>();	
		Map<String, Object> movie = new HashMap<String, Object>();
		{movie.put("rate", 5); movie.put("director", "봉준호"); movie.put("time", 131); movie.put("title", "기생충");};
		list.add(movie);
		movie = new HashMap<>();
		{movie.put("rate", 0); movie.put("director", "로베르토 베니니"); movie.put("time", 116); movie.put("title", "인생은 아름다워");};
		list.add(movie);
		movie = new HashMap<>();
		{movie.put("rate", 12); movie.put("director", "크리스토퍼 놀란"); movie.put("time", 147); movie.put("title", "인셉션");};
		list.add(movie);
		movie = new HashMap<>();
		{movie.put("rate", 19); movie.put("director", "윤종빈"); movie.put("time", 133); movie.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");};
		list.add(movie);
		movie = new HashMap<>();
		{movie.put("rate", 15); movie.put("director", "프란시스 로렌스"); movie.put("time", 137); movie.put("title", "헝거게임");};
		list.add(movie);
		
		return list;
	}
	
	@RequestMapping("/2")
	public List<JsonList> printBoard() {
		List<JsonList> board = new ArrayList<>();
		JsonList content = new JsonList();
		content.setTitle("안녕하세요 가입인사드립니다.");
		content.setUser("hagulu");
		content.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다.");
		board.add(content);
		content = new JsonList();
		content.setTitle("헐 대박");
		content.setUser("bada");
		content.setContent("오늘 목요일이었어...금요일인줄");
		board.add(content);
		content = new JsonList();
		content.setTitle("오늘 데이트한 이야기해드릴게요");
		content.setUser("dulumary");
		content.setContent("...");
		board.add(content);
		
		return board;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<JsonList> entity() {
		JsonList content = new JsonList();
		content.setTitle("안녕하세요 가입인사드립니다.");
		content.setUser("hagulu");
		content.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다.");

		ResponseEntity<JsonList> entity = new ResponseEntity<>(content, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
}
