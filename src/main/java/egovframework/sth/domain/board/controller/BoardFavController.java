package egovframework.sth.domain.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardFavDTO;
import egovframework.sth.domain.board.service.BoardFavService;

@RestController
public class BoardFavController {
	
	@Autowired
	BoardFavService service;

	@PostMapping("/board/fav")
	public Map<String, Integer> insFav(@RequestBody BoardFavDTO param) {
		Map<String, Integer> map = new HashMap<>();
		map.put("result", service.insFav(param));
		return map;
	}
	
	@GetMapping("/board/fav")
	public Map<String, BoardFavDTO> selFav(BoardFavDTO param) {
		Map<String, BoardFavDTO> map = new HashMap<>();
		map.put("result", service.selFav(param));
		return map;
	}
	// TODO: 회원정보 api정해지면 작성
//	@GetMapping("/")
//	public Map<String, List<BoardDTO>> selFavList(BoardFavDTO param) {
//		Map<String, List<BoardDTO>> map = new HashMap<String, List<BoardDTO>>();
//		map.put("data", service.selFavList(param));
//		
//		return map;
//	}
	
	@DeleteMapping("/board/fav")
	public Map<String, Integer> delFav(@RequestBody BoardFavDTO param) {
		Map<String, Integer> map = new HashMap<>();
		map.put("result", service.delFav(param));
		
		return map;
	}
}
