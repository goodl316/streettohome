package egovframework.sth.domain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardFavDTO;
import egovframework.sth.domain.board.mapper.BoardFavMapper;

@Service
public class BoardFavService {

	@Autowired
	BoardFavMapper mapper;
	
	public String insFav(BoardFavDTO param) {
		try {
			mapper.insFav(param);
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return "잠시 후 시도해 주세요.";
		}
	}
	
	public int selFav(BoardFavDTO param) {
		return mapper.selFav(param);
	}
	
	public List<BoardDTO>selFavList(BoardFavDTO param) {
		return mapper.selFavList(param);
	}
	
	public String delFav(BoardFavDTO param) {
		try {
			mapper.delFav(param);
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return "잠시 후 시도해 주세요.";
		}
	}
}
