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
	
	public int insFav(BoardFavDTO param) {
		try {
			mapper.insFav(param);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public BoardFavDTO selFav(BoardFavDTO param) {
		return mapper.selFav(param);
	}
	
	public List<BoardDTO>selFavList(BoardFavDTO param) {
		return mapper.selFavList(param);
	}
	
	public int delFav(BoardFavDTO param) {
		try {
			mapper.delFav(param);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
