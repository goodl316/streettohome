package egovframework.sth.domain.board.mapper;

import java.util.List;

import javax.inject.Inject;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardViewVO;

@Mapper
public interface BoardMapper {
	
	BoardViewVO selBoardView(BoardDTO param);
	public List<BoardDTO> boardList(BoardDTO dto);
	int insBoard(BoardDTO dto);
	int updpatImg(BoardDTO dto);
	
}
