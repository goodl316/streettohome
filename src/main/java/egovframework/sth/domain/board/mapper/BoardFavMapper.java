package egovframework.sth.domain.board.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardFavDTO;

@Mapper
public interface BoardFavMapper {
	
	int insFav(BoardFavDTO param);
	BoardFavDTO selFav(BoardFavDTO param);
	List<BoardDTO> selFavList(BoardFavDTO param);
	int delFav(BoardFavDTO param);
	
}
